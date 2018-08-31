package org.sup2is.service;

import java.util.List;

import org.sup2is.model.Cart;

public interface CartService {

	public void addGoods(Cart cart);

	public List<Cart> findCartListByUserId(String userId);

	public void removeGoods(int gno);
}
