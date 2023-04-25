package com.wqtang.api.repair;

import com.wqtang.object.po.repair.RepairTest;
import com.wqtang.repair.RepairTestService;
import com.wqtang.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/14
 */
@RestController
@RequestMapping("/repair/test")
public class RepairTestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RepairTestController.class);

    @Resource(name = "repairTestService")
    private RepairTestService repairTestService;

    /**
     * 获取检修记录列表
     *
     * @param request
     * @return
     */
    @GetMapping("/list")
    public List<RepairTest> getList(RepairTest request) {
        LOGGER.info("request = {}", JsonUtils.getPrettyJson(request));
        return repairTestService.listByParams(request);
    }

}
