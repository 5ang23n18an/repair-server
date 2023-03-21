package com.wqtang.controller;

import com.wqtang.object.vo.PageInfo;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
public abstract class AbstractPager<T> {

    /**
     * 分页查询
     *
     * @param request
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public PageInfo getPage(T request, int pageNumber, int pageSize) {
        int total = getPageTotal(request);
        int offset = (pageNumber - 1) * pageSize;
        // limit {offset}, {pageSize}
        List<?> records = getPageRecords(request, offset, pageSize);
        return new PageInfo(pageNumber, pageSize, total, records);
    }

    /**
     * 查询当前条件下, 共有多少条数据
     *
     * @param request
     * @return
     */
    public abstract int getPageTotal(T request);

    /**
     * 获取当前分页的数据集合
     *
     * @param request
     * @param offset
     * @param limit
     * @return
     */
    public abstract List<?> getPageRecords(T request, int offset, int limit);

}
