package org.sup2is.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("error")
public class ExceptionController {

	private Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	@RequestMapping("")
	public String commonException() {

		return "redirect:/index";
	}
	
	@RequestMapping("403")
	public String forbidden() {

		return "redirect:/error/error";
	}
	
}
