package com.deepdraw.deepsearch.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

/**
 * 导出上传工具类
 */
public class ExportUtil {


    /**
     * 图片上传
     *
     * @param request
     * @return
     */
    public static String handleFileUpload_bak(HttpServletRequest request) {
        MultipartHttpServletRequest params = ((MultipartHttpServletRequest) request);
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("img");
        //String path = "C:\\Users\\hc\\Desktop\\img\\";
        String path = System.getProperty("file.separator") + "home" + System.getProperty("file.separator") + "deep" + System.getProperty("file.separator") + "app" + System.getProperty("file.separator")
                + "img" + System.getProperty("file.separator");
        //String path = "//home//deep//app//img//";
        //String path = "/home/deep/app/apache-tomcat-8.5.34/webapps/deepsearch/WEB-INF/classes/static/img/";
        MultipartFile file = null;
        BufferedOutputStream stream = null;
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
                try {
                    File fileTemp = new File(path + "codeImg.jpg");
                    //File fileTemp = new File("//home//deep//app//img//codeImg.jpg");
                    //File fileTemp = new File("/home/deep/app/apache-tomcat-8.5.34/webapps/deepsearch/WEB-INF/classes/static/img/codeImg.jpg");
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
                            new File(path + "codeImg.jpg")));
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

     public static String  handleFileUpload(HttpServletRequest request) throws IOException {

        //MultipartHttpServletRequest params = ((MultipartHttpServletRequest) request);
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("img");
       /*  String path = System.getProperty("file.separator") + "home" + System.getProperty("file.separator") + "deep" + System.getProperty("file.separator") + "app" + System.getProperty("file.separator")
                 + "img" + System.getProperty("file.separator");*/
         MultipartFile file = null;
        for (int i = 0; i < files.size(); ++i) {
            file =  files.get(i);
            File imagefile = convert(file);
                //InputStream input = new FileInputStream(imagefile);
            try {
                FileInputStream in=new FileInputStream(imagefile);
                boolean flag = FtpClientUtils.uploadFile("132.232.178.236", 22, "ubutu", "64JWrjAL9E9tEaL", "/home/deep/app/img/", "codeImg.jpg", in);
                System.out.println(flag);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

        }
        return "suee";
    }

    public static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException
    {
        File convFile = new File( multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
    }

    public  static File convert(MultipartFile file) throws IOException {
        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }
}
