package org.sup2is.model;

import lombok.Data;

@Data
public class Reply {

	private int rno;
	private int bno;
	private String userId;
	private String content;
	private int display;
}
