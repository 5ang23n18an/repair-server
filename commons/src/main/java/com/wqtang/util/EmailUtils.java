package com.wqtang.util;

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

    @Value("${spring.mail.from}")
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
        LOGGER.info("`EmailUtils.send`, mailMessage = {}", JsonUtils.getPrettyJson(mailMessage));
        try {
            mailSender.send(mailMessage);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `EmailUtils.send`, error message is {}", e.getMessage(), e);
        }
    }

}
