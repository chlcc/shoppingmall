package org.sup2is.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.GoodsForm;
import org.sup2is.model.User;
import org.sup2is.service.AdminService;
import org.sup2is.service.UserService;
import org.sup2is.util.JsonObject;

@Controller
@RequestMapping("admin")
public class AdminController extends BaseController {

	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("add_goods")
	public String addGoods(@ModelAttribute GoodsForm form) {
		
		return "admin/add_goods";
	}
	@RequestMapping("dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}
	
	@RequestMapping(value = "goods" , method = RequestMethod.POST)
	@ResponseBody
	public JsonObject goods(@Valid @RequestBody GoodsForm form , BindingResult bindingResult){
		
		
		if(bindingResult.hasErrors()) {
			List<String> fieldErrors = new ArrayList<>();
			for(FieldError fieldError : bindingResult.getFieldErrors()) {
				fieldErrors.add(message.getMessage(fieldError.getCode(), fieldError.getArguments(), Locale.getDefault()));
			}
			return JsonObject.create(fieldErrors);
		}
		try {
			adminService.addGoods(form);
			return JsonObject.create();
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return JsonObject.create(e);
		}
	}
	
	@RequestMapping(value = "userAuth")
	public String userManage(Model model){
		List<User> userList = userService.findAll();
		for(User user : userList) {
			// String string = userService.findAuthByUserId(user.getUserId());
			user.setAuthority(userService.findAuthByUserId(user.getUserId()));
		}
		model.addAttribute("userList" , userList);
		
		return "admin/userAuth";
	}
	
	
	@RequestMapping(value = "userAuth" , method = RequestMethod.PUT)
	@ResponseBody
	public JsonObject updateUserAuth(@RequestBody Map<String,String> map , Model model){
		
		try {
			adminService.updateUserAuth(map);
			return JsonObject.create();
		}catch (Exception e) {
			e.printStackTrace();
			return JsonObject.create(e);
		}
	}
	
}
	
