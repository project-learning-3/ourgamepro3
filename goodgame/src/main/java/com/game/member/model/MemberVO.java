package com.game.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int m_no; /* 회원번호 */
	private String m_email; /* 이메일 */
	private String m_pwd; /* 비밀번호 */
	private String m_name; /* 이름 */
	private Timestamp m_birth; /* 생년월 */
	private String m_phone; /* 연락처  */
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(int m_no, String m_email, String m_pwd, String m_name, Timestamp m_birth, String m_phone) {
		this.m_no = m_no;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_phone = m_phone;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Timestamp getM_birth() {
		return m_birth;
	}
	public void setM_birth(Timestamp m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	@Override
	public String toString() {
		return "MemberVO [m_no=" + m_no + ", m_email=" + m_email + ", m_pwd=" + m_pwd + ", m_name=" + m_name
				+ ", m_birth=" + m_birth + ", m_phone=" + m_phone + "]";
	}
	
}
