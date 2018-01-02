package org.sup2is.service;

import java.util.List;

import org.sup2is.model.FileInfo;

public interface FileService {

	void insertFile(FileInfo fileInfo);

	List<FileInfo> getFileList(int bno);
	
}
