<%@page import="com.game.member.model.MemberService"%>
<%@page import="javax.script.ScriptContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.game.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ms" class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<%	
	request.setCharacterEncoding("utf-8");
	
	String m_email = request.getParameter("m_email");
	String m_pwd = request.getParameter("m_pwd");
	String msg = "로그인 실패", url ="login.jsp";
	try{
		int result = ms.loginCheck(m_email, m_pwd);
		if(result == MemberService.LOGIN_OK){
			MemberVO vo = ms.selectByEmail(m_email);
			session.setAttribute("m_email", m_email);
			session.setAttribute("m_name", vo.getM_name());
			
			msg = vo.getM_name()+"님 환영합니다.";
			url = "home.jsp";
		} else if(result == MemberService.DISAGREE_PWD){
			msg = "패스워드가 다릅니다.";
		} else if(result == MemberService.USERID_NONE){
			msg = "아이디가 존재하지 않습니다.";
		}
	} catch(SQLException e){
		e.printStackTrace();
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>