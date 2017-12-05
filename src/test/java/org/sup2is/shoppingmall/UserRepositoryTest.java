package org.sup2is.shoppingmall;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sup2is.repository.UserRepository;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml" ,
		"file:src/main/webapp/WEB-INF/spring/**/servlet-context.xml"})

public class UserRepositoryTest {
	
	private Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);
  
	@Autowired
	private UserRepository userRepository;
	
	@Test
	public void userRepoTest() {
		logger.info(userRepository.toString());
	}
	
}

