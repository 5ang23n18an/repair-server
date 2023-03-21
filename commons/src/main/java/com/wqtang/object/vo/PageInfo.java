package com.wqtang.object.vo;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
public class PageInfo {

    /**
     * 当前所在第几页
     */
    private int current;

    /**
     * 共有多少条数据
     */
    private int total;

    /**
     * 共有多少页
     */
    private int pages;

    /**
     * 当前分页的数据集合
     */
    private List<?> records;

    /**
     * 当前分页的数据条数
     */
    private int size;

    public PageInfo(int pageNumber, int pageSize, int total, List<?> records) {
        this.current = pageNumber;
        this.total = total;
        this.pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        this.records = records;
        this.size = records.size();
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public List<?> getRecords() {
        return records;
    }

    public void setRecords(List<?> records) {
        this.records = records;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

}
