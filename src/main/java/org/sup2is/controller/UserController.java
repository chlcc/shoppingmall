package org.sup2is.controller;



import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sup2is.model.User;
import org.sup2is.service.UserService;

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
