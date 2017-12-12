package org.sup2is.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class BoardForm {

	@NotEmpty
	private String userId;
	@NotEmpty
	private String category;
	@NotEmpty
	private String password;
	@NotEmpty
	private String title;
	@NotEmpty
	private String content;
	
}
