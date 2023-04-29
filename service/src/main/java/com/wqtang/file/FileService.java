package com.wqtang.file;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.vo.request.file.FileCommonDownloadRequest;
import com.wqtang.object.vo.response.file.FileCommonUploadResponse;
import com.wqtang.object.vo.response.file.FileUploadResponse;
import com.wqtang.util.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/10
 */
@Service
public class FileService {

    @Value("${file.rootDirectory}")
    private String rootDirectory;
    @Value("${file.resultFileName}")
    private String resultFileName;

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

    public FileUploadResponse upload(MultipartFile image) throws Exception {
        // 保存上传的图片文件, 并返回该文件的存储位置的绝对路径
        String filePath = FileUtils.save(image, rootDirectory);
        // fixme: 调用python算法并等待解析结果
        Thread.sleep(6000L);
        // 解析完成后, 在指定路径处会生成一个result.txt文件
        File resultFile = new File(FilenameUtils.concat(rootDirectory, resultFileName));
        while (!resultFile.exists()) {
            // 循环等待result.txt文件的生成
        }
        // 读取result.txt文件
        List<String> list = FileUtils.readFileByLine(resultFile);
        if (list.size() != 5) {
            throw new BusinessException(ErrorEnum.ERROR, "未检测到所有动静接点，请放平手机重新拍摄");
        }
        // 删除result.txt文件
        FileUtils.delete(resultFile);
        // 封装响应结果信息
        FileUploadResponse response = new FileUploadResponse();
        response.setFileName(FilenameUtils.getName(filePath));
        response.setFlag(list.get(0));
        response.setDepth(list.get(1));
        response.setParamOne(list.get(2));
        response.setParamTwo(list.get(3));
        response.setParamThree(list.get(4));
        return response;
    }

}
