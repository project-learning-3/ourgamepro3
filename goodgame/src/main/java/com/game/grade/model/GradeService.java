package com.game.grade.model;

import java.sql.SQLException;
import java.util.List;

public class GradeService {
	private GradeDAO dao;

	public GradeService() {
		dao = new GradeDAO();
	}
	public int insertGrade(GradeVO vo) throws SQLException {
		return dao.insertGrade(vo);
	}
	
	public List<GradeVO> selectAll() throws SQLException{
		return dao.selectAll();
	}
	
}
