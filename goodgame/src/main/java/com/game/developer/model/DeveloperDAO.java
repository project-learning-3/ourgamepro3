package com.game.developer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.Result;

import com.game.db.ConnectionPoolMgr;
import com.game.member.model.MemberService;

public class DeveloperDAO {
	private ConnectionPoolMgr pool;
	
	public DeveloperDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}
	
	public List<DeveloperVO> select() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<DeveloperVO> list = new ArrayList<DeveloperVO>();
		
		try {
			con = pool.getConnection();
			String sql = "select * from developer"
				       + " order by d_no desc ";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int d_no = rs.getInt("d_no");
				String seller_email = rs.getString("seller_email");
				String seller = rs.getString("seller");
				String d_pwd = rs.getString("d_pwd");
				String seller_phone = rs.getString("seller_phone");
				String business_no = rs.getString("business_no");
				
				DeveloperVO vo = new DeveloperVO(d_no, seller_email,seller, d_pwd,seller_phone,business_no);
				list.add(vo);
			}
			System.out.println("list결과 : "+list);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int loginCheck(String seller_email, String d_pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = pool.getConnection();
			String sql = "select d_pwd from developer "
					+ "where seller_email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, seller_email);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(d_pwd.equals(rs.getString(1))){
					result = DeveloperService.LOGIN_OK;
				} else {
					result = DeveloperService.DISAGREE_PWD;
				}
			} else {
				result = DeveloperService.USERID_NONE;
			}
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public DeveloperVO selectByEmail(String seller_email) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		DeveloperVO vo = new DeveloperVO();
		try {
			con = pool.getConnection();
			String sql = "select * from developer where seller_email = ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, seller_email);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int d_no = rs.getInt("d_no");
				String seller = rs.getString("seller");
				String d_pwd = rs.getString("d_no");
				String seller_phone = rs.getString("seller_phone");
				String business_no = rs.getString("business_no");
				
				vo.setBusiness_no(business_no);
				vo.setD_no(d_no);
				vo.setD_pwd(d_pwd);
				vo.setSeller(seller);
				vo.setSeller_email(seller_email);
				vo.setSeller_phone(seller_phone);
				
				vo = new DeveloperVO(d_no, seller_email, seller, d_pwd, seller_phone, business_no);
			}
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertDeveloper(DeveloperVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;


		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="insert into developer(d_no,seller_email,seller,d_pwd,seller_phone,business_no)"
					+ " values(developer_seq.nextval,?,?,?,?,?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getSeller_email());
			ps.setString(2, vo.getSeller());
			ps.setString(3, vo.getD_pwd());
			ps.setString(4, vo.getSeller_phone());
			ps.setString(5, vo.getBusiness_no());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("등록결과 cnt=" + cnt + "vo=" +vo);

			return cnt;

		} finally {
			pool.dbClose(ps, con);
		}

	}
	public int updateDeveloper(DeveloperVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			String sql = "update developer\r\n"
					+ "set seller_email = ?, seller=?, d_pwd=? , seller_phone=?, business_no=? where d_no = ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getSeller_email());
			ps.setString(2, vo.getSeller());
			ps.setString(3, vo.getD_pwd());
			ps.setString(4, vo.getSeller_phone());
			ps.setString(5, vo.getBusiness_no());
			ps.setInt(6, vo.getD_no());
			
			int cnt = ps.executeUpdate();
			System.out.println("수정결과 cnt="+cnt+", vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public DeveloperVO selectDByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		DeveloperVO vo = new DeveloperVO();
		try {
			con=pool.getConnection();
			String sql = "select * from developer where d_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int d_no = rs.getInt("d_no");
				String email=rs.getString("seller_email");
				String name=rs.getString("seller");
				String pwd=rs.getString("d_pwd");
				String phone=rs.getString("seller_phone");
				String b_no=rs.getString("business_no");
				
				vo.setD_no(d_no);
				vo.setSeller_email(email);
				vo.setSeller(name);
				vo.setD_pwd(pwd);
				vo.setSeller_phone(phone);
				vo.setBusiness_no(b_no);
			}
			System.out.println("회원정보 결과 vo="+vo+", 매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 비밀번호 체크
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
    public boolean checkPwd(DeveloperVO vo) throws SQLException {
    	Connection con =null;
    	PreparedStatement ps = null;
    	ResultSet rs=null;
    	boolean bool= false;
    	try {
    		con=pool.getConnection();
    		String sql = "select d_pwd from developer where d_no=?";
    		ps=con.prepareStatement(sql);
    		ps.setInt(1, vo.getD_no());
    		rs=ps.executeQuery();
    		
    		if(rs.next()) {
    			String dPwd=rs.getString(1);
    			if(dPwd.equals(vo.getD_pwd())) {
    				bool=true;
    			}
    		}
    		System.out.print("비밀번호 체크 결과 bool="+bool+", 매개변수 vo="+vo);
    		return bool;
    	}finally {
    		pool.dbClose(rs, ps, con);
    	}
    }
    
    public int deleteDeveloper(String email , String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();		
			
			String sql = "delete from developer where SELLER_EMAIL=? and d_pwd = ?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, pwd);
			int cnt = ps.executeUpdate();
			System.out.println("회원 탈퇴 결과 cnt = "+cnt+"아이디 = "+email);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
			// TODO: handle finally clause
		}
	}

}