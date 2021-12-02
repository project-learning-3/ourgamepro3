package com.game.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import com.game.db.ConnectionPoolMgr;

public class MemberDAO {
	private ConnectionPoolMgr pool;
	
	public MemberDAO() {
		pool = ConnectionPoolMgr.getInstance();
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
				String m_phone = rs.getString("m_phone");
				
				MemberVO vo = new MemberVO(m_no, m_email, m_pwd, m_name, m_birth, m_phone);
				list.add(vo);
			}
			System.out.println("list결과 : "+list);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int loginCheck(String m_email, String m_pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = pool.getConnection();
			String sql = "select m_pwd from member "
					+ "where m_email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, m_email);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(m_pwd.equals(rs.getString(1))){
					result = MemberService.LOGIN_OK;
				} else {
					result = MemberService.DISAGREE_PWD;
				}
			} else {
				result = MemberService.USERID_NONE;
			}
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public MemberVO selectByEmail(String m_email) throws SQLException {
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        
        MemberVO vo = new MemberVO();
        try {
           con=pool.getConnection();
           
           String sql="select * from member where m_email=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, m_email);
           
           rs=ps.executeQuery();
           while(rs.next()) {
              int no=rs.getInt("m_no");
              String m_name=rs.getString("m_name");
              String m_pwd=rs.getString("m_pwd");
              String m_phone=rs.getString("m_phone");
              Timestamp m_birth=rs.getTimestamp("m_birth");
              
              vo.setM_birth(m_birth);
              vo.setM_email(m_email);
              vo.setM_name(m_name);
              vo.setM_no(no);
              vo.setM_phone(m_phone);
              vo.setM_pwd(m_pwd);
              
              vo = new MemberVO(no, m_email, m_pwd, m_name, m_birth, m_phone);
           }
           return vo;
        }finally {
           pool.dbClose(rs, ps, con);
        }
     }
	
	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;


		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="insert into member(no,email,pwd,name,birth,phone)"
					+ " values(member_seq.nextval,?,?,?,?,?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getM_email());
			ps.setString(2, vo.getM_pwd());
			ps.setString(3, vo.getM_name());
			ps.setTimestamp(4, vo.getM_birth());
			ps.setString(5, vo.getM_phone());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("등록결과 cnt=" + cnt + "vo=" +vo);

			return cnt;

		} finally {
			pool.dbClose(ps, con);
		}

	}

	
	/**
	 * 비밀번호 맞는지 체크 맞으면 true
	 * @param m_pwd
	 * @return
	 * @throws SQLException
	 */
	public boolean checkPwd(String m_pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		boolean b=false;
		MemberVO vo =new MemberVO();
		try {
			con= pool.getConnection();
			String sql="select m_pwd from member where m_pwd=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, m_pwd);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString(1);
				
				vo.setM_pwd(pwd);
			}
			if(vo.getM_pwd().equals(m_pwd)) {
				b=true;
			}
			return b;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	public int updateMember(MemberVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			String sql = "update member\r\n"
					+ "set  m_name=?, m_phone=?, m_birth=? where m_email = ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getM_name());
			ps.setString(2, vo.getM_phone());
			ps.setTimestamp(3, vo.getM_birth());
			ps.setString(4, vo.getM_email());
			
			int cnt = ps.executeUpdate();
			System.out.println("수정결과 cnt="+cnt+", vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public MemberVO selectMByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = new MemberVO();
		try {
			con=pool.getConnection();
			String sql = "select * from member where m_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int m_no = rs.getInt("m_no");
				String email=rs.getString("m_email");
				String name=rs.getString("m_name");
				String pwd=rs.getString("m_pwd");
				String phone=rs.getString("m_phone");
				Timestamp birth=rs.getTimestamp("m_birth");
				
				vo.setM_no(m_no);;
				vo.setM_email(email);
				vo.setM_name(name);
				vo.setM_pwd(pwd);
				vo.setM_phone(phone);
				vo.setM_birth(birth);
			}
			System.out.println("회원정보 결과 vo="+vo+", 매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
