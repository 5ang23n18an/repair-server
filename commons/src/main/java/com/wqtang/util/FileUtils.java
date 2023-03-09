package com.wqtang.util;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class FileUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(FileUtils.class);
    private static final int WRITE_BUFFER_SIZE = 8192;
    private static final String SEPARATOR = "_";

    public static boolean isEmpty(MultipartFile multipartFile) {
        return multipartFile == null || multipartFile.isEmpty();
    }

    public static boolean isNotEmpty(MultipartFile multipartFile) {
        return !isEmpty(multipartFile);
    }

    public static String save(MultipartFile multipartFile, String targetDirPath) {
        if (isEmpty(multipartFile)) {
            LOGGER.warn("Unexpected condition occurs in `FileUtils.save`, due to multipartFile is null or empty");
            return "";
        }
        try {
            File file = new File(generateFilePath(targetDirPath, FilenameUtils.getName(multipartFile.getOriginalFilename())));
            String absolutePath = file.getCanonicalPath();
            String dirPath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));
            File dir = new File(dirPath);
            if (!dir.exists() && !dir.mkdirs()) {
                LOGGER.error("Unexpected exception occurs in `FileUtils.save`, due to directory create failed, dirPath = {}", dirPath);
                throw new BusinessException(ErrorEnum.FILE_WRITE_FAIL);
            }
            try (InputStream inputStream = multipartFile.getInputStream(); OutputStream outputStream = Files.newOutputStream(file.toPath())) {
                byte[] writeBuffer = new byte[WRITE_BUFFER_SIZE];
                int byteRead;
                while ((byteRead = inputStream.read(writeBuffer, 0, WRITE_BUFFER_SIZE)) != -1) {
                    outputStream.write(writeBuffer, 0, byteRead);
                }
            } catch (Exception e) {
                LOGGER.error("Exception occurs in `FileUtils.save`, error message is {}", e.getMessage(), e);
                throw new BusinessException(ErrorEnum.FILE_WRITE_FAIL);
            }
            return absolutePath;
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `FileUtils.save`, error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_WRITE_FAIL);
        }
    }

    private static String generateFilePath(String dirPath, String fileName) {
        return dirPath + File.separatorChar + FilenameUtils.getBaseName(fileName) + SEPARATOR + System.currentTimeMillis() + FilenameUtils.EXTENSION_SEPARATOR + FilenameUtils.getExtension(fileName);
    }

    public static byte[] readAsBytes(String filePath) {
        return readAsBytes(new File(filePath));
    }

    public static byte[] readAsBytes(File file) {
        if (!file.exists()) {
            return new byte[0];
        }
        try (InputStream inputStream = Files.newInputStream(file.toPath())) {
            byte[] bytes = new byte[inputStream.available()];
            if (inputStream.read(bytes) == 0) {
                LOGGER.warn("BusinessException occurs in `FileUtils.readAsBytes`, due to no bytes are read, filePath = {}", file.getPath());
            }
            return bytes;
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `FileUtils.readAsBytes`, filePath = {}, error message is {}", file.getPath(), e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_READ_FAIL);
        }
    }

    public static boolean delete(String filePath) {
        return delete(new File(filePath));
    }

    public static boolean delete(File file) {
        if (!file.exists()) {
            return true;
        }
        try {
            Files.delete(file.toPath());
            return true;
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `FileUtils.delete`, filePath = {}, error message is {}", file.getPath(), e.getMessage(), e);
            return false;
        }
    }

}
