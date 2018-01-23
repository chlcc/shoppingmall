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
			
		//TODO category�� �Ѱ� goods ���̺��� ��ġ�ϴ� category�� ��ȯ�ϰ� model�� �ѷ��ֱ�
		
		
		return "shop/list";
	}
	
	

}
