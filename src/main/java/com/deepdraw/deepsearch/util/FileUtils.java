package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2019/1/11.
 */

//import com.sun.image.codec.jpeg.JPEGCodec;
//import com.sun.image.codec.jpeg.JPEGEncodeParam;
//import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

//import javax.swing.*;
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.awt.image.ConvolveOp;
//import java.awt.image.Kernel;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author
 * @create 2019-01-11 15:21
 **/
public class FileUtils {
    /** 文件转字节
     * @param file
     * @return
     */
    public static byte[] file2Byte(MultipartFile file) {
        byte[] buffer = null;
        ByteArrayOutputStream bos = null;
        try {
            InputStream inputStream = file.getInputStream();
            bos = new ByteArrayOutputStream(4096);
            byte[] b = new byte[4096];
            int n;
            while ((n = inputStream.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            file.getInputStream().close();
            bos.close();
            buffer = bos.toByteArray();
//            BASE64Encoder encoder = new BASE64Encoder();
//            base64photo = encoder.encode(buffer);
//            System.out.println("照片流64:" + encoder.encode(buffer));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bos != null) { bos.close(); }
            } catch (IOException e) {
            }
        }
        return buffer;
    }

//    /**
//     * 压缩图片
//     * @param b 图片的字节流
//     * @param newWidth 压缩的宽度
//     * @param quality 压缩质量 0-1之间float类型
//     * @return
//     * @throws IOException
//     */
//    public static String resize(byte[] b,int newWidth, float quality){
//        if (quality > 1) {
//            throw new IllegalArgumentException("Quality has to be between 0 and 1");
//        }
//        String baseStr = "";
//        ByteArrayOutputStream byteArrayOutputStream = null;
//        try{
//            ImageIcon ii = new ImageIcon(b);
//            Image i = ii.getImage();
//            Image resizedImage = null;
//
//            int iWidth = i.getWidth(null);
//            int iHeight = i.getHeight(null);
//
//            if (iWidth > iHeight) {
//                resizedImage = i.getScaledInstance(newWidth,(newWidth * iHeight)
//                        / iWidth,  Image.SCALE_SMOOTH);
//            } else {
//                resizedImage = i.getScaledInstance((newWidth * iWidth) / iHeight,
//                        newWidth, Image.SCALE_SMOOTH);
//            }
//
//            // This code ensures that all the pixels in the image are loaded.
//            Image temp = new ImageIcon(resizedImage).getImage();
//
//            // Create the buffered image.
//            BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null),
//                    temp.getHeight(null), BufferedImage.TYPE_INT_RGB);
//
//            // Copy image to buffered image.
//            Graphics g = bufferedImage.createGraphics();
//
//            // Clear background and paint the image.
//            g.setColor(Color.white);
//            g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));
//            g.drawImage(temp, 0, 0, null);
//            g.dispose();
//
//            // Soften.
//            float softenFactor = 0.05f;
//            float[] softenArray = {0, softenFactor, 0, softenFactor,
//                    1 - (softenFactor * 4), softenFactor, 0, softenFactor, 0};
//            Kernel kernel = new Kernel(3, 3, softenArray);
//            ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
//            bufferedImage = cOp.filter(bufferedImage, null);
//
//            byteArrayOutputStream = new ByteArrayOutputStream(4096);
//            // Encodes image as a JPEG data stream
//            JPEGImageEncoder imgEncoder = JPEGCodec.createJPEGEncoder(byteArrayOutputStream);
//            JPEGEncodeParam param = imgEncoder.getDefaultJPEGEncodeParam(bufferedImage);
//            param.setQuality(quality, true);
//            imgEncoder.setJPEGEncodeParam(param);
//            imgEncoder.encode(bufferedImage);
//
//            //转换成64字节码
//            BASE64Encoder encoder = new BASE64Encoder();
//            baseStr = encoder.encode(byteArrayOutputStream.toByteArray());
//        }catch (IOException e){
//            e.printStackTrace();
//        }
////        File resizedFile = new File("/Users/jennifer/Documents/11111.jpg");
////        FileOutputStream out = new FileOutputStream(resizedFile);
////        out.write(byteArrayOutputStream.toByteArray());
////        out.close();
//        return baseStr;
//    } // Example usage

}
