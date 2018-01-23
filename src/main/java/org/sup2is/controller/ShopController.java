package org.sup2is.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("shop")
public class ShopController extends BaseController{
	
	private Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@RequestMapping("detail")
	public String detailView() {
		return "shop/detail";
	}
	
	@RequestMapping("{category}")
	public String categoryView(@PathVariable("category") String category) {
			
		//TODO category를 넘겨 goods 테이블에서 일치하는 category를 반환하고 model에 뿌려주기
		
		
		return "shop/list";
	}
	
	

}
