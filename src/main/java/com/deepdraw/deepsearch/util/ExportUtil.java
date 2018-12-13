package com.deepdraw.deepsearch.util;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.SocketException;
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

     public static String handleFileUpload(HttpServletRequest request) throws IOException {

        //MultipartHttpServletRequest params = ((MultipartHttpServletRequest) request);
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("img");
       /*  String path = System.getProperty("file.separator") + "home" + System.getProperty("file.separator") + "deep" + System.getProperty("file.separator") + "app" + System.getProperty("file.separator")
                 + "img" + System.getProperty("file.separator");*/
         MultipartFile file = null;
        for (int i = 0; i < files.size(); ++i) {
            file =  files.get(i);
            File imagefile = convert(file);
            //创建ftp客户端
            FTPClient ftpClient = new FTPClient();
            ftpClient.setControlEncoding("GBK");
            String hostname = "132.232.178.236";
            int port = 21;
            String username = "ubutu";
            String password = "64JWrjAL9E9tEaL";
            try {
                //链接ftp服务器
                ftpClient.connect(hostname, port);
                //登录ftp
                ftpClient.login(username, password);
                int reply = ftpClient.getReplyCode();
                System.out.println(reply);
                //如果reply返回230就算成功了，如果返回530密码用户名错误或当前用户无权限下面有详细的解释。
                if (!FTPReply.isPositiveCompletion(reply)) {
                    ftpClient.disconnect();
                    return "erro";
                }
                ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
                ftpClient.changeWorkingDirectory("/home/deep/app/img/");
                //ftpClient.makeDirectory("path");//在root目录下创建文件夹
                String remoteFileName = "codeImg.jpg";
                InputStream input = new FileInputStream(imagefile);
                ftpClient.storeFile(remoteFileName, input);//文件你若是不指定就会上传到root目录下
                input.close();
                ftpClient.logout();

            } catch (SocketException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (ftpClient.isConnected()) {
                    try {
                        ftpClient.disconnect();
                    } catch (IOException ioe) {
                        ioe.printStackTrace();
                    }
                }

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
