package com.game.payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.game.db.ConnectionPoolMgr;

public class PaymentDAO {
	private ConnectionPoolMgr pool;
	
	public PaymentDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}
	
	/**
	 * 전체 잔액 +- 하는거
	 * @return
	 * @throws SQLException 
	 */
	
	 public int updateBalance(int m_no) throws SQLException { 
		Connection con=null;
	 	PreparedStatement ps= null;
	  
		try { 
		 con=pool.getConnection(); 
		 String sql="update payment set balance=(select sum(payprice) from payment)\r\n"
		 		+ "    where m_no=?"; 
		 
		 //전체 거래수 필요
		 List<PaymentVO> list= new ArrayList<PaymentVO>();
		 list=this.selectbyNo(m_no);
		 int payno=list.size();
		 
		 ps=con.prepareStatement(sql);
		 
		 ps.setInt(1, m_no);
		 
		 int cnt=ps.executeUpdate();
		 System.out.println("전체잔액더하기결과="+cnt);
		 return cnt;
		 
		}finally {
			 pool.dbClose(ps,con); 
		 } 
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
			String sql="insert into payment(payno,paydate,payprice,m_no) \r\n"
					+ " values(payment_seq.nextval,sysdate,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, charge);//payprice
			ps.setInt(2, m_no);
			
			int cnt=ps.executeUpdate();
			System.out.println("잔액 등록 결과 cnt="+cnt+", payprice="+charge+"고객번호="+m_no);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 고객번호로 전체 거래조회
	 * @throws SQLException 
	 */
	public List<PaymentVO> selectbyNo(int m_no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<PaymentVO> list = new ArrayList<PaymentVO>();
		try {
			con=pool.getConnection();
			String sql="select * from payment where m_no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, m_no);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int payno=rs.getInt("payno");
				int payprice=rs.getInt("payprice");
				Timestamp paydate=rs.getTimestamp("paydate");
				int balance =rs.getInt("balance");
				String cancle=rs.getString("cancle");
				
				PaymentVO vo=new PaymentVO();
				vo.setPayno(payno);
				vo.setBalance(balance);
				vo.setCancle(cancle);
				vo.setPaydate(paydate);
				vo.setPayprice(payprice);

				list.add(vo);
			}
			System.out.println("list결과 : "+list.size());
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	/**
	 * 번호로 개별 검색
	 * @param m_no
	 * @return vo
	 * @throws SQLException
	 */
	public PaymentVO selectbypayment(int m_no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		PaymentVO vo = new PaymentVO();
		try {
			con=pool.getConnection();
			String sql="select * from payment where m_no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, m_no);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int payno=rs.getInt("payno");
				int payprice=rs.getInt("payprice");
				Timestamp paydate=rs.getTimestamp("paydate");
				int balance =rs.getInt("balance");
				String cancle=rs.getString("cancle");
				
				vo.setPayno(payno);
				vo.setBalance(balance);
				vo.setCancle(cancle);
				vo.setPaydate(paydate);
				vo.setPayprice(payprice);

				vo=new PaymentVO(payno, payprice, paydate, balance, cancle, m_no);
			}
			System.out.println("조회결과 : vo"+vo);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
