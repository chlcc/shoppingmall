package org.sup2is.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class Mapper {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Bean
	public UserRepository userRepository(){
		return sqlSessionTemplate.getMapper(UserRepository.class);
	}
	
	
	
}
