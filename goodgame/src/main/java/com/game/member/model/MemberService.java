package com.game.member.model;

import java.sql.SQLException;


public class MemberService {	
	public static final int LOGIN_OK = 1;
	public static final int DISAGREE_PWD = 2;
	public static final int USERID_NONE = 3;	
	
	private MemberDAO dao;
	
	public MemberService() {
		dao=new MemberDAO();
	}
	
	public int loginCheck(String m_email, String m_pwd) throws SQLException {
		return dao.loginCheck(m_email, m_pwd);
	}
	public MemberVO selectByEmail(String m_email) throws SQLException {
		return dao.selectByEmail(m_email);
	}
}
