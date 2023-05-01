package com.wqtang.file;

import com.wqtang.object.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.vo.request.file.FileCommonDownloadRequest;
import com.wqtang.object.vo.response.file.FileCommonUploadResponse;
import com.wqtang.object.vo.response.file.FileUploadResponse;
import com.wqtang.util.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/10
 */
@Service
public class FileService {

    @Value("${file.rootDirectory}")
    private String rootDirectory;

    @Resource(name = "restTemplate")
    private RestTemplate restTemplate;

    public ResponseEntity<byte[]> commonDownload(FileCommonDownloadRequest request) throws Exception {
        String fileName = request.getFileName(), filePath = FilenameUtils.concat(rootDirectory, fileName);
        byte[] fileBytes = FileUtils.readAsBytes(filePath);
        if (BooleanUtils.isTrue(request.getDelete())) {
            FileUtils.delete(filePath);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(fileName, StandardCharsets.UTF_8.name()));
        headers.setCacheControl("no-cache, no-store, must-revalidate");
        headers.setPragma("no-cache");
        headers.setAccessControlAllowOrigin("*");
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .body(fileBytes);
    }

    public FileCommonUploadResponse commonUpload(MultipartFile file) {
        // 保存文件, 并返回该文件的存储位置的绝对路径
        String filePath = FileUtils.save(file, rootDirectory);
        FileCommonUploadResponse response = new FileCommonUploadResponse();
        response.setFileName(FilenameUtils.getName(filePath));
        return response;
    }

    public FileUploadResponse upload(MultipartFile image) {
        // 保存上传的图片文件, 并返回该文件的存储位置的绝对路径
        String imagePath = FileUtils.save(image, rootDirectory);
        // fixme: 调用python算法
        String serviceUrl = "?imagePath={imagePath}";
        String resultFileName = restTemplate.exchange(serviceUrl, HttpMethod.GET, new HttpEntity<>(getHttpHeaders()), String.class, imagePath).getBody();
        if (StringUtils.isBlank(resultFileName)) {
            throw new BusinessException(ErrorEnum.ERROR, "未检测到所有动静接点，请放平手机重新拍摄");
        }
        File resultFile = new File(FilenameUtils.concat(rootDirectory, resultFileName));
        // 读取算法解析结果文件
        List<String> list = FileUtils.readFileByLine(resultFile);
        if (list.size() != 5) {
            throw new BusinessException(ErrorEnum.ERROR, "未检测到所有动静接点，请放平手机重新拍摄");
        }
        // 读取完毕后, 删除该解析结果文件
        FileUtils.delete(resultFile);
        // 封装响应结果信息
        FileUploadResponse response = new FileUploadResponse();
        response.setFileName(FilenameUtils.getName(imagePath));
        response.setFlag(list.get(0));
        response.setDepth(list.get(1));
        response.setParamOne(list.get(2));
        response.setParamTwo(list.get(3));
        response.setParamThree(list.get(4));
        return response;
    }

    private HttpHeaders getHttpHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.ALL));
        headers.setConnection(com.google.common.net.HttpHeaders.KEEP_ALIVE);
        return headers;
    }

}
