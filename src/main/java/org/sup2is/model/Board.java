package org.sup2is.model;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	
	private int bno;
	private String userId;
	private String category;
	private String password; 
	private String title;
	private String content;
	private Date create_at;
	private int viewCnt;
	private int anonymous;
	private int display;
}
