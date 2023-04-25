package com.wqtang.util;

import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
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
    private static final StringBuffer STRING_BUFFER = new StringBuffer();
    private static final int WRITE_BUFFER_SIZE = 8192;

    public static boolean isEmpty(MultipartFile multipartFile) {
        return multipartFile == null || multipartFile.isEmpty();
    }

    public static boolean isNotEmpty(MultipartFile multipartFile) {
        return !isEmpty(multipartFile);
    }

    /**
     * 将文件保存在指定的目录位置处
     *
     * @param multipartFile
     * @param targetDirPath
     * @return 该文件的最终保存位置的绝对路径
     */
    public static String save(MultipartFile multipartFile, String targetDirPath) {
        if (isEmpty(multipartFile)) {
            LOGGER.warn("multipartFile is null or empty, so don't need to save");
            return StringUtils.EMPTY;
        }
        try {
            File file = fileUniquenessProcessing(targetDirPath, multipartFile.getOriginalFilename());
            try (InputStream inputStream = multipartFile.getInputStream(); OutputStream outputStream = Files.newOutputStream(file.toPath())) {
                byte[] writeBuffer = new byte[WRITE_BUFFER_SIZE];
                int byteRead;
                while ((byteRead = inputStream.read(writeBuffer, 0, WRITE_BUFFER_SIZE)) != -1) {
                    outputStream.write(writeBuffer, 0, byteRead);
                }
            } catch (Exception e) {
                LOGGER.error("error message is {}", e.getMessage(), e);
                throw new BusinessException(ErrorEnum.FILE_WRITE_FAIL);
            }
            return file.getCanonicalPath();
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.FILE_WRITE_FAIL);
        }
    }

    /**
     * <p>1. 对目标文件夹进行判断, 如果该文件夹不存在会先进行创建</p>
     * <p>2. 对原文件名进行唯一化处理, 使得不会因"重名"等原因导致保存失败</p>
     *
     * @param targetDirPath
     * @param originalFileName
     * @return 唯一化处理后的File对象
     */
    public static File fileUniquenessProcessing(String targetDirPath, String originalFileName) {
        File targetDir = new File(targetDirPath);
        if (!targetDir.exists() && !targetDir.mkdirs()) {
            LOGGER.error("target directory is not exist and fail to create, targetDirPath = {}", targetDirPath);
            throw new BusinessException(ErrorEnum.FILE_WRITE_FAIL);
        }
        String processedFileName = fileNameUniquenessProcessing(originalFileName);
        return new File(FilenameUtils.concat(targetDirPath, processedFileName));
    }

    /**
     * 对原文件名进行唯一化处理, 使得不会因"重名"等原因导致保存失败
     *
     * @param originalFileName
     * @return 处理后的文件名
     */
    private static String fileNameUniquenessProcessing(String originalFileName) {
        STRING_BUFFER.setLength(0);
        // 假设原文件名: test.txt
        STRING_BUFFER
                // test
                .append(FilenameUtils.getBaseName(originalFileName))
                // test_
                .append("_")
                // test_1680421924166
                .append(System.currentTimeMillis())
                // test_1680421924166.
                .append(FilenameUtils.EXTENSION_SEPARATOR)
                // test_1680421924166.txt
                .append(FilenameUtils.getExtension(originalFileName));
        return STRING_BUFFER.toString();
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
                LOGGER.warn("no bytes are read, filePath = {}", file.getPath());
            }
            return bytes;
        } catch (Exception e) {
            LOGGER.error("filePath = {}, error message is {}", file.getPath(), e.getMessage(), e);
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
            LOGGER.error("filePath = {}, error message is {}", file.getPath(), e.getMessage(), e);
            return false;
        }
    }

}
