package org.sup2is.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.BoardForm;

@Repository
public class BoardRepositoryImpl implements BoardRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "org.sup2is.mapper.BoardRepository.";  
	
	@Override
	public void create(BoardForm form) {
		sqlSessionTemplate.insert(namespace + "write" , form);
		
	}
	
	
}
