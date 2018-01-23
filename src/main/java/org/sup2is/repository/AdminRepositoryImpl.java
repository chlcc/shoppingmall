package org.sup2is.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.GoodsForm;

@Repository
public class AdminRepositoryImpl implements AdminRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "org.sup2is.mapper.AdminRepository.";  
	
	@Override
	public void addGoods(GoodsForm form) {
		sqlSessionTemplate.insert(namespace + "addGoods" , form);
	}

	@Override
	public void addGoodsInfo(Map<String, Integer> param) {
		sqlSessionTemplate.insert(namespace + "addGoodsInfo" , param);
	}
	
}
