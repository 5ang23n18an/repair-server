package com.wqtang.object.po.system;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.wqtang.object.po.BaseEntity;

/**
 * @author Wenqian Tang
 * @date 2023/4/6
 */
@ColumnWidth(20)
public class SystemDictionaryData extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 字典编码
     */
    @ExcelProperty("字典编码")
    private Long dictCode;

    /**
     * 字典排序
     */
    @ExcelProperty("字典排序")
    private Long dictSort;

    /**
     * 字典标签
     */
    @ExcelProperty("字典标签")
    private String dictLabel;

    /**
     * 字典键值
     */
    @ExcelProperty("字典键值")
    private String dictValue;

    /**
     * 字典类型
     */
    @ExcelProperty("字典类型")
    private String dictType;

    /**
     * 样式属性（其他样式扩展）
     */
    @ExcelIgnore
    private String cssClass;

    /**
     * 表格字典样式
     */
    @ExcelIgnore
    private String listClass;

    /**
     * 是否默认（Y是 N否）
     */
    @ExcelProperty("是否默认")
    private String isDefault;

    /**
     * 状态（0正常 1停用）
     */
    @ExcelProperty("状态")
    private String status;

    public Long getDictCode() {
        return dictCode;
    }

    public void setDictCode(Long dictCode) {
        this.dictCode = dictCode;
    }

    public Long getDictSort() {
        return dictSort;
    }

    public void setDictSort(Long dictSort) {
        this.dictSort = dictSort;
    }

    public String getDictLabel() {
        return dictLabel;
    }

    public void setDictLabel(String dictLabel) {
        this.dictLabel = dictLabel;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public String getListClass() {
        return listClass;
    }

    public void setListClass(String listClass) {
        this.listClass = listClass;
    }

    public String getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
