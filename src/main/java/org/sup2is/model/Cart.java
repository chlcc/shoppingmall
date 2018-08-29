package org.sup2is.model;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
	
	private int cno;
	private String userId;
	private Goods goods;
	private int count;
	private Date create_at;
	
	public Cart(String userId, Goods goods , int count ) {
		this.userId = userId;
		this.goods = goods;
		this.count = count;
	}
}

