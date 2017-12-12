package org.sup2is.valid;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.sup2is.form.UserInfoForm;

public class PhoneValidator implements ConstraintValidator<Phone, String> {

	private static String phoneRule = "^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$";
	
	@Override
	public void initialize(Phone phone) {
	}

	@Override
	public boolean isValid(String phoneNum, ConstraintValidatorContext ctx) {
		if(phoneCheck(phoneNum)) {
			return true;
		}
		return false;
	}
	
	public boolean phoneCheck(String phoneNum) {
		Pattern pattern = Pattern.compile(phoneRule);
		Matcher matcher = pattern.matcher(phoneNum);
		return matcher.find(); 
	}
}
