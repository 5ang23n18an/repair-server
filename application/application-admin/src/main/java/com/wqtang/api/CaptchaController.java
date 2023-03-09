package com.wqtang.api;

import com.wqtang.CaptchaService;
import com.wqtang.SystemConfigService;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.SystemConfigKeyEnum;
import com.wqtang.object.vo.response.Response;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@RestController
public class CaptchaController {

    @Resource(name = "captchaService")
    private CaptchaService captchaService;
    @Resource(name = "systemConfigService")
    private SystemConfigService systemConfigService;

    @GetMapping("/captchaImage")
    public Response getCaptchaImage() {
        if (!systemConfigService.isSystemConfigAvailable(SystemConfigKeyEnum.CAPTCHA.getKey())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE);
        }
        try {
            return captchaService.getCaptchaImage();
        } catch (Exception e) {
            throw new BusinessException(ErrorEnum.ERROR, e.getMessage());
        }
    }

}
