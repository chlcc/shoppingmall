package org.sup2is.model;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {
	
	private int cno;
	private String userId;
	private int gno;
	private int count;
	private Goods goods;
	private Date create_at;
	
/*	public Cart(String userId, int gno , int count ) {
		this.userId = userId;
		this.gno = gno;
		this.count = count;
	}

	public Cart(int cno, String userId, int gno, int count, Date create_at) {
		this.cno = cno;
		this.userId = userId;
		this.gno = gno;
		this.count = count;
		this.create_at = create_at;
	}
	
	*/
	
	
}

