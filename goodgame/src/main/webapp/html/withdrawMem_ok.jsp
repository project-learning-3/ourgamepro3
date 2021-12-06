<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperService"%>
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
	<jsp:useBean id="ms" class="com.game.member.model.MemberService"
		scope="session"></jsp:useBean>
	<jsp:useBean id="ds" class="com.game.developer.model.DeveloperService"
		scope="session"></jsp:useBean>
	<%
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String check = (String)session.getAttribute("check");
	if(check == null) check = "";
	String ck = "f";
	System.out.println("E "+email);
	System.out.println("P "+pwd);
	System.out.println("Check "+check);
	String msg = "로그인 실패", url ="withdrawMem.jsp";
	try{
		if(check != null && !check.isEmpty()){
			ck = "t";
			if(ck.equals("t")){
				int result = ds.loginCheck(email, pwd);
				System.out.println(result);
				if(result == DeveloperService.LOGIN_OK){
					System.out.println("dasffas");
					int cnt = ds.deleteDeveloper(email, pwd);
					if(cnt>0){
					msg = "개발자 탈퇴가 완료되었습니다. 감사합니다.";
					url = "../login/logout.jsp";
					}
				} else if(result == DeveloperService.DISAGREE_PWD){
					msg = "패스워드가 다릅니다.";
				} else if(result == DeveloperService.USERID_NONE){
					msg = "아이디가 존재하지 않습니다.";
				}				
			}
		} else {
			ck = "f";
			if(ck.equals("f")){
				int result = ms.loginCheck(email, pwd);
				if(result == MemberService.LOGIN_OK){
					int cnt = ms.deleteMember(email, pwd);
					if(cnt>0){
					msg = "회원 탈퇴가 완료되었습니다. 감사합니다.";
					url = "../login/logout.jsp";
					}
				} else if(result == MemberService.DISAGREE_PWD){
					msg = "패스워드가 다릅니다.";
				} else if(result == MemberService.USERID_NONE){
					msg = "아이디가 존재하지 않습니다.";
				}							
			}
		}
		System.out.println("ck = "+ck);
	} catch(SQLException e){
		e.printStackTrace();
	}
	session.setAttribute("ck", ck);
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>

	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>