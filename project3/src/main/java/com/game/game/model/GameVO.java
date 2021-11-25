package com.game.game.model;

import java.sql.Timestamp;

public class GameVO {

	private int g_no;
	private String gname;
	private int price;
	private Timestamp gdate;
	private String gtext;
	private String notice;
	private int number;
	
	public GameVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GameVO(int g_no, String gname, int price, Timestamp gdate, String gtext, String notice, int number) {
		this.g_no = g_no;
		this.gname = gname;
		this.price = price;
		this.gdate = gdate;
		this.gtext = gtext;
		this.notice = notice;
		this.number = number;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getGdate() {
		return gdate;
	}
	public void setGdate(Timestamp gdate) {
		this.gdate = gdate;
	}
	public String getGtext() {
		return gtext;
	}
	public void setGtext(String gtext) {
		this.gtext = gtext;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "GameVO [g_no=" + g_no + ", gname=" + gname + ", price=" + price + ", gdate=" + gdate + ", gtext="
				+ gtext + ", notice=" + notice + ", number=" + number + "]";
	}
	
	
}
