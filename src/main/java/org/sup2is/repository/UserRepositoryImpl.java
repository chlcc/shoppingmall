package org.sup2is.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;

@Repository
public class UserRepositoryImpl implements UserRepository{

	private Logger logger = LoggerFactory.getLogger(UserRepository.class);
	
	private final  String namespace = "org.sup2is.mapper.UserRepository.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void join(UserInfoForm form) {
		sqlSessionTemplate.insert(namespace + "join", form);
	}

	@Override
	public User findByUserId(String userId) {
		return sqlSessionTemplate.selectOne(namespace + "findByUserId" , userId);
	}


}
