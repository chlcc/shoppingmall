package org.sup2is.controller;


import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.sup2is.form.UserInfoForm;
import org.sup2is.service.UserService;
import org.sup2is.util.AES256Util;
import org.sup2is.util.Sha256Util;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinPage(@ModelAttribute UserInfoForm form) {

		return "/user/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@Valid UserInfoForm form, BindingResult bindingResult) throws Exception {

		logger.debug("user : {}", form);
		
		if (bindingResult.hasErrors()) {
			logger.debug("Binding Result has error!");
			
			List<ObjectError> error = bindingResult.getAllErrors();
			for(ObjectError errors : error) {
				logger.debug(errors.toString());
			}
			return "/user/join";
		}
		try {
			form.setPassword(Sha256Util.encrypt(form.getPassword()));
			form.setPhone(AES256Util.encrypt(form.getPhone()));
			userService.join(form);
		} catch (DuplicateKeyException duplicateKey) {
			logger.debug("duplicateKeyException");
			//TODO messageSource 적용해야함
			bindingResult.addError(new FieldError("userInfoForm", "userId", "invalid.exist"));
			return "/user/join";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error/error";
		}
		return "redirect:/user/login";
	}

	@RequestMapping("mypage")
	public String mypage() {
		return "/user/mypage";
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup() {
		return "/user/jusoPopup";
	}

}
