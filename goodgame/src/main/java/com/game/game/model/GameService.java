package com.game.game.model;

import java.sql.SQLException;
import java.util.List;

public class GameService {
	private GameDAO dao;
	
	public GameService() {
		dao = new GameDAO();
	}
	public int insertGame(GameVO vo) throws SQLException{
		return dao.insertGame(vo);
	}
	public List<GameVO> selectAll() throws SQLException{
		return dao.selectAll();
	}

	public int updateGame(GameVO vo) throws SQLException{
		return dao.deletGame(vo);
	}
	
	public int deletGame(GameVO vo) throws SQLException{
		return dao.deletGame(vo);
	}
	public List<GameVO> selectByDno(int d_no) throws SQLException {
		return dao.selectByDno(d_no);
	}
}
