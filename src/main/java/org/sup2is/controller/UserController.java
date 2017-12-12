package org.sup2is.controller;



import java.security.Principal;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;
import org.sup2is.service.UserService;
import org.sup2is.util.AES256Util;
import org.sup2is.util.Sha256Util;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping("mypage")
	public String mypage(Principal principal, Model model) throws Exception {
		
		String userId = principal.getName();
		
		User user = userService.findByUserId(userId);
		
		model.addAttribute("user" , user);
		
		return "/user/mypage";
	}
}
