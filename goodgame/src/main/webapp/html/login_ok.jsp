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

<%	
	request.setCharacterEncoding("utf-8");
	
	String m_email = request.getParameter("m_email");
	String m_pwd = request.getParameter("m_pwd");
	MemberDAO m_dao = new MemberDAO();
	String name = m_dao.loginCheck(m_email, m_pwd);
	
	if(name == null || name == "" || name.isEmpty()){ 	%>
		<script type="text/javascript">
			alert('아이디와 패스워드를 확인하세요.');
			history.back();
		</script>
<%	} else {
		session.setAttribute("name", name);
		System.out.println(name);
		%>
		<script type="text/javascript">
			alert('로그인');
			location.href='home.jsp';
		</script>
		<%	
	}
%><!-- 테스트 -->
</body>
</html>