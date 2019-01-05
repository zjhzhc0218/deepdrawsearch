package com.deepdraw.deepsearch.controller;/**
 * Created by hasee on 2019/1/2.
 */

import com.deepdraw.deepsearch.entity.FileDownload;
import com.deepdraw.deepsearch.enums.DownEnums;
import com.deepdraw.deepsearch.service.FileDownloadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

    @Autowired
    private FileDownloadService fileDownloadService;


    @Value("${file.uploadFolder}")
    private String uploadFolder;

//    @RequestMapping("/greeting")
//    public String greeting(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
//        model.addAttribute("name", name);
//        return "greeting";
//    }
//    private static final Logger logger = LoggerFactory.getLogger(FileController.class);


    //文件上传相关代码
    @RequestMapping(value = "upload")
    @ResponseBody
    public String upload(@RequestParam("test") MultipartFile file) {
        if (file.isEmpty()) {
            return "文件为空";
        }
        // 获取文件名
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        System.out.println("上传的后缀名为：" + suffixName);
        // 文件上传后的路径
//        String filePath = "E://test//";
        String filePath = uploadFolder;
        // 解决中文问题，liunx下中文路径，图片显示问题
        // fileName = UUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);

           /*这里应该把数据保存到数据库中*/
            FileDownload fileDownload = new FileDownload();
            fileDownload.setFileName(fileName);
            /*对应数据后缀去划分对应内容  后续还要加TODO*/
            switch (suffixName){
                case ".txt":fileDownload.setFileType(1);
                case ".word":fileDownload.setFileType(2);
                case ".pdf":fileDownload.setFileType(3);
                case ".excel":fileDownload.setFileType(4);
            }
            fileDownload.setFileDownloadpath(fileName);
            fileDownloadService.insertSelective(fileDownload);

            return "上传成功";
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "上传失败";
    }

//    //文件下载相关代码
//    @RequestMapping("/download")
//    public String downloadFile(org.apache.catalina.servlet4preview.http.HttpServletRequest request, HttpServletResponse response){
//        String fileName = "FileUploadTests.java";
//        if (fileName != null) {
//            //当前是从该工程的WEB-INF//File//下获取文件(该目录可以在下面一行代码配置)然后下载到C:\\users\\downloads即本机的默认下载的目录
//            String realPath = request.getServletContext().getRealPath(
//                    "//WEB-INF//");
//            File file = new File(realPath, fileName);
//            if (file.exists()) {
//                response.setContentType("application/force-download");// 设置强制下载不打开
//                response.addHeader("Content-Disposition",
//                        "attachment;fileName=" + fileName);// 设置文件名
//                byte[] buffer = new byte[1024];
//                FileInputStream fis = null;
//                BufferedInputStream bis = null;
//                try {
//                    fis = new FileInputStream(file);
//                    bis = new BufferedInputStream(fis);
//                    OutputStream os = response.getOutputStream();
//                    int i = bis.read(buffer);
//                    while (i != -1) {
//                        os.write(buffer, 0, i);
//                        i = bis.read(buffer);
//                    }
//                    System.out.println("success");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                } finally {
//                    if (bis != null) {
//                        try {
//                            bis.close();
//                        } catch (IOException e) {
//                            e.printStackTrace();
//                        }
//                    }
//                    if (fis != null) {
//                        try {
//                            fis.close();
//                        } catch (IOException e) {
//                            e.printStackTrace();
//                        }
//                    }
//                }
//            }
//        }
//        return null;
//    }


    //多文件上传
//    @RequestMapping(value = "/batch/upload", method = RequestMethod.POST)
//    @ResponseBody
//    public String handleFileUpload(HttpServletRequest request) {
//        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
//                .getFiles("file");
//        MultipartFile file = null;
//        BufferedOutputStream stream = null;
//        for (int i = 0; i < files.size(); ++i) {
//            file = files.get(i);
//            if (!file.isEmpty()) {
//                try {
//                    byte[] bytes = file.getBytes();
//                    stream = new BufferedOutputStream(new FileOutputStream(
//                            new File(file.getOriginalFilename())));
//                    stream.write(bytes);
//                    stream.close();
//
//                } catch (Exception e) {
//                    stream = null;
//                    return "You failed to upload " + i + " => "
//                            + e.getMessage();
//                }
//            } else {
//                return "You failed to upload " + i
//                        + " because the file was empty.";
//            }
//        }
//        return "upload successful";
//    }



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


