package org.sup2is.controller;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.CartForm;
import org.sup2is.model.Cart;
import org.sup2is.model.Goods;
import org.sup2is.service.CartService;
import org.sup2is.service.ShopService;
import org.sup2is.util.JsonObject;


@Controller
@RequestMapping("cart")
public class CartController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private ShopService shopService;

	@Autowired
	private CartService cartService;
	
	@RequestMapping(value = "" , method = RequestMethod.POST)
	@ResponseBody
	public JsonObject addGoods(@RequestBody CartForm cartForm, Principal principal) {
		
		if(principal == null) {
			return JsonObject.create(message.getMessage("login.require", null, Locale.getDefault()));
		}
		
		Goods goods = shopService.findGoodsByGno(cartForm.getGno());
		goods.setGoodsInfo(shopService.findGoodsInfoByGno(cartForm.getGno()));
		Cart cart = new Cart(principal.getName(),goods,cartForm.getCount());
		try {
			cartService.addGoods(cart);
			return JsonObject.create();
		}catch (Exception e) {
			e.printStackTrace();
			return JsonObject.create(e);
		}
	}
}