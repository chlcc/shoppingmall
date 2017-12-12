package org.sup2is.controller;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sup2is.service.UserService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/test-servlet-context.xml"})
public class UserRepositoryTest {

	public Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);
	
	
	@Autowired
	private UserService userService;
	
	
	
	@Test
	public void test() {
		
		logger.info("test");
		
		
	}
}
