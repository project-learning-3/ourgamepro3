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
	
	if(session.getAttribute("name")==null){	%>
		<script type="text/javascript">
			alert('로그인 후 이용가능한 페이지입니다.');
			location.href="../login/login.jsp";
		</script>
<%	} else{	%>
		<script type="text/javascript">
			location.href=document.getElementById(this).href;
		</script>
<%	}	 
	
//로그인 시에만 이용할 수 있는 페이지에 인클루드 ex 장바구니, 결제, 게임 구매 등등
%>
</body>
</html>