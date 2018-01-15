package org.sup2is.model;

import lombok.Data;


@Data
public class FileInfo {

	private int bno;
	private String fileName;
	private String originalName;
	private long fileSize;
	private String url;
	private String originalUrl;

	
	public FileInfo() {
		
	}
	
	public FileInfo(String fileName , String originalName, long fileSize , String url , String originalUrl) {
		this.fileName = fileName;
		this.originalName = originalName;
		this.fileSize = fileSize;
		this.url = url;
		this.originalUrl = originalUrl;
	}
}
