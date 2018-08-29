package org.sup2is.service;

import java.util.List;
import java.util.Map;

import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.model.Goods;
import org.sup2is.model.GoodsInfo;
import org.sup2is.util.PageNavigation;

public interface ShopService {

	List<Goods> getGoodsListByCategory(String category);

	Goods findGoodsByGno(int gno);

	GoodsInfo findGoodsInfoByGno(int gno);
	
}
