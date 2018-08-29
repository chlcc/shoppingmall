package org.sup2is.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sup2is.model.Goods;
import org.sup2is.model.GoodsInfo;
import org.sup2is.service.FileService;
import org.sup2is.service.ShopService;

@Controller
@RequestMapping("shop")
public class ShopController extends BaseController{
	
	private Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping("detail/{gno}")
	public String detailView(@PathVariable("gno") int gno, Model model) {
		Goods goods = shopService.findGoodsByGno(gno);
		goods.setGoodsInfo(shopService.findGoodsInfoByGno(gno));
		model.addAttribute("goods", goods);
		return "shop/detail";
	}
	
	
	
	@RequestMapping("{category}")
	public String categoryView(@PathVariable("category") String category, Model model) {
		List<Goods> goodsList = shopService.getGoodsListByCategory(category.replace(" ", ""));
		model.addAttribute("goodsList", goodsList);
		return "shop/list";
	}
	
	

}
