package org.sup2is.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.sup2is.form.UserInfoForm;


@Controller
@RequestMapping("user")
public class UserController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping(value = "join" , method = RequestMethod.GET)
	public String joinPage(@ModelAttribute UserInfoForm form) {
		
		return "/user/join";
	}
	
	@RequestMapping(value = "join" , method = RequestMethod.POST)
	public String join(@Valid UserInfoForm form , BindingResult bindingResult) {
		
		logger.debug("user : {}" , form);
		
		if(bindingResult.hasErrors()) {
			logger.debug("error : {}" , bindingResult);
			return "/user/join";
		}
		
		
		return "index";
	}
	
	
	
	
	
	
	
	
}
