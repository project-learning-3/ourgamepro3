package com.game.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.Result;

import com.game.db.ConnectionPoolMgr;

public class MemberDAO {
	private ConnectionPoolMgr pool;
	
	public MemberDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<MemberVO> select() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			con = pool.getConnection();
			String sql = "select * from member "
					+ "order by m_no desc ";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int m_no = rs.getInt("m_no");
				String m_email = rs.getString("m_email");
				String m_pwd = rs.getString("m_pwd");
				String m_name = rs.getString("m_name");
				Timestamp m_birth = rs.getTimestamp("m_birth");
				int m_phone = rs.getInt("m_phone");
				
				MemberVO vo = new MemberVO(m_no, m_email, m_pwd, m_name, m_birth, m_phone);
				list.add(vo);
			}
			System.out.println("list결과 : "+list);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public String loginCheck(String m_email, String m_pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String m_name = "";
		try {
			con = pool.getConnection();
			String sql = "select m_name from member "
					+ "where m_email = ? and m_pwd = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, m_email);
			ps.setString(2, m_pwd);
			rs = ps.executeQuery();
			if(rs.next()) {
				m_name = rs.getString(1);
			}
			return m_name;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
