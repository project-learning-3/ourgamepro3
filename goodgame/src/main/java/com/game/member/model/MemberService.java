package com.game.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class MemberService {	
	//아이디 중복확인시 필요한 상수
	public static final int EXIST_ID=1;  //해당 아이디가 이미 존재함
	public static final int NON_EXIST_ID=2;  //해당 아이디가 존재하지 않음-사용가능
			
	//로그인 처리시 필요한 상수
	public static final int LOGIN_OK = 1; //로그인 성공
	public static final int DISAGREE_PWD = 2; //비번 불일치
	public static final int USERID_NONE = 3; //아이디 존재하지 않음
	
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
	public int duplicateEmail(String email) throws SQLException {
		return dao.duplicateEmail(email);
	}
	public int withdrawMember(String email) throws SQLException {
		return dao.deleteMember(email);
	}
}
