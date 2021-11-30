package com.game.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int payno; /* �������ܰ����� */
	private int payprice; /* ������ */
	private Timestamp paydate; /* ������ */
	private int balance; /* ������ */
	private String cancle;  /* ������ҿ��� */
	//private Timestamp cancledate;/* ��������� */
	private int m_no; /* ȸ����ȣ */
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