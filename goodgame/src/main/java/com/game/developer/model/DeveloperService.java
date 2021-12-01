package com.game.developer.model;

import java.sql.SQLException;


public class DeveloperService {
	public static final int LOGIN_OK = 1;
	public static final int DISAGREE_PWD = 2;
	public static final int USERID_NONE = 3;	
	
	private DeveloperDAO dao;
	
	public DeveloperService() {
		dao=new DeveloperDAO();
	}
	
	public int loginCheck(String seller_email, String d_pwd) throws SQLException {
		return dao.loginCheck(seller_email, d_pwd);
	}
	public DeveloperVO selectByEmail(String seller_email) throws SQLException {
		return dao.selectByEmail(seller_email);
	}
}
