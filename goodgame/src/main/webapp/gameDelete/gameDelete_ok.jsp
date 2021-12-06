<%@page import="com.game.game.model.GameVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="gs" class="com.game.game.model.GameService" scope="session"></jsp:useBean>
<%
	String g_no = request.getParameter("g_no");
	String d_no = request.getParameter("d_no");
	String msg = "삭제 실패", url = "gameDelete.jsp?g_no="+g_no+"&d_no="+d_no;
	try{
		int cnt = gs.deletGame(Integer.parseInt(g_no));
		if(cnt > 0){
			msg = "삭제 성공";
			url = "gameDeleteList.jsp?d_no="+d_no;
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