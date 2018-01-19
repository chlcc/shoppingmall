package org.sup2is.controller;



import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;
import org.sup2is.service.UserService;
import org.sup2is.util.JsonObject;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("mypage")
	public String mypage(Principal principal, Model model, @ModelAttribute UserInfoForm userInfoForm) throws Exception {
		String userId = principal.getName();
		User user = userService.findByUserId(userId);
		model.addAttribute("user" , user);
		return "/user/mypage";
	}
	
	@RequestMapping(value= "modify" , method = RequestMethod.PUT)
	@ResponseBody
	public JsonObject modify (@RequestBody @Valid UserInfoForm form , BindingResult bindingResult, Principal principal) throws Exception {
		
		
		if(bindingResult.hasErrors()) {
			List<String> fieldErrors = new ArrayList<>();
			for(FieldError fieldError : bindingResult.getFieldErrors()) {
				if(fieldError.getField().equals("password"))
					return JsonObject.create(message.getMessage("invalid.access", null, Locale.getDefault()));
				fieldErrors.add(message.getMessage(fieldError.getCode(), fieldError.getArguments(), Locale.getDefault()));
			}
			
			return JsonObject.create(fieldErrors);
		}
		
		String userId = principal.getName();
		User user = userService.findByUserId(userId);
		
		if(!passwordEncoder.matches(form.getPassword(), user.getPassword())) {
			return JsonObject.create(message.getMessage("invalid.access", null, Locale.getDefault()));
		}
		
		user.setAddress(form.getAddress());
		user.setAddress_detailed(form.getAddress_detailed());
		user.setEmail(form.getEmail());
		user.setPhone(form.getPhone());
		
		try {
			userService.modify(user);
			return JsonObject.create();
		}catch (Exception e) {
			logger.error(e.getMessage());
			return JsonObject.create(e);
		}
	}
}
