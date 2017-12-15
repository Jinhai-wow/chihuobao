/**
 * 
 */
package com.chihuobao.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * @description 上传图片工具
 * @author 王锦海
 * @date 2017年12月8日
 * @version 1.0
 */
public class UploadImageUtil {
	private String randName;//随机重新取名
	private String ext;//图片后缀名
	private String fileName;
	private MultipartFile multipartFile;
//	private String filePath = "F:\\CHB\\image\\";
	private HttpSession session;
	private String fPath;  
	
//	public UploadImageUtil(MultipartFile multipartFile) {
//		this.multipartFile = multipartFile;
//	}
	
	//图片储存在本项目中
	public UploadImageUtil(MultipartFile multipartFile,HttpSession session) {
		this.multipartFile = multipartFile;
		this.session = session;
	}
	/**
	 * 获取输出的图片名
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public String getFileName() throws IllegalStateException, IOException{
		
		fPath = this.session.getServletContext().getRealPath("/")+"upload\\business\\";
		
		randName = UUID.randomUUID().toString().replaceAll("-", "");
		
		ext = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
		
		if (ext=="" | ext ==null) {
			return null;
		}
		fileName = randName+"."+ext;
		return fileName;
	}
	/**
	 * 把图片保存到硬盘
	 * @throws Exception
	 */
	public void saveToDisk() throws Exception {
//		multipartFile.transferTo(new File(filePath+fileName));
		multipartFile.transferTo(new File(fPath+fileName));
	}
}
