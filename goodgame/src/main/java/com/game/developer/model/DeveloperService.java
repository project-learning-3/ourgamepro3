package com.game.developer.model;

import java.sql.SQLException;
import java.util.List;

public class DeveloperService{
	
	//아이디 중복확인시 필요한 상수
	public static final int EXIST_ID = 1;  //해당 아이디가 이미 존재함
	public static final int NON_EXIST_ID = 2; //해당 아이디가 존재하지 않음-사용가능
	
	//로그인 처리시 필요한 상수
	public static final int LOGIN_OK = 1; //로그인 성공
	public static final int DISAGREE_PWD = 2; //비번 불일치
	public static final int USERID_NONE = 3; //아이디 존재하지 않음

	private DeveloperDAO dao;
	
	public DeveloperService() {
		dao = new DeveloperDAO();
	}
	public List<DeveloperVO> select() throws SQLException{
		return dao.select();
	}
	
	public int loginCheck(String seller_email, String d_pwd) throws SQLException {
		return dao.loginCheck(seller_email, d_pwd);
	}
	public DeveloperVO selectByEmail(String seller_email) throws SQLException {
		return dao.selectByEmail(seller_email);
	}
	public int insertDeveloper(DeveloperVO vo) throws SQLException {
		return dao.insertDeveloper(vo);
	}
	public int updateDeveloper(DeveloperVO vo) throws SQLException {
		return dao.updateDeveloper(vo);
	}
	public DeveloperVO selectDByNo(int no) throws SQLException {
		return dao.selectDByNo(no);
	}
    public boolean checkPwd(DeveloperVO vo) throws SQLException {
    	return dao.checkPwd(vo);
    }
    public int withdrawDevelop(String email) throws SQLException {
		return dao.withdrawDevelop(email);
	}
}
