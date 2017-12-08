package org.sup2is.form;



import javax.validation.constraints.Size;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.sup2is.valid.Password;
import org.sup2is.valid.Phone;

import lombok.Data;

@Data
public class UserInfoForm{

	
	@NotEmpty
	@Size(min = 4 , max = 12)
	private String userId;
	@NotEmpty
	@Password
	@Size(min = 6 , max = 16)
	private String password;
	@NotEmpty
	@Size(min = 2 , max = 12)
	private String userName;
	
	@NotEmpty
	@Phone
	private String phone;
	
	@NotEmpty
	private String address;
	
	@NotEmpty
	private String address_detailed;
	
	@NotEmpty
	@Email
	private String email;
	
	
}
