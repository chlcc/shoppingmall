package org.sup2is.repository;

import java.util.List;

import org.sup2is.model.Goods;

public interface ShopRepository {

	List<Goods> getGoodsListByCategory(String category);
}
