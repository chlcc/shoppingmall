package org.sup2is.form;



import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;


@Data
public class BoardForm {

	@NotEmpty
//	@Size(min = 2, max = 12)
	private String userId;
	@NotEmpty
	private String category;
//	@NotEmpty
//	@Size(min = 4, max = 10)
//	private String password;
	
	@NotEmpty
//	@Size(min = 5)
	private String title;
	
	@NotEmpty
//	@Size(min = 5)
	private String content;
	
	private List<String> filenames;
	
}
