package com.game.grade.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.game.db.ConnectionPoolMgr;

public class GradeDAO {
	private ConnectionPoolMgr pool;
	
	public GradeDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}
	
	public int insertGrade(GradeVO vo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		try {
			con=pool.getConnection();
			String sql = "insert into grade(m_no,g_no,review,r_date)\r\n"
					+ "values(?,?,?,sysdate)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, vo.getM_no());
			ps.setInt(2, vo.getG_no());
			ps.setString(3, vo.getReview());
			
			int cnt = ps.executeUpdate();
			System.out.println("등록결과 cnt ="+cnt+"vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<GradeVO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		List<GradeVO> list= new ArrayList<GradeVO>();
		
		try {
			con= pool.getConnection();
			String sql="select * from grade order by r_date";
			ps= con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				int m_no = rs.getInt("m_no");
				int g_no = rs.getInt("g_no");
				String review= rs.getString("review");
				Timestamp r_date=rs.getTimestamp("r_date");
				
				GradeVO vo = new GradeVO(m_no, g_no, review, r_date);
				list.add(vo);
			}
			System.out.println("list결과 : "+list);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
