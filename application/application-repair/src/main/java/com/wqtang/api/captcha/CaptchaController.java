package com.wqtang.api.captcha;

import com.wqtang.captcha.CaptchaService;
import com.wqtang.system.SystemConfigService;
import com.wqtang.exception.BusinessException;
import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.enumerate.SystemConfigEnum;
import com.wqtang.object.vo.response.captcha.GetCaptchaImageResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@RestController
@RequestMapping("/captcha")
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
    @GetMapping("/image")
    public GetCaptchaImageResponse getCaptchaImage() {
        if (!systemConfigService.isSystemConfigAvailable(SystemConfigEnum.CAPTCHA)) {
            throw new BusinessException(ErrorEnum.BUSINESS_REFUSE, "验证码功能暂不可用");
        }
        try {
            return captchaService.getCaptchaImage();
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.ERROR, "获取验证码图片失败");
        }
    }

}
