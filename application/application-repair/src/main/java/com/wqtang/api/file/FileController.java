package com.wqtang.api.file;

import com.wqtang.file.FileService;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.vo.request.file.FileCommonDownloadRequest;
import com.wqtang.object.vo.response.file.FileCommonUploadResponse;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
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
        LOGGER.info("`FileController.commonDownload`, request = {}", JsonUtils.getPrettyJson(request));
        try {
            return fileService.commonDownload(request);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `FileController.commonDownload`, error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_DOWNLOAD_FAIL);
        }
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
    public synchronized FileCommonUploadResponse upload(MultipartFile file) {
        return fileService.upload(file);
    }

}
