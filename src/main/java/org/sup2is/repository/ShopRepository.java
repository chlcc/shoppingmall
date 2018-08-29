package org.sup2is.repository;

import java.util.List;

import org.sup2is.model.Goods;
import org.sup2is.model.GoodsInfo;

public interface ShopRepository {

	List<Goods> getGoodsListByCategory(String category);

	Goods findGoodsByGno(int gno);
	
	GoodsInfo findGoodsInfoByGno(int gno);
}
