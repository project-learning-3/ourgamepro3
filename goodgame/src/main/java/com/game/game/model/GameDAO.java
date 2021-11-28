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
	public int insertGame(GameVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="insert into game(g_no, gname, price, gtext, notice, d_no)"
					+ "values(game_seq.nextval, ?,?,?,?,?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getGname());
			ps.setInt(2, vo.getPrice());
			ps.setString(3, vo.getGtext());
			ps.setString(4, vo.getNotice());
			ps.setInt(5, vo.getD_no());

			int cnt=ps.executeUpdate();
			System.out.println("게임등록 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
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
			String sql="select * from game";
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

				GameVO vo = new GameVO(g_no, gname, price, gdate, gtext, 
						notice, d_no);
				list.add(vo);
			}
			System.out.println("게임등록 결과 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/*게임상세보기 - 번호로 조회*/
	public GameVO selectByNo(int g_no) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		GameVO vo=new GameVO();

		try {
			con=pool.getConnection();

			String sql="select * from where g_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, g_no);

			rs=ps.executeQuery();
			if(rs.next()) {
				String gname=rs.getString("gname");
				int price=rs.getInt("price");
				Timestamp gdate=rs.getTimestamp("gdate");
				String gtext=rs.getString("gtext");
				String notice=rs.getString("notice");
				int d_no=rs.getInt("d_no");

				vo.setD_no(d_no);
				vo.setG_no(g_no);
				vo.setGname(gname);
				vo.setPrice(price);
				vo.setGtext(gtext);
				vo.setGdate(gdate);
				vo.setNotice(notice);
			}
			System.out.println("게임상세보기 vo="+vo+ ", 매개변수 g_no="+g_no);

			return vo;
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
	
	public int deletGame(GameVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete game"
							+"where g_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getG_no());
			
			int cnt=ps.executeUpdate();
			System.out.println("게임 삭제 결과 cnt="+cnt+", 매개변수 vo"+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
