package com.wqtang.api.file;

import com.wqtang.file.FileService;
import com.wqtang.object.vo.request.file.FileCommonDownloadRequest;
import com.wqtang.object.vo.response.file.FileCommonUploadResponse;
import com.wqtang.object.vo.response.file.FileUploadResponse;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/10
 */
@RestController
@RequestMapping("/file")
public class FileController {

    private static final Logger LOGGER = LoggerFactory.getLogger(FileController.class);

    @Resource(name = "fileService")
    private FileService fileService;

    /**
     * 通用的下载接口
     *
     * @param request
     * @return
     */
    @GetMapping("/common/download")
    public ResponseEntity<byte[]> commonDownload(FileCommonDownloadRequest request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return fileService.commonDownload(request);
    }

    /**
     * 通用的上传接口
     *
     * @param file
     * @return
     */
    @PostMapping("/common/upload")
    public synchronized FileCommonUploadResponse commonUpload(MultipartFile file) {
        return fileService.commonUpload(file);
    }

    /**
     * 本地图片上传(固件检测记录), 无需token
     *
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public synchronized FileUploadResponse upload(MultipartFile file) {
        return fileService.upload(file);
    }

}
