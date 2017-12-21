package org.sup2is.controller;

import java.security.Principal;
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
import org.sup2is.model.User;
import org.sup2is.service.BoardService;
import org.sup2is.service.UserService;
import org.sup2is.util.PageNavigation;

@Controller
@RequestMapping("board")
public class BoardController extends BaseController {

	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MessageSource message;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "write" , method = RequestMethod.GET)
	public String write(@ModelAttribute BoardForm form , Model model, Principal principal) throws Exception {
		
		if(principal != null ) {
			User user = userService.findByUserId(principal.getName());
			model.addAttribute("user" , user);
		}
		
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
	
	/*@RequestMapping(value = "/list/{page}")
	@ResponseBody
	public Map<String, Object> listPage(@PathVariable("page")int page , Model model) throws Exception {

		Map<String, Object> jsonObj = new HashMap<>();
		PageNavigation pageNavigation = new PageNavigation(boardService.totalCount(), page);
		jsonObj.put("pageNavigation", pageNavigation);
		
		List<Board> list = boardService.listPage(pageNavigation);
		jsonObj.put("list", list);
		
		return jsonObj;
	}*/
	
	@RequestMapping(value = "/list/{page}")
	public String listPage(@PathVariable("page")int page , Model model) throws Exception {

		PageNavigation pageNavigation = new PageNavigation(boardService.totalCount(), page);
		List<Board> list = boardService.listPage(pageNavigation);
		logger.info(pageNavigation.toString());
		model.addAttribute("pageNavigation", pageNavigation);
		model.addAttribute("list", list);
		
		return "/board/list";
	}
	
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.GET)
	public String read(@ModelAttribute BoardForm form, @PathVariable("bno")int bno , Model model , Principal principal) throws Exception {
		
		Board board = boardService.readOne(bno);
		model.addAttribute("board" , board);

		if(principal != null ) {
			User user = userService.findByUserId(principal.getName());
			model.addAttribute("user" , user);
		}
		return "/board/read";
	}
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> modify(@RequestBody @Valid BoardForm form, BindingResult bindingResult
			, @PathVariable("bno")int bno) throws Exception {
		
		Map<String, Object> jsonObj = new HashMap<>();
		Board board = boardService.readOne(bno);
		
		if(bindingResult.hasErrors()) {
			List<FieldError> errors = bindingResult.getFieldErrors();
			List<String> fieldError = new ArrayList<>(); 
			for(FieldError error : errors) {
				fieldError.add(message.getMessage(error.getCode(), error.getArguments(), Locale.getDefault()));
			}
			jsonObj.put("fieldError", fieldError);
			return jsonObj;
		}
		
		board.setTitle(form.getTitle());
		board.setContent(form.getContent());
		
		try {
			boardService.modify(board);
		}catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("error", e);
			return jsonObj;
		}
		
		jsonObj.put("result", "success");
		return jsonObj;
	}
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("bno")int bno) throws Exception {
		
		Map<String, Object> jsonObj = new HashMap<>();
		Board board = boardService.readOne(bno);
		
		try {
			int result = boardService.setInvisibleBoard(bno);
		}catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("error", e);
			return jsonObj;
		}
		
		jsonObj.put("result", "success");
		return jsonObj;
	}
	
	
}
