package com.game.developer.model;

public class DeveloperVO {
	private int d_no; /* �����ڹ�ȣ */
	private String seller_email; /* �̸��� */
	private String seller; /* �Ǹ��ڸ� */
	private String d_pwd; /* ��й�ȣ */
	private String seller_phone; /* ����ó */
	private String business_no; /* ����ڹ�ȣ */
	public DeveloperVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeveloperVO(int d_no, String seller_email, String seller, String d_pwd, String seller_phone,
			String business_no) {
		this.d_no = d_no;
		this.seller_email = seller_email;
		this.seller = seller;
		this.d_pwd = d_pwd;
		this.seller_phone = seller_phone;
		this.business_no = business_no;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getSeller_email() {
		return seller_email;
	}
	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getD_pwd() {
		return d_pwd;
	}
	public void setD_pwd(String d_pwd) {
		this.d_pwd = d_pwd;
	}
	public String getSeller_phone() {
		return seller_phone;
	}
	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	@Override
	public String toString() {
		return "developerVO [d_no=" + d_no + ", seller_email=" + seller_email + ", seller=" + seller + ", d_pwd="
				+ d_pwd + ", seller_phone=" + seller_phone + ", business_no=" + business_no + "]";
	}
	
	
}