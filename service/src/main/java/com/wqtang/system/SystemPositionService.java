package com.wqtang.system;

import com.wqtang.object.po.system.SystemPosition;
import com.wqtang.util.ExcelUtils;
import com.wqtang.util.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Optional;

/**
 * @author Wenqian Tang
 * @date 2023/4/5
 */
@Service
public class SystemPositionService {

    @Resource(name = "systemPositionMapper")
    private SystemPositionMapper systemPositionMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemPosition> excelUtils;

    public List<SystemPosition> listByParams(SystemPosition position) {
        return systemPositionMapper.listByParams(position);
    }

    public ResponseEntity<byte[]> export(SystemPosition position) throws Exception {
        List<SystemPosition> list = listByParams(position);
        File file = excelUtils.export(list, "岗位数据");
        byte[] fileBytes = FileUtils.readAsBytes(file);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.name()));
        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .body(fileBytes);
    }

    public SystemPosition getById(Long postId) {
        return systemPositionMapper.getById(postId);
    }

    public boolean isPostNameDuplicated(SystemPosition position) {
        SystemPosition positionFromDb = systemPositionMapper.getByPostName(position.getPostName());
        Long postId = Optional.of(position.getPostId()).orElse(-1L);
        return positionFromDb != null && !postId.equals(positionFromDb.getPostId());
    }

    public boolean isPostCodeDuplicated(SystemPosition position) {
        SystemPosition positionFromDb = systemPositionMapper.getByPostCode(position.getPostCode());
        Long postId = Optional.of(position.getPostId()).orElse(-1L);
        return positionFromDb != null && !postId.equals(positionFromDb.getPostId());
    }

    public void insert(SystemPosition position) {
        systemPositionMapper.insert(position);
    }

    public void update(SystemPosition position) {
        systemPositionMapper.update(position);
    }

    public void batchDeleteByPostId(Long[] postIds) {
        systemPositionMapper.batchDeleteByPostId(postIds);
    }

}