package org.sup2is.repository;

import java.util.List;

import org.sup2is.model.Cart;

public interface CartRepository {
	
	void addGoods(Cart cart);

	List<Cart> findCartListByUserId(String userId);

	void removeGoods(int gno);
}
