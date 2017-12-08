package org.sup2is.valid;

import java.util.regex.Matcher;

import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator<Password, String> {

	private static String passwordRule = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}";
	
	@Override
	public void initialize(Password password) {
	}

	@Override
	public boolean isValid(String password, ConstraintValidatorContext ctx) {
		if(passwordCheck(password)) {
			return true;
		}
		return false;
	}
	
	private boolean passwordCheck(String password) {
		Pattern pattern = Pattern.compile(passwordRule);
		Matcher matcher = pattern.matcher(password);
		return matcher.find(); 
	}

}
