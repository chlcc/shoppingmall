package org.sup2is.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sup2is.form.UserInfoForm;
import org.sup2is.repository.UserRepository;
import org.sup2is.repository.UserRepositoryImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:**/appServlet/servlet-context.xml" , "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserRepositoryTest {

	private Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);
	
	private UserRepository userRepository;
	
	@Test
	public void test() {
		userRepository = new UserRepositoryImpl();
		
		UserInfoForm form = new UserInfoForm();
		
	}
	
	
	
}
