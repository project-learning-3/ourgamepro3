package com.game.gameUrl.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GameUrlService {
	private GameUrlDAO dao;

	public GameUrlService() {
		dao= new GameUrlDAO();
	}
	public GameUrlVO imageSelect(int g_no) throws SQLException{
		return dao.imageSelect(g_no);
	}

	/*비디오 select*/
	public GameUrlVO videoSelect(int g_no) throws SQLException{
		return dao.videoSelect(g_no);
	}

	/* 이미지 비디오 한꺼번에 */
	public GameUrlVO IVSelect(int g_no) throws SQLException{
		return dao.IVSelect(g_no);
	}
}
