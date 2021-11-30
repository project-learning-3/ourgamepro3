package com.game.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int payno; /* 결제수단고유번 */
	private int payprice; /* 결제금 */
	private Timestamp paydate; /* 결제일 */
	private int balance; /* 보유금 */
	private String cancle;  /* 결제취소여부 */
	//private Timestamp cancledate;/* 결제취소일 */
	private int m_no; /* 회원번호 */
	public PaymentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentVO(int payno, int payprice, Timestamp paydate, int balance, String cancle, int m_no) {
		super();
		this.payno = payno;
		this.payprice = payprice;
		this.paydate = paydate;
		this.balance = balance;
		this.cancle = cancle;
		this.m_no = m_no;
	}
	public int getPayno() {
		return payno;
	}
	public void setPayno(int payno) {
		this.payno = payno;
	}
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	public Timestamp getPaydate() {
		return paydate;
	}
	public void setPaydate(Timestamp paydate) {
		this.paydate = paydate;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getCancle() {
		return cancle;
	}
	public void setCancle(String cancle) {
		this.cancle = cancle;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	@Override
	public String toString() {
		return "PaymentVO [payno=" + payno + ", payprice=" + payprice + ", paydate=" + paydate + ", balance=" + balance
				+ ", cancle=" + cancle + ", m_no=" + m_no + "]";
	}
	
}