package org.sup2is.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

public class BaseController {
	
	@Autowired
	protected HttpSession session;
	
	@Autowired
	protected MessageSource message;
	

}
