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
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/5
 */
@Service
public class SystemPositionService {

    @Resource(name = "systemPositionMapper")
    private SystemPositionMapper positionMapper;
    @Resource(name = "excelUtils")
    private ExcelUtils<SystemPosition> excelUtils;

    public List<SystemPosition> listAll() {
        return listByParams(null);
    }

    public List<SystemPosition> listByParams(SystemPosition position) {
        return positionMapper.listByParams(position);
    }

    public ResponseEntity<byte[]> export(SystemPosition position) throws UnsupportedEncodingException {
        List<SystemPosition> list = listByParams(position);
        File file = excelUtils.export(list, "岗位数据", SystemPosition.class);
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

    public SystemPosition getByPostId(Long postId) {
        return positionMapper.getByPostId(postId);
    }

    public boolean isPostNameDuplicated(SystemPosition position) {
        SystemPosition positionFromDb = positionMapper.getByPostName(position.getPostName());
        Long postId = position.getPostId() == null ? -1L : position.getPostId();
        return positionFromDb != null && !postId.equals(positionFromDb.getPostId());
    }

    public boolean isPostCodeDuplicated(SystemPosition position) {
        SystemPosition positionFromDb = positionMapper.getByPostCode(position.getPostCode());
        Long postId = position.getPostId() == null ? -1L : position.getPostId();
        return positionFromDb != null && !postId.equals(positionFromDb.getPostId());
    }

    public void insert(SystemPosition position) {
        positionMapper.insert(position);
    }

    public void update(SystemPosition position) {
        positionMapper.update(position);
    }

    public void batchDeleteByPostIds(Long[] postIds) {
        positionMapper.batchDeleteByPostIds(postIds);
    }

}
