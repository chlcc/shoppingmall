package org.sup2is.form;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class LoginForm{

	@NotEmpty
	private String userId;
	
	@NotEmpty
	private String password;
	
}
