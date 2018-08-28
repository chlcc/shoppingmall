package org.sup2is.repository;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.model.Goods;

@Repository
public class ShopRepositoryImpl implements ShopRepository{

	private Logger logger = LoggerFactory.getLogger(UserRepository.class);
	
	private final  String namespace = "org.sup2is.mapper.ShopRepository.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Goods> getGoodsListByCategory(String category) {
		return sqlSessionTemplate.selectList(namespace + "getGoodsListByCategory", category);
	}
}
