package org.sup2is.service;

import java.util.Map;

import org.sup2is.form.GoodsForm;

public interface AdminService {

	void addGoods(GoodsForm form);

	void updateUserAuth(Map<String, String> map);
	
}
