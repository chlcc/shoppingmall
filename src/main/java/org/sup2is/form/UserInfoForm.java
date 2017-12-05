package org.sup2is.form;


import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class UserInfoForm {

	
	@NotEmpty
	@Size(min = 4 , max = 12)
	private String userId;
	@NotEmpty
	@Size(min = 4 , max = 12)
	private String password;
	@NotEmpty
	@Size(min = 2 , max = 12)
	private String userName;
	
	private String phone;
	
	@NotEmpty
	@Email
	private String email;
	
	
}
