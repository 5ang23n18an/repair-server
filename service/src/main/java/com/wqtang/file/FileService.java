package com.wqtang.file;

import com.wqtang.object.vo.request.file.FileCommonDownloadRequest;
import com.wqtang.object.vo.response.file.FileCommonUploadResponse;
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
import java.nio.file.Files;

/**
 * @author Wenqian Tang
 * @date 2023/3/10
 */
@Service
public class FileService {

    @Value("${file.rootDirectory}")
    private String rootDirectory;

    public ResponseEntity<byte[]> commonDownload(FileCommonDownloadRequest request) throws Exception {
        String fileName = request.getFileName(), filePath = FilenameUtils.concat(rootDirectory, fileName);
        byte[] fileBytes = FileUtils.readAsBytes(filePath);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(fileName, StandardCharsets.UTF_8.name()));
        headers.setCacheControl("no-cache, no-store, must-revalidate");
        headers.setPragma("no-cache");
        if (BooleanUtils.isTrue(request.getDelete())) {
            Files.delete(new File(filePath).toPath());
        }
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

    public FileCommonUploadResponse upload(MultipartFile file) {
        // 保存文件, 并返回该文件的存储位置的绝对路径
        String filePath = FileUtils.save(file, rootDirectory);
        // todo
        FileCommonUploadResponse response = new FileCommonUploadResponse();
        response.setFileName(FilenameUtils.getName(filePath));
        return response;
    }

}
