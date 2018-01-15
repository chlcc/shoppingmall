package org.sup2is.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.ReplyForm;
import org.sup2is.model.Reply;
import org.sup2is.service.ReplyService;
import org.sup2is.util.JsonObject;

@Controller
@RequestMapping("reply")
public class ReplyController extends BaseController{


	Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.GET)
	@ResponseBody
	public JsonObject replyList(@PathVariable("bno")int bno) {
		
		try {
			List<Reply> replyList = replyService.replyList(bno);
			return JsonObject.create(replyList);
		}catch (Exception e) {
			logger.error(e.getMessage());
			return JsonObject.create(e);
		}
		
	}
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.POST)
	@ResponseBody
	public JsonObject addReply(@RequestBody @Valid ReplyForm form , BindingResult bindingResult,
			@PathVariable("bno")int bno) {
		
		form.setBno(bno);
		if(bindingResult.hasErrors()) {
			List<String> fieldErrors = new ArrayList<>(); 
			for(FieldError fieldError : bindingResult.getFieldErrors()) {
				fieldErrors.add(message.getMessage(fieldError.getCode(), fieldError.getArguments(), Locale.getDefault()));
			}
			return JsonObject.create(fieldErrors);
		}
		
		try {
			replyService.addReply(form);
			return JsonObject.create();
		}catch (Exception e) {
			logger.error(e.getMessage());
			return JsonObject.create(e);
		}
		
	}
	
	@RequestMapping(value = "/{rno}" , method = RequestMethod.PUT)
	@ResponseBody
	public JsonObject modReply(@RequestBody @Valid ReplyForm form , BindingResult bindingResult,
			@PathVariable("rno")int rno) {
		
		logger.info("form : {}" , form);
		
		if(bindingResult.hasErrors()) {
			List<String> fieldErrors = new ArrayList<>(); 
			for(FieldError fieldError : bindingResult.getFieldErrors()) {
				fieldErrors.add(message.getMessage(fieldError.getCode(), fieldError.getArguments(), Locale.getDefault()));
			}
			return JsonObject.create(fieldErrors);
		}
		
		try {
			replyService.modReply(form);
			return JsonObject.create();
		}catch (Exception e) {
			logger.error(e.getMessage());
			return JsonObject.create(e);
		}
		
	}
	
	@RequestMapping(value ="/{rno}" , method = RequestMethod.DELETE)
	@ResponseBody
	public JsonObject delReply(@PathVariable("rno")int rno) {
		
		try {
			replyService.delReply(rno);
			return JsonObject.create();
		}catch (Exception e) {
			logger.error(e.getMessage());
			return JsonObject.create(e);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
