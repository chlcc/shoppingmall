package org.sup2is.repository;


import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.model.Cart;

@Repository
public class CartRepositoryImpl implements CartRepository{

	private Logger logger = LoggerFactory.getLogger(UserRepository.class);
	
	private final  String namespace = "org.sup2is.mapper.CartRepository.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void addGoods(Cart cart) {
		sqlSessionTemplate.insert(namespace + "addGoods" , cart);
	}
	
}
