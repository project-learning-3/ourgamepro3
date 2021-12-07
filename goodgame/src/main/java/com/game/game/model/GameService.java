package com.game.game.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class GameService {
	private GameDAO dao;
	
	public GameService() {
		dao = new GameDAO();
	}
	/*게임등록 메서드*/
	public int insertGame(GameVO vo) throws SQLException {
		return dao.insertGame(vo);
	}
	/*게임 목록 메서드*/
	public List<GameVO> selectAll() throws SQLException{
		return dao.selectAll();
	}

	public int updateGame(GameVO vo) throws SQLException{
		return dao.updateGame(vo);
	}
	
	/**
	 * 게임 삭제
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int deletGame(int g_no) throws SQLException{
		return dao.deletGame(g_no);
	}
	
	/**
	 * 개발자 번호로 조회 
	 * 개발자별 게임등록 리스트
	 * @throws SQLException 
	 */
	public List<GameVO> selectByDno(int d_no) throws SQLException {
		return dao.selectByDno(d_no);
	}

	/**
	 * 게임상세시 g_no으로 검색
	 * @param d_no
	 * @return
	 * @throws SQLException
	 */
	public GameVO selectByGame(int g_no) throws SQLException {
		return dao.selectByGame(g_no);
	}
}
