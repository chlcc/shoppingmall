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
import org.sup2is.repository.UserRepository;


@Controller
@RequestMapping("user")
public class UserController extends BaseController{

	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value = "join" , method = RequestMethod.GET)
	public String joinPage(@ModelAttribute UserInfoForm form) {
		
		return "/user/join";
	}
	
	@RequestMapping(value = "join" , method = RequestMethod.POST)
	public String join(@Valid UserInfoForm form , BindingResult bindingResult) {
		
		logger.debug("user : {}" , form);
		
		if(bindingResult.hasErrors()){
            logger.debug("Binding Result has error!");
            return "/user/join";
        }
		/*if(form.getUserId().equals(userRepository.findByUserId(form.getUserId()).getUserId())) {
			bindingResult.addError(new FieldError("form", "userId", "invalid.exist"));
		}*/
		
		try {
			userRepository.join(form);
		} catch (DuplicateKeyException e) {
			bindingResult.addError(new FieldError("form", "userId", "invalid.exist"));
			logger.debug("error");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index";
		
	}
	
	
	
	
	
	
	
	
}
