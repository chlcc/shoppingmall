package org.sup2is.model;

import java.util.Date;

import lombok.Data;


@Data
public class Goods {
	
	private int gno;
	private int price;
	private int count;
	private String category;
	private Date publish_at;
	private String content;

}
