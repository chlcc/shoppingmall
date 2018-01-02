package org.sup2is.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.model.FileInfo;

@Repository
public class FileRepositoryImpl implements FileRepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "org.sup2is.mapper.FileRepository.";  
	
	@Override
	public void insertFile(FileInfo fileInfo) {
		sqlSessionTemplate.insert(namespace + "insertFile" , fileInfo);
	}

	@Override
	public void setFileBno(Map<String, Object> filenames) {
		sqlSessionTemplate.update(namespace + "setFileBno" , filenames);
	}

	@Override
	public List<FileInfo> getFileList(int bno) {
		return sqlSessionTemplate.selectList(namespace + "getFileList" , bno);
	}

}
