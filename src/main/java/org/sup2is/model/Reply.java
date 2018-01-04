package org.sup2is.model;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {

	private int rno;
	private int bno;
	private String userId;
	private String content;
	private Date create_at;
	private int like;
	private int display;
}
