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
<jsp:useBean id="mvo" class="com.game.member.model.MemberVO" scope="session"></jsp:useBean>
<jsp:useBean id="ds" class="com.game.developer.model.DeveloperService" scope="session"></jsp:useBean>
<jsp:useBean id="dvo" class="com.game.developer.model.DeveloperVO" scope="session"></jsp:useBean>
<!-- 비번찾기 메서드 넣기 -->
<%

String msg="";
String email=request.getParameter("email");
int cnt=ms.duplicateEmail(email); //아이디중복체크
if(cnt==1) { //있으면
	mvo =ms.selectByEmail(email); //이메일선택
	String pwd=mvo.getM_pwd();
	msg=pwd;
}else {// 없음
	msg="아이디가 없습니다.";
}


%>
</body>
</html>