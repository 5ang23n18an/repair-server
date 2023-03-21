package com.wqtang.controller;

import com.wqtang.object.vo.PageInfo;

import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/3/21
 */
public abstract class AbstractPager<T> {

    public PageInfo getPage(T request, int pageNumber, int pageSize) {
        int total = getPageTotal(request);
        int offset = (pageNumber - 1) * pageSize;
        List<?> records = getPageRecords(request, offset, pageSize);
        return new PageInfo(pageNumber, pageSize, total, records);
    }

    public abstract int getPageTotal(T request);

    public abstract List<?> getPageRecords(T request, int offset, int limit);

}
