package org.sup2is.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.sup2is.model.FileInfo;
import org.sup2is.service.FileService;
import org.sup2is.util.JsonObject;

@Controller
@RequestMapping("file")
public class FileController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping( value ="/singleUploadImageAjax/{category}" , method = RequestMethod.POST)
	@ResponseBody
	public JsonObject singleUploadImageAjax(MultipartHttpServletRequest multipartRequest ,@PathVariable("category") String category) {
		
		
		Iterator<String> files = multipartRequest.getFileNames();
		String imageRex = "jpe?g|png|gif|bmp";
		
		if(files.hasNext()) {
			
		    String uploadFile = files.next();
            MultipartFile mFile = multipartRequest.getFile(uploadFile);
            String originalName = mFile.getOriginalFilename();
            String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase();
            
            Pattern pattern = Pattern.compile(imageRex);
			Matcher matcher = pattern.matcher(originalNameExtension);
			
			if(!matcher.find()) {
				return JsonObject.create(message.getMessage("invalid.fileType", null, Locale.getDefault()));
			}
				
			long fileSize = mFile.getSize();
			long limitFileSize = 1*1024*1024;
			if(limitFileSize < fileSize) {
				return JsonObject.create(message.getMessage("invalid.fileSize", null, Locale.getDefault()));
			}
			
			String defaultPath = multipartRequest.getServletContext().getRealPath("/");
			logger.info(defaultPath);
			String path = defaultPath + File.separator + "upload" + File.separator + category + File.separator + "images" + File.separator + "";
			
			File file = new File(path);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = dateFormat.format(new Date());
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." +originalNameExtension;
			
			String imageurl = multipartRequest.getServletContext().getContextPath() + "/upload/" + category+ "/images/" + modifyName; 
			
			FileInfo fileInfo = new FileInfo(modifyName, originalName, fileSize, imageurl, imageurl , category);
				
            try {
            	mFile.transferTo(new File(path+modifyName));
            	fileService.insertFile(fileInfo);
            	return JsonObject.create(fileInfo);
            } catch (Exception e) {
            	logger.error(e.getMessage());
            	return JsonObject.create(e);
            	
            }
		}else {
			return JsonObject.create(message.getMessage("invalid.fileNotFound", null, Locale.getDefault()));
		}
		
		
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
