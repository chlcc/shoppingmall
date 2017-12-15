package org.sup2is.form;



import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;


@Data
public class BoardForm {

	@NotEmpty
	private String username;
	@NotEmpty
	private String category;
	@NotEmpty
	private String password;
	@NotEmpty
	private String title;
	@NotEmpty
	private String content;
	
}
