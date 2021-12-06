package com.game.payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PaymentService {
	private PaymentDAO dao;
	
	public PaymentService(){
		dao=new PaymentDAO();
	}
	
	/**
	 * 전체 잔액 +- 하는거
	 * @return
	 * @throws SQLException 
	 */
	
	 public int updateBalance(int m_no) throws SQLException { 
		return dao.updateBalance(m_no);
	 }
	 
	/**
	 * 잔액더하기
	 * @param m_no
	 * @throws SQLException 
	 */
	public int AddBalance(int m_no,int charge) throws SQLException {
		return dao.AddBalance(m_no, charge);
	}
	
	/**
	 * 고객번호로 전체 거래조회
	 * @throws SQLException 
	 */
	public List<PaymentVO> selectbyNo(int m_no) throws SQLException {
		return dao.selectbyNo(m_no);
	}
	
}
