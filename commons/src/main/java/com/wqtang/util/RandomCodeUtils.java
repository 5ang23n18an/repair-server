package com.wqtang.util;

import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * @author Wenqian Tang
 * @date 2023/3/14
 */
public class RandomCodeUtils {

    public static String generateRandomDigits() {
        return generateRandomDigitsWithFixedLength(6);
    }

    /**
     * Generate a random code with fixed length of digits.
     *
     * @param length
     * @return
     */
    public static String generateRandomDigitsWithFixedLength(int length) {
        if (length <= 0) {
            return StringUtils.EMPTY;
        }
        if (length < 10) {
            int startInclusive = 1;
            for (int i = 0; i < length - 1; i++) {
                startInclusive *= 10;
            }
            int endExclusive = startInclusive * 10;
            return String.valueOf(RandomUtils.nextInt(startInclusive, endExclusive));
        }
        long startInclusive = 1L;
        for (int i = 0; i < length - 1; i++) {
            startInclusive *= 10L;
        }
        long endExclusive = startInclusive * 10L;
        return String.valueOf(RandomUtils.nextLong(startInclusive, endExclusive));
    }

}
