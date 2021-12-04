<%@page import="com.game.game.model.GameVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int d_no = (int)session.getAttribute("d_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="gv" class="com.game.game.model.GameVO" scope="page"></jsp:useBean>
<jsp:useBean id="gs" class="com.game.game.model.GameService" scope="session"></jsp:useBean>
<%
	String gname = request.getParameter("gname");
	String price = request.getParameter("price");
	String gtext = request.getParameter("gtext");
	String c_no = request.getParameter("c_no");
	String src = request.getParameter("src");
	
	
	String msg = "등록실패", url = "gameInsert_before.jsp";
	try{
		gv.setD_no(d_no);
		gv.setGname(gname);
		gv.setGtext(gtext);
		gv.setPrice(Integer.parseInt(price));
		gv.setC_no(Integer.parseInt(c_no));
		gv.setSrc(src);
		int result = gs.insertGame(gv);
		
		if(result > 0){
			msg = "게임등록성공";
			url = "../html/home.jsp";
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