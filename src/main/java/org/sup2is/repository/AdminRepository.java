package org.sup2is.repository;

import java.util.Map;

import org.sup2is.form.GoodsForm;

public interface AdminRepository {
	
	void addGoods(GoodsForm form);

	void addGoodsInfo(Map<String, Integer> param);

	void updateUserAuth(Map<String, String> map);
	
}
