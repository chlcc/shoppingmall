package org.sup2is.controller;


import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.sup2is.model.Board;
import org.sup2is.service.BoardService;
import org.sup2is.service.BoardServliceImpl;
import org.sup2is.util.PageNavigation;



@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class BoardControllerTest {

	public Logger logger = LoggerFactory.getLogger(BoardControllerTest.class);
	
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	ApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/jsp/");
        viewResolver.setSuffix(".jsp");
        
		this.mockMvc = MockMvcBuilders.standaloneSetup(new BoardController())
				.setViewResolvers(viewResolver)
				.build();
		boardService = context.getBean(BoardServliceImpl.class);
	}
	
	@Test
	public void test() throws Exception {
		this.mockMvc.perform(post("/board")
				.param("name", "choi"))
		.andDo(print())
		.andExpect(status().isOk())
		.andExpect(content().contentType("application/json;charset=utf-8"));
			
		
	}
	@Test
	public void pageTest() throws Exception {

		int total = boardService.totalCount();
		logger.info("total :{}" , total);
		PageNavigation navigation = new PageNavigation(total, 1);
		
		List<Board> list = boardService.listPage(navigation);
		
		for(Board board : list) {
			logger.info(board.toString());
		}
		
	}
	
	@Test
	public void readOne() throws Exception {
		
		Board board = boardService.readOne(200);
		logger.info(board.toString());
		
	}
	
	
	@Test
	public void test2() {
		
		String path = "/board/123";
		String bno = path.substring(path.lastIndexOf("/") + 1, path.length());
		
		logger.info(bno);
		
	}
}
