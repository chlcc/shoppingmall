package org.sup2is.service;

import java.util.List;

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

	@Override
	public List<Cart> findCartListByUserId(String userId) {
		return cartRepository.findCartListByUserId(userId);
	}

	@Override
	public void removeGoods(int gno) {
		cartRepository.removeGoods(gno);
	}

}
