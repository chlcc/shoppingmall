package org.sup2is.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sup2is.model.Board;

@Controller
@RequestMapping("board")
public class BoardController {

	
	@RequestMapping(value = "" , method = RequestMethod.GET) 
	public String list() {
		return "/board/list";
	}
	
	
	@RequestMapping(value = "" , method = RequestMethod.POST)
	public Board create(@RequestBody Board board) {
		
		return board;
	}
	
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.GET)
	@ResponseBody
	public void read(@PathVariable("bno")int bno) {
		
	}
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.PUT)
	@ResponseBody
	public void edit(@PathVariable("bno")int bno) {
		
	}
	
	
	@RequestMapping(value = "/{bno}" , method = RequestMethod.DELETE)
	public void del(@PathVariable("bno")int bno) {
		
	}
	
	
	@RequestMapping(value = "list" , method = RequestMethod.GET)
	@ResponseBody
	public List<Board> listJSON() {
		List<Board> list = null;
		
		return list;
	}
	
	
	
	@RequestMapping(value = "write" , method = RequestMethod.GET)
	public String write() {
		
		return "/board/write";
	}
	
}
