package com.wqtang.config.kaptcha;

import com.google.code.kaptcha.text.impl.DefaultTextCreator;
import org.apache.commons.lang3.RandomUtils;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class KaptchaTextProducer extends DefaultTextCreator {

    private static final int ADD = 0;
    private static final int SUB = 1;
    private static final int MUL = 2;
    private static final int DIV = 3;
    private final StringBuffer textBuilder = new StringBuffer();

    @Override
    public String getText() {
        textBuilder.setLength(0);
        int x = RandomUtils.nextInt(0, 10), y = RandomUtils.nextInt(0, 10);
        int result = 0;
        int operand = RandomUtils.nextInt(0, 4);
        switch (operand) {
            case ADD:
                result = x + y;
                textBuilder.append(x).append("+").append(y);
                break;
            case SUB:
                if (x >= y) {
                    result = x - y;
                    textBuilder.append(x).append("-").append(y);
                } else {
                    result = y - x;
                    textBuilder.append(y).append("-").append(x);
                }
                break;
            case MUL:
                result = x * y;
                textBuilder.append(x).append("*").append(y);
                break;
            case DIV:
                if (x == 0 || y % x != 0) {
                    result = x + y;
                    textBuilder.append(x).append("+").append(y);
                } else {
                    result = y / x;
                    textBuilder.append(y).append("/").append(x);
                }
                break;
        }
        textBuilder.append("=?@").append(result);
        return textBuilder.toString();
    }

}
