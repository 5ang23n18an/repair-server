package com.wqtang.util;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.InputStream;
import java.util.List;

/**
 * @author Wenqian Tang
 * @date 2023/4/2
 */
@Component
public class ExcelUtils<T> {

    @Value("${file.rootDirectory}")
    private String rootDirectory;

    /**
     * 对List集合中的数据, 以Excel文件的形式导出.
     *
     * @param list
     * @param sheetName
     * @return
     */
    public File export(List<T> list, String sheetName) {
        File file = FileUtils.fileUniquenessProcessing(rootDirectory, sheetName + ".xlsx");
        EasyExcel.write().sheet(0, sheetName).doWrite(list);
        return file;
    }

    /**
     * 对Excel文件中的数据, 转换为指定类型的List集合.
     * 可以指定读取某个Excel Sheet, 如果未指定, 则默认读取第一个表单Sheet
     *
     * @param excelInputStream
     * @param clazz
     * @return
     */
    public List<T> resolve(InputStream excelInputStream, Class<T> clazz) {
        return resolve(excelInputStream, 0, clazz);
    }

    /**
     * 对Excel文件中的某个Sheet中的数据, 转换为指定类型的List集合.
     *
     * @param excelInputStream
     * @param sheetNo
     * @param clazz
     * @return
     */
    public List<T> resolve(InputStream excelInputStream, Integer sheetNo, Class<T> clazz) {
        ExcelReader excelReader = new ExcelReader();
        EasyExcel.read(excelInputStream, clazz, excelReader).sheet(sheetNo).doRead();
        return excelReader.getList();
    }

    private class ExcelReader extends AnalysisEventListener<T> {

        private final List<T> list = Lists.newArrayList();

        public List<T> getList() {
            return list;
        }

        /**
         * 每一条数据的解析方法
         *
         * @param data
         * @param context
         */
        @Override
        public void invoke(T data, AnalysisContext context) {
            list.add(data);
        }

        /**
         * 所有数据解析完毕后, 调用该方法
         *
         * @param context
         */
        @Override
        public void doAfterAllAnalysed(AnalysisContext context) {
        }

    }

}
