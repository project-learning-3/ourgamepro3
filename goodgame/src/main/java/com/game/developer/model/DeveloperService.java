package com.game.developer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeveloperService {
	public static final int LOGIN_OK = 1;
	public static final int DISAGREE_PWD = 2;
	public static final int USERID_NONE = 3;	
	
	private DeveloperDAO dao;
	
	public DeveloperService() {
		dao=new DeveloperDAO();
	}
	
	public List<DeveloperVO> select() throws SQLException{
		return dao.select();
	}
	
	public String loginCheck(String m_email, String m_pwd) throws SQLException {
		return dao.loginCheck(m_email, m_pwd);
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
}
