package org.sup2is.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.LoginForm;
import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;
import org.sup2is.service.UserService;

@Controller
public class MainContorller extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(MainContorller.class);

	@Autowired
	private UserService userService;

	@Autowired
	private MessageSource message;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@ModelAttribute LoginForm form, BindingResult bindingResult, HttpServletRequest request,
			@RequestParam(value = "error" , required = false)String error) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);
		
		if(error != null) {
			bindingResult.addError(new FieldError("loginForm", "password", message.getMessage("invalid.access", null, Locale.getDefault())));
		}
		
		return "/login";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinPage(@ModelAttribute UserInfoForm form) {
		return "/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@Valid UserInfoForm form, BindingResult bindingResult) throws Exception {

		logger.debug("user : {}", form);

		if (bindingResult.hasErrors()) {
			logger.debug("Binding Result has error!");

			List<ObjectError> error = bindingResult.getAllErrors();
			for (ObjectError errors : error) {
				logger.debug(errors.toString());
			}
			return "/join";
		}
		try {
			form.setPassword(passwordEncoder.encode(form.getPassword()));
//			form.setPhone(AES256Util.encrypt(form.getPhone()));
//			form.setAddress(AES256Util.encrypt(form.getAddress()));
			userService.join(form);
		} catch (DuplicateKeyException duplicateKey) {
			logger.debug("duplicateKeyException");
			bindingResult.addError(new FieldError("userInfoForm", "userId", message.getMessage("invalid.exist", null, Locale.getDefault())));
			return "/join";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error/error";
		}
		return "redirect:/login";
	}
	
	@RequestMapping("getCurrentUser")
	@ResponseBody
	public Map<String, Object> getCurrentUser(Principal principal) throws Exception {
		
		Map<String, Object> jsonObj = new HashMap<>();
		
		if(principal != null) {
			User user = userService.findByUserId(principal.getName());
			jsonObj.put("user", user);
		}
		
		return jsonObj;
	}
}




















