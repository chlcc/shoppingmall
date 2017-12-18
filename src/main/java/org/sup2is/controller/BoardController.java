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
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.service.BoardService;
import org.sup2is.util.PageNavigation;

@Controller
@RequestMapping("board")
public class BoardController {

	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MessageSource message;
	
	@RequestMapping(value = "list" , method = RequestMethod.GET) 
	public String listAll() {
		return "/board/list";
	}
	
	@RequestMapping(value = "write" , method = RequestMethod.GET)
	public String write(@ModelAttribute BoardForm form) {
		
		return "/board/write";
	}
	
	@RequestMapping(value = "" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> create(@Valid @RequestBody BoardForm form, BindingResult bindingResult) {		
		
		Map<String,Object> jsonObj = new HashMap<>();
		
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
			boardService.write(form);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
	}
	
	@RequestMapping(value = "/list/{page}")
	@ResponseBody
	public Map<String, Object> listPage(@PathVariable("page")int page , Model model) throws Exception {

		
		Map<String, Object> jsonObj = new HashMap<>();
		PageNavigation pageNavigation = new PageNavigation(boardService.totalCount(), page);
		jsonObj.put("pageNavigation", pageNavigation);
		
		List<Board> list = boardService.listPage(pageNavigation);
		jsonObj.put("list", list);
		
		return jsonObj;
	}
	
	
	
}
