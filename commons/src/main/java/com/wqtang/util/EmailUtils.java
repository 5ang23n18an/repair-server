package com.wqtang.util;

import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.exception.BusinessException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
@Component
public class EmailUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(EmailUtils.class);

    @Value("${spring.mail.username}")
    private String from;

    @Resource
    private JavaMailSender mailSender;

    public void send(String to, String subject, String text) {
        send(new String[]{to}, subject, text);
    }

    public void send(String[] tos, String subject, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(tos);
        mailMessage.setSubject(subject);
        mailMessage.setText(text);
        LOGGER.info("mailMessage = {}", JsonUtils.getPrettyJson(mailMessage));
        try {
            mailSender.send(mailMessage);
        } catch (Exception e) {
            LOGGER.error("error message is {}", e.getMessage(), e);
            throw new BusinessException(ErrorEnum.ERROR, "邮件发送失败");
        }
    }

}
