package org.sup2is.repository;

import java.util.List;
import java.util.Map;

import org.sup2is.model.FileInfo;

public interface FileRepository {
	
	void insertFile(FileInfo fileInfo);

	void setFileRno(Map<String, Object> param);

	List<FileInfo> getFileList(int bno);
	
}
