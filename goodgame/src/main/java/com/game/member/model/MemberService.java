package com.game.member.model;

import java.sql.SQLException;


public class MemberService {	
	public static final int LOGIN_OK = 1;
	public static final int DISAGREE_PWD = 2;
	public static final int USERID_NONE = 3;	
	
	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao=new MemberDAO();
	}
	
	public int loginCheck(String m_email, String m_pwd) throws SQLException {
		return memberDao.loginCheck(m_email, m_pwd);
	}
	public MemberVO selectByEmail(String m_email) throws SQLException {
		return memberDao.selectByEmail(m_email);
	}
}
