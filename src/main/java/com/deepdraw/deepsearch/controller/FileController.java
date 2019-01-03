package com.deepdraw.deepsearch.controller;/**
 * Created by hasee on 2019/1/2.
 */

import com.deepdraw.deepsearch.enums.DownEnums;
import jnr.ffi.annotations.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author
 * @create 2019-01-02 18:16
 **/

@Controller
@RequestMapping("/File")
public class FileController {
    @Autowired
    private HttpServletRequest request;


    @Value("${file.uploadFolder}")
    private String uploadFolder;


    // 文件下载相关代码
    @RequestMapping("/downfile/{id}")
    public String downloadFile(HttpServletRequest request, HttpServletResponse response,  @PathVariable  String id) throws Exception {
        String fileName = DownEnums.getFileName(Integer.parseInt(id));// 设置文件名，根据业务需要替换成要下载的文件名

        if (fileName != null) {
            //设置文件路径
            String realPath = uploadFolder;
            File file = new File(realPath, fileName);
            if (file.exists()) {
                response.setContentType("application/force-download");// 设置强制下载不打开
//                //response.addHeader("Content-Disposition", "attachment;fileName=" + fileName);// 设置文件名
//                //response.setContentType("multipart/form-data;charset=UTF-8");也可以明确的设置一下UTF-8，测试中不设置也可以。
                response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("GB2312"), "ISO-8859-1"));

//                response.setHeader("content-type", "application/octet-stream");
//                response.setContentType("application/octet-stream");
//                response.setHeader("Content-Disposition", "attachment; filename=" + fileName);


                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                    System.out.println("下载成功");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return null;
    }

}


