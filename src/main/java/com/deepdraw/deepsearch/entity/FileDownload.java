package com.deepdraw.deepsearch.entity;

/**
 * 文件上传下载有关的数据库
 */
public class FileDownload {
    /**
     * 文件id 数据库字段是：file_id  <br>
     */
    private Integer fileId;

    /**
     * 文件类型 数据库字段是：file_type  <br>
     */
    private Integer fileType;

    /**
     * 文件标题 数据库字段是：file_name  <br>
     */
    private String fileName;

    /**
     * 文件图片地址 数据库字段是：file_picture  <br>
     */
    private String filePicture;

    /**
     * 文件下载地址 数据库字段是：file_downloadPath  <br>
     */
    private String fileDownloadpath;

    /**
     * 获取文件id
     * @return file_download.file_id
     */
    public Integer getFileId() {
        return fileId;
    }

    /**
     * 设置文件id
     * @param fileId 文件id
     */
    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    /**
     * 获取文件类型
     * @return file_download.file_type
     */
    public Integer getFileType() {
        return fileType;
    }

    /**
     * 设置文件类型
     * @param fileType 文件类型
     */
    public void setFileType(Integer fileType) {
        this.fileType = fileType;
    }

    /**
     * 获取文件标题
     * @return file_download.file_name
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * 设置文件标题
     * @param fileName 文件标题
     */
    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    /**
     * 获取文件图片地址
     * @return file_download.file_picture
     */
    public String getFilePicture() {
        return filePicture;
    }

    /**
     * 设置文件图片地址
     * @param filePicture 文件图片地址
     */
    public void setFilePicture(String filePicture) {
        this.filePicture = filePicture == null ? null : filePicture.trim();
    }

    /**
     * 获取文件下载地址
     * @return file_download.file_downloadPath
     */
    public String getFileDownloadpath() {
        return fileDownloadpath;
    }

    /**
     * 设置文件下载地址
     * @param fileDownloadpath 文件下载地址
     */
    public void setFileDownloadpath(String fileDownloadpath) {
        this.fileDownloadpath = fileDownloadpath == null ? null : fileDownloadpath.trim();
    }
}