package com.game.grade.model;

import java.sql.Timestamp;

public class GradeVO {
	private int m_no;
	private int g_no;
	private String review;
	private Timestamp r_date;
	
	public GradeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GradeVO(int m_no, int g_no, String review, Timestamp r_date) {
		super();
		this.m_no = m_no;
		this.g_no = g_no;
		this.review = review;
		this.r_date = r_date;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Timestamp getR_date() {
		return r_date;
	}

	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}

	@Override
	public String toString() {
		return "GradeVO [m_no=" + m_no + ", g_no=" + g_no + ", review=" + review + ", r_date=" + r_date + "]";
	}

	
}
