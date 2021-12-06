package com.game.game.model;

import java.sql.Timestamp;

public class GameVO {
	private int g_no; /*게임번호*/
	private String gname; /*게임이름*/
	private int price; /*게임가격*/
	private Timestamp gdate; /*등록일시*/
	private String gtext; /*게임설명*/
	private String notice; /*게임공지사항*/
	private int d_no; /* 개발자 번호 */
	private int c_no; /* 장르 번호 */
	private String src; /*게임이미지*/
	
	public GameVO() {
		super();
	}

	public GameVO(int g_no, String gname, int price, Timestamp gdate, String gtext, String notice, int d_no, int c_no,
			String src) {
		super();
		this.g_no = g_no;
		this.gname = gname;
		this.price = price;
		this.gdate = gdate;
		this.gtext = gtext;
		this.notice = notice;
		this.d_no = d_no;
		this.c_no = c_no;
		this.src = src;
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

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	@Override
	public String toString() {
		return "GameVO [g_no=" + g_no + ", gname=" + gname + ", price=" + price + ", gdate=" + gdate + ", gtext="
				+ gtext + ", notice=" + notice + ", d_no=" + d_no + ", c_no=" + c_no + ", src=" + src + "]";
	}
	
}
