package org.sup2is.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.sup2is.form.BoardForm;
import org.sup2is.repository.FileRepository;
import org.sup2is.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class FileServiceTest {

	@Autowired
	private FileRepository fileRepository;
	
	@Autowired
	private BoardService boardService;
	
	
	@Test
	public void filetest() {
		
		List<String> filenames = new ArrayList<String>();
		filenames.add("20180102105102-58e-b87c8ee2db96.jpg");
		filenames.add("20180102105056-19f-8217b3d4f62f.jpg");
		
		BoardForm form = new BoardForm();
		form.setCategory("del");
		form.setContent("what  the..");
		form.setFilenames(filenames);
		form.setTitle("dd");
		form.setUserId("chlcc1212");
		
		
		try {
			boardService.write(form);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
