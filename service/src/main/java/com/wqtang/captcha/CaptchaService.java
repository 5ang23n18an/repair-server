package com.wqtang.captcha;

import com.google.code.kaptcha.Producer;
import com.wqtang.object.enumerate.RedisKeyEnum;
import com.wqtang.object.vo.response.captcha.GetCaptchaImageResponse;
import com.wqtang.util.RedisUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FastByteArrayOutputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Service
public class CaptchaService {

    @Value("${captcha.timeout}")
    private int captchaTimeout;
    @Value("${captcha.type}")
    private String captchaType;

    @Resource(name = "textKaptcha")
    private Producer textKaptcha;
    @Resource(name = "mathKaptcha")
    private Producer mathKaptcha;
    @Resource(name = "redisUtils")
    private RedisUtils redisUtils;

    public GetCaptchaImageResponse getCaptchaImage() throws IOException {
        String captchaText, captchaCode;
        BufferedImage image;
        if ("math".equals(captchaType)) {
            captchaText = mathKaptcha.createText();
            int index = captchaText.lastIndexOf("@");
            captchaCode = captchaText.substring(index + 1);
            image = mathKaptcha.createImage(captchaText.substring(0, index));
        } else {
            captchaText = captchaCode = textKaptcha.createText();
            image = textKaptcha.createImage(captchaText);
        }
        // 随机生成一个key, 并将验证码的信息存入redis
        String uuid = UUID.randomUUID().toString();
        String redisKey = RedisUtils.getRedisKey(RedisKeyEnum.CAPTCHA, uuid);
        redisUtils.set(redisKey, captchaCode, captchaTimeout, TimeUnit.MINUTES);
        // 输出图片, 并返回响应
        try (FastByteArrayOutputStream outputStream = new FastByteArrayOutputStream()) {
            ImageIO.write(image, "jpg", outputStream);
            GetCaptchaImageResponse response = new GetCaptchaImageResponse();
            response.setUuid(uuid);
            response.setEncodedImage(Base64.getEncoder().encodeToString(outputStream.toByteArray()));
            return response;
        }
    }

}
