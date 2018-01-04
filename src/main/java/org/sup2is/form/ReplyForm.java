package org.sup2is.form;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class ReplyForm {
	
	
	private int bno;
	private int rno;
	
	@NotEmpty
	private String userId;
	
	@NotEmpty
	private String content;
	
	
}
