package org.sup2is.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sup2is.model.FileInfo;
import org.sup2is.repository.FileRepository;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private FileRepository fileRepository;
	
	@Override
	public void insertFile(FileInfo fileInfo) {
		fileRepository.insertFile(fileInfo);
	}

	@Override
	public List<FileInfo> getFileList(int bno) {
		return fileRepository.getFileList(bno);
	}
}
