package org.sup2is.form;



import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;


@Data
public class BoardForm {

	@NotEmpty
	private String userId;
	@NotEmpty
	private String category;
	
/*	@NotEmpty
	@Size(min = 4, max = 10)
	private String password;*/
	 
	@NotEmpty
	private String title; 
	
	@NotEmpty
	private String content;
	
	private List<String> filenames;
	
}
