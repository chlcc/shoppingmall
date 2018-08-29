package org.sup2is.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sup2is.model.Cart;
import org.sup2is.repository.CartRepository;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartRepository cartRepository;
	
	@Override
	public void addGoods(Cart cart) {
		cartRepository.addGoods(cart);
	}

}
