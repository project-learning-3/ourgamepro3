package com.game.gameUrl.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.game.db.ConnectionPoolMgr;

public class GameUrlDAO {
	private ConnectionPoolMgr pool;

	public GameUrlDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}

	/*�̹���  select*/
	public GameUrlVO imageSelect(int g_no) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		GameUrlVO vo=new GameUrlVO();
		try {
			con=pool.getConnection();

			String sql="select image from gameurl where g_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, g_no);

			rs=ps.executeQuery();
			if(rs.next()) {
				String image=rs.getString("image");

				vo.setImage(image);
			}
			System.out.println("�󼼺��� ��� vo="+vo+", �Ű����� g_no="+g_no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/*���� select*/
	public GameUrlVO videoSelect(int g_no) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		GameUrlVO vo=new GameUrlVO();
		try {
			con=pool.getConnection();

			String sql="select video from gameurl where g_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, g_no);

			rs=ps.executeQuery();
			if(rs.next()) {
				String video=rs.getString("video");

				vo.setVideo(video);
			}
			System.out.println("�󼼺��� ��� vo="+vo+", �Ű����� g_no="+g_no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}

	}



}
