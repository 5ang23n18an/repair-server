package com.wqtang.object.vo.response.captcha;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class GetCaptchaImageResponse {

    private String uuid;
    private String encodedImage;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getEncodedImage() {
        return encodedImage;
    }

    public void setEncodedImage(String encodedImage) {
        this.encodedImage = encodedImage;
    }

}
