package com.wqtang.config.kaptcha;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
@Configuration
public class KaptchaConfig {

    public static final String REDIS_KEY_PREFIX = "captcha:";

    @Bean(name = "textKaptcha")
    public DefaultKaptcha textKaptcha() {
        Properties properties = new Properties();
        // 验证码图片是否有边框
        properties.setProperty(Constants.KAPTCHA_BORDER, "yes");
        // 边框颜色
        properties.setProperty(Constants.KAPTCHA_BORDER_COLOR, "105,179,90");
        // 验证码图片宽度
        properties.setProperty(Constants.KAPTCHA_IMAGE_WIDTH, "160");
        // 验证码图片高度
        properties.setProperty(Constants.KAPTCHA_IMAGE_HEIGHT, "60");
        // 验证码文本字符的颜色
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_COLOR, "black");
        // 验证码文本字符的大小
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_SIZE, "38");
        // 验证码文本字符的字体
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_NAMES, "Arial,Courier");
        // 验证码文本字符的长度
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_CHAR_LENGTH, "4");
        properties.setProperty(Constants.KAPTCHA_SESSION_CONFIG_KEY, "kaptchaCode");
        // 图片样式,
        // 水纹: com.google.code.kaptcha.impl.WaterRipple
        // 鱼眼: com.google.code.kaptcha.impl.FishEyeGimpy
        // 阴影: com.google.code.kaptcha.impl.ShadowGimpy
        properties.setProperty(Constants.KAPTCHA_OBSCURIFICATOR_IMPL, "com.google.code.kaptcha.impl.ShadowGimpy");
        Config config = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }

    @Bean(name = "mathKaptcha")
    public DefaultKaptcha mathKaptcha() {
        Properties properties = new Properties();
        // 验证码图片是否有边框
        properties.setProperty(Constants.KAPTCHA_BORDER, "yes");
        // 边框颜色
        properties.setProperty(Constants.KAPTCHA_BORDER_COLOR, "105,179,90");
        // 验证码图片宽度
        properties.setProperty(Constants.KAPTCHA_IMAGE_WIDTH, "160");
        // 验证码图片高度
        properties.setProperty(Constants.KAPTCHA_IMAGE_HEIGHT, "60");
        // 验证码文本字符的颜色
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_COLOR, "black");
        // 验证码文本字符的大小
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_SIZE, "38");
        // 验证码文本字符的字体
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_NAMES, "Arial,Courier");
        // 验证码文本字符的长度
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_CHAR_LENGTH, "6");
        properties.setProperty(Constants.KAPTCHA_SESSION_CONFIG_KEY, "kaptchaCodeMath");
        // 验证码文本字符的生成器的类路径
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_IMPL, "com.wqtang.config.kaptcha.KaptchaTextProducer");
        // 图片样式,
        // 水纹: com.google.code.kaptcha.impl.WaterRipple
        // 鱼眼: com.google.code.kaptcha.impl.FishEyeGimpy
        // 阴影: com.google.code.kaptcha.impl.ShadowGimpy
        properties.setProperty(Constants.KAPTCHA_OBSCURIFICATOR_IMPL, "com.google.code.kaptcha.impl.ShadowGimpy");
        Config config = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }

}
