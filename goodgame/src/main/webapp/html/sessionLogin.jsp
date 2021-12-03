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
	String msg = "", url = "";
	if(session.getAttribute("name")==null){	
		msg = "로그인 후 이용 가능한 페이지 입니다.";
		url = "../login/login.jsp";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
//로그인 시에만 이용할 수 있는 페이지에 인클루드 ex 장바구니, 결제, 게임 구매 등등
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>