package com.deepdraw.deepsearch.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

/**
 * 导出上传工具类
 */
public class ExportUtil {


    /**
     * 图片上传
     * @param request
     * @return
     */
    public static  String handleFileUpload(HttpServletRequest request) {
        MultipartHttpServletRequest params=((MultipartHttpServletRequest) request);
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("img");
     /*   String name=params.getParameter("name");
        System.out.println("name:"+name);
        String id=params.getParameter("id");
        System.out.println("id:"+id);*/
        String path = "/home/deep/app/apache-tomcat-8.5.34/webapps/deepsearch/WEB-INF/classes/static/img/";
        MultipartFile file = null;
        BufferedOutputStream stream = null;
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
                try {
                    File fileTemp = new File("/home/deep/app/apache-tomcat-8.5.34/webapps/deepsearch/WEB-INF/classes/static/img/codeImg.jpg");
                    // 判断文件是否存在
                    boolean falg = false;
                    falg = fileTemp.exists();
                    if (falg) {
                        falg = fileTemp.delete();
                        if (falg) {
                            System.out.println("成功删除图片文件");
                        }
                    }
                   byte[] bytes = file.getBytes();
                   /* stream = new BufferedOutputStream(new FileOutputStream(
                            new File(path+file.getOriginalFilename())));*/
                    stream = new BufferedOutputStream(new FileOutputStream(
                            new File(path+"codeImg.jpg")));
                    stream.write(bytes);
                   // String path="C:/Users/hc/Desktop/plugin"+file.getOriginalFilename();
                    //上传
                    //file.transferTo(new File(path));
                    System.out.print("ok");
                    stream.close();
                } catch (Exception e) {
                    stream = null;
                    return "You failed to upload " + i + " => "
                            + e.getMessage();
                }
            } else {
                return "You failed to upload " + i
                        + " because the file was empty.";
            }
        }
        return "suee";
    }



}
