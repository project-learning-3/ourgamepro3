<%@page import="com.game.member.model.MemberVO"%>
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

String msg="",url="";
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String check = request.getParameter("customCheck");
if(check == null) check = "";

if(check != null && !check.isEmpty()){ //체크되있음 개발자
	int cnt=ms.duplicateEmail(email); //아이디중복체크
	
	if(cnt>0) { //있으면
		dvo = ds.selectByEmail(email); //이메일로 고객정보 받아오기
		//System.out.print(phone);
		if(phone.equals(dvo.getSeller_phone())){ //전화번호도 맞으면? - 개발자
			String pwd=dvo.getD_pwd(); 
			msg="비밀번호는 "+pwd; //비밀번호 알려주기
			url="../login/login.jsp";
		}else{
			msg="전화번호가 틀립니다.";
			url="forgot-password.jsp";
		}
	}else {// 없음
		msg="아이디가 없습니다.";
		url="forgot-password.jsp";
	}
}else{
	int cnt=ms.duplicateEmail(email); //아이디중복체크
	
	if(cnt>0) { //있으면
		mvo = ms.selectByEmail(email); //이메일로 고객정보 받아오기
		//System.out.print(phone);
		if(phone.equals(mvo.getM_phone())){ //전화번호도 맞으면? - 고객
			String pwd=mvo.getM_pwd(); 
			msg="비밀번호는 "+pwd; //비밀번호 알려주기
			url="../login/login.jsp";
		}else{
			msg="전화번호가 틀립니다.";
			url="forgot-password.jsp";
		}
	}else {// 없음
		msg="아이디가 없습니다.";
		url="forgot-password.jsp";
	}
	
}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>