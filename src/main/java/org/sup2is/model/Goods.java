package org.sup2is.model;

import java.util.Date;

import lombok.Data;


@Data
public class Goods {
	
	private int gno;
	private String price;
	private String name;
	private String category;
	private Date publish_at;
	private String content;
	private String imageUrl;
	private GoodsInfo goodsInfo;
	private String description;
}
