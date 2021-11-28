package com.game.game.model;

import java.sql.Timestamp;

public class gameVO {
	private int g_no; /*게임번호*/
	private String gname; /*게임이름*/
	private int price; /*게임가격*/
	private Timestamp gdate; /*등록일시*/
	private String gtext; /*게임설명*/
	private String notice; /*게임공지사항*/
	private int d_no; /*개발자 번호*/
	
	public gameVO() {
		super();
	}
	public gameVO(int g_no, String gname, int price, Timestamp gdate,
			String gtext, String notice, int d_no){
		super();
		this.g_no=g_no;
		this.gname=gname;
		this.price=price;
		this.gdate=gdate;
		this.gtext=gtext;
		this.notice=notice;
		this.d_no=d_no;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no=g_no;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname=gname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price=price;
	}
	public Timestamp getGdate() {
		return gdate;
	}
	public void setGdate(Timestamp gdate) {
		this.gdate=gdate;
	}
	public String getGtext() {
		return gtext;
	}
	public void setGtext(String gtext) {
		this.gtext=gtext;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice=notice;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no=d_no;
	}
	
	@Override
	public String toString() {
		return "gameVO [g_no=" + g_no + ", gname=" + gname + ", price=" + price
				+ ", gdate=" + gdate+", gtext=" + gtext + ", notice=" + notice
				+", notice=" + notice + ", d_no" + d_no + "]";
	}
}
