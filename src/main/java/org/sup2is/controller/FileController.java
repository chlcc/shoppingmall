package org.sup2is.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.sup2is.model.FileInfo;
import org.sup2is.service.FileService;

@Controller
@RequestMapping("file")
public class FileController {

	private Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping( value ="/singleUploadImageAjax" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> singleUploadImageAjax(MultipartHttpServletRequest multipartRequest) {
		
		Map<String, Object> jsonObj = new HashMap<>();
		
		Iterator<String> files = multipartRequest.getFileNames();
		String imageRex = "jpe?g|png|gif|bmp";
		
		while(files.hasNext()) {
			
		    String uploadFile = files.next();
            MultipartFile mFile = multipartRequest.getFile(uploadFile);
            String originalName = mFile.getOriginalFilename();
            String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase();
            
            Pattern pattern = Pattern.compile(imageRex);
			Matcher matcher = pattern.matcher(originalNameExtension);
			
			if(!matcher.find()) {
				jsonObj.put("result", "파일 형식이 맞지 않습니다.");
				break;
			}
				
			long fileSize = mFile.getSize();
			long limitFileSize = 1*1024*1024;
			if(limitFileSize < fileSize) {
				jsonObj.put("result", "파일 크기가 1메가 이상입니다.");
				break;
			}
			
			String defaultPath = multipartRequest.getServletContext().getRealPath("/");
			logger.info(defaultPath);
			String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "images" + File.separator + "";
			
			File file = new File(path);
			if(!file.exists()) {
				file.mkdir();
			}
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = dateFormat.format(new Date());
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." +originalNameExtension;
			
			
			String imageurl = multipartRequest.getServletContext().getContextPath() + "/upload/board/images/" + modifyName; 
			
			FileInfo fileInfo = new FileInfo(modifyName, originalName, fileSize, imageurl, imageurl);
				
			jsonObj.put("fileInfo", fileInfo);
			
            try {
            	
            	mFile.transferTo(new File(path+modifyName));
            	fileService.insertFile(fileInfo);
            } catch (Exception e) {
                e.printStackTrace();
            }
		}
		
		return jsonObj;
		
	}
	
	@RequestMapping( value ="/getFileList" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFileList(@RequestParam("bno")int bno) {
		
		Map<String, Object> jsonObj = new HashMap<>();
		List<FileInfo> fileList = fileService.getFileList(bno);
		jsonObj.put("fileList", fileList);
		
		return jsonObj;
	}
	
}
