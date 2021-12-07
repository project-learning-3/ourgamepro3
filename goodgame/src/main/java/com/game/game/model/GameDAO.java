package com.game.game.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.game.db.ConnectionPoolMgr;

public class GameDAO {
	private ConnectionPoolMgr pool;

	public GameDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}
	/*게임등록 메서드*/
	public int insertGame(GameVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into game(g_no, gname, price, gtext, d_no, src, src2, video, star) "
					+ "values(game_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getGname());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getGtext());
			ps.setInt(4, vo.getD_no());
			ps.setString(5, vo.getSrc());
			ps.setString(6, vo.getSrc2());
			ps.setString(7, vo.getVideo());
			ps.setInt(7, vo.getStar());
			int cnt = ps.executeUpdate();
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	/*게임 목록 메서드*/
	public List<GameVO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<GameVO> list=new ArrayList<GameVO>();

		try {
			con = pool.getConnection();
			String sql="select * from game order by g_no desc ";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			while(rs.next()) {
				int g_no=rs.getInt("g_no");
				String gname=rs.getString("gname");
				int price=rs.getInt("price");
				Timestamp gdate=rs.getTimestamp("gdate");
				String gtext=rs.getString("gtext");
				String notice=rs.getString("notice");
				int d_no=rs.getInt("d_no");
				String src=rs.getString("src");
				String src2=rs.getString("src2");
				String video=rs.getString("video");
				int star=rs.getInt("star");

				GameVO vo = new GameVO(g_no, gname, price, gdate, gtext, notice, d_no, src, src2, video,star);

				list.add(vo);
			}
			System.out.println("게임조회 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int updateGame(GameVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update game"
					+ " set gname=?,price=?,gtext=?,notice=?,d_no=?"
					+ " where g_no=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getGname());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getGtext());
			ps.setString(4, vo.getNotice());
			ps.setInt(5, vo.getD_no());
			
			int cnt=ps.executeUpdate();
			System.out.println("게임목록 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 게임 삭제
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int deletGame(int g_no) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete game "
							+"where g_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, g_no);
			
			int cnt=ps.executeUpdate();
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 개발자 번호로 조회 
	 * 개발자별 게임등록 리스트
	 * @throws SQLException 
	 */
	public List<GameVO> selectByDno(int d_no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<GameVO> list = new ArrayList<GameVO>();
		try {
			con = pool.getConnection();
			String sql ="select * from game "
					+ "where d_no = ? "
					+ "order by g_no desc";
			ps = con.prepareStatement(sql);
			ps.setInt(1, d_no);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int g_no = rs.getInt("g_no");
				String gname = rs.getString("gname");
				int price = rs.getInt("price");
				Timestamp gdate = rs.getTimestamp("gdate");
				String gtext = rs.getString("gtext");
				String notice = rs.getString("notice");
				String src = rs.getString("src");
				String src2 = rs.getString("src2");
				String video = rs.getString("video");
				int star= rs.getInt("star");
				
				GameVO vo = new GameVO(g_no, gname, price, gdate, gtext, notice, d_no, src, src2, video, star);

				list.add(vo);
			}
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/**
	 * 게임상세시 g_no으로 검색
	 * @param d_no
	 * @return
	 * @throws SQLException
	 */
	public GameVO selectByGame(int g_no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		GameVO vo = new GameVO();
		try {
			con = pool.getConnection();
			String sql ="select * from game where g_no = ? ";

			ps = con.prepareStatement(sql);
			ps.setInt(1, g_no);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				String gname = rs.getString("gname");
				int price = rs.getInt("price");
				Timestamp gdate = rs.getTimestamp("gdate");
				String gtext = rs.getString("gtext");
				String notice = rs.getString("notice");
				int d_no = rs.getInt("d_no");
				String src = rs.getString("src");
				String src2 = rs.getString("src2");
				String video = rs.getString("video");
				int star= rs.getInt("star");				
				vo = new GameVO(g_no, gname, price, gdate, gtext, notice, d_no, src, src2, video, star);

			}
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
