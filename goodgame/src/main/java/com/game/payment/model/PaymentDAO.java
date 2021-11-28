package com.game.payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.game.db.ConnectionPoolMgr;

public class PaymentDAO {
	private ConnectionPoolMgr pool;
	
	public PaymentDAO() {
		pool=ConnectionPoolMgr.getInstance();;
	}
	
	/**
	 * 잔액더하기
	 * @param m_no
	 * @throws SQLException 
	 */
	public int AddBalance(int m_no,int charge) throws SQLException {
		Connection con =null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into payment(payno,paydate,balance,m_no) \r\n"
					+ " values(payment_seq.nextval,sysdate,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, charge);//balance
			ps.setInt(2, m_no);
			
			int cnt=ps.executeUpdate();
			System.out.println("잔액 등록 결과 cnt="+cnt+", balance="+charge+"고객번호="+m_no);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
