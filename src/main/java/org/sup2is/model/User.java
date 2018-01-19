package org.sup2is.model;

import java.sql.Date;

import lombok.Data;

@Data
public class User {

	private String userId;
	private String password;
	private String userName;
	private String phone;
	private String email;
	private String address;
	private String address_detailed;
	private int enabled;
	private Date create_at;
	private int point;
	private Grade grade;
	
}
