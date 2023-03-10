package com.wqtang.api;

import com.wqtang.CaptchaService;
import com.wqtang.SystemConfigService;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.SystemConfigKeyEnum;
import com.wqtang.object.vo.response.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@RestController
public class CaptchaController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaController.class);

    @Resource(name = "captchaService")
    private CaptchaService captchaService;
    @Resource(name = "systemConfigService")
    private SystemConfigService systemConfigService;

    /**
     * 获取验证码图片
     *
     * @return
     */
    @GetMapping("/captchaImage")
    public Response getCaptchaImage() {
        if (!systemConfigService.isSystemConfigAvailable(SystemConfigKeyEnum.CAPTCHA.getKey())) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE);
        }
        try {
            return captchaService.getCaptchaImage();
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `CaptchaController.getCaptchaImage`, error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.ERROR, "Failed to get captcha image", "获取验证码图片失败");
        }
    }

}
