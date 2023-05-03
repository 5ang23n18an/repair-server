package com.wqtang.util;

import com.wqtang.object.enumerate.ErrorEnum;
import com.wqtang.object.exception.BusinessException;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * @author Wenqian Tang
 * @date 2023/5/2
 */
public class DecimalUtils {

    private DecimalUtils() {
    }

    /**
     * 提供精确的加法运算
     *
     * @param a
     * @param b
     * @return a+b
     */
    public static double add(double a, double b) {
        BigDecimal aa = new BigDecimal(a), bb = new BigDecimal(b);
        return aa.add(bb).doubleValue();
    }

    /**
     * 提供精确的减法运算
     *
     * @param a
     * @param b
     * @return a-b
     */
    public static double sub(double a, double b) {
        BigDecimal aa = new BigDecimal(a), bb = new BigDecimal(b);
        return aa.subtract(bb).doubleValue();
    }

    /**
     * 提供精确的乘法运算
     *
     * @param a
     * @param b
     * @return a*b
     */
    public static double mul(double a, double b) {
        BigDecimal aa = new BigDecimal(a), bb = new BigDecimal(b);
        return aa.multiply(bb).doubleValue();
    }

    /**
     * 提供精确的除法运算。当除不尽的时候，默认精确到小数点后10位并四舍五入
     *
     * @param a
     * @param b
     * @return a/b
     */
    public static double div(double a, double b) {
        return div(a, b, 10);
    }

    /**
     * 提供精确的除法运算。当除不尽的时候，由参数scale指定小数点位并四舍五入
     *
     * @param a
     * @param b
     * @param scale
     * @return a/b
     */
    public static double div(double a, double b, int scale) {
        if (scale < 0) {
            throw new BusinessException(ErrorEnum.ERROR, "精度不能为负数");
        }
        BigDecimal aa = new BigDecimal(a), bb = new BigDecimal(b);
        if (aa.compareTo(BigDecimal.ZERO) == 0) {
            return BigDecimal.ZERO.doubleValue();
        }
        return aa.divide(bb, scale, RoundingMode.HALF_UP).doubleValue();
    }

    /**
     * 提供精确的四舍五入的处理，由参数scale指定精确的小数点位。
     *
     * @param a
     * @param scale
     * @return
     */
    public static double round(double a, int scale) {
        if (scale < 0) {
            throw new BusinessException(ErrorEnum.ERROR, "精度不能为负数");
        }
        BigDecimal aa = new BigDecimal(Double.toString(a));
        return aa.divide(BigDecimal.ONE, scale, RoundingMode.HALF_UP).doubleValue();
    }

}
