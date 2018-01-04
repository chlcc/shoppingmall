package org.sup2is.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

@Controller
@RequestMapping("reply")
public class ReplyController extends BaseController{


	Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> replyList(@PathVariable("bno")int bno) {
		Map<String, Object> jsonObj = new HashMap<>();
		
		List<Reply> replyList = replyService.replyList(bno);
		
		jsonObj.put("replyList", replyList);
		
		return jsonObj;
	}
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addReply(@RequestBody @Valid ReplyForm form , BindingResult bindingResult,
			@PathVariable("bno")int bno) {
		Map<String, Object> jsonObj = new HashMap<>();
		form.setBno(bno);
		
		if(bindingResult.hasErrors()) {
			List<FieldError> errors = bindingResult.getFieldErrors();
			List<String> fieldError = new ArrayList<>(); 
			for(FieldError error : errors) {
				fieldError.add(message.getMessage(error.getCode(), error.getArguments(), Locale.getDefault()));
			}
			jsonObj.put("fieldError", fieldError);
			return jsonObj;
		}
		try {
			replyService.addReply(form);
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return jsonObj;
	}
	
	@RequestMapping(value = "/{rno}" , method = RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> modReply(@RequestBody @Valid ReplyForm form , BindingResult bindingResult,
			@PathVariable("rno")int rno) {
		Map<String, Object> jsonObj = new HashMap<>();
		
		logger.info("form : {}" , form);
		
		if(bindingResult.hasErrors()) {
			List<FieldError> errors = bindingResult.getFieldErrors();
			List<String> fieldError = new ArrayList<>(); 
			for(FieldError error : errors) {
				fieldError.add(message.getMessage(error.getCode(), error.getArguments(), Locale.getDefault()));
			}
			jsonObj.put("fieldError", fieldError);
			return jsonObj;
		}
		try {
			replyService.modReply(form);
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return jsonObj;
	}
	
	@RequestMapping(value ="/{rno}" , method = RequestMethod.DELETE)
	@ResponseBody
	public Map<String,Object> delReply(@PathVariable("rno")int rno) {
		
		Map<String, Object> jsonObj = new HashMap<>();
		try {
			replyService.delReply(rno);
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return jsonObj;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}