package org.sup2is.form;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class ReplyForm {
	
	
	@NotEmpty
	private int bno;
	
	@NotEmpty
	private String userId;
	
	@NotEmpty
	private String content;
	
}
