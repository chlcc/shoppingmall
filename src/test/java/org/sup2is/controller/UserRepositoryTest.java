package org.sup2is.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


public class UserRepositoryTest {

	public Logger logger = LoggerFactory.getLogger(UserRepositoryTest.class);
	
	public String passwordRule = "^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$";
	
	@Test
	public void test() {
		
		Pattern pattern = Pattern.compile(passwordRule);
		Matcher matcher = pattern.matcher("01031321089");
		logger.info("matcher : {}" , matcher.find());
		
	}
	
}
