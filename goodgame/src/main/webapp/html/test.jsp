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
MemberDAO dao= new MemberDAO();
String m_pwd="aa123";
int m_no=dao.checkM_no(m_pwd);
boolean check=dao.checkPwd(m_pwd);
System.out.println(m_no);
System.out.println(check);

%>
</body>
</html>