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
<jsp:useBean id="ms" class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<jsp:useBean id="ds" class="com.game.developer.model.DeveloperService" scope="session"></jsp:useBean>
<%	
	request.setCharacterEncoding("utf-8");
	
	String m_email = request.getParameter("m_email");
	String m_pwd = request.getParameter("m_pwd");
	
	String check = request.getParameter("customCheck");
	if(check == null) check = "";
	boolean ck = false;
	
	System.out.println(check);
	String msg = "로그인 실패", url ="login.jsp";
	try{
		if(check != null && !check.isEmpty()){
			ck = true;
			if(ck == true){
				int result = ds.loginCheck(m_email, m_pwd);
				if(result == DeveloperService.LOGIN_OK){
					DeveloperVO d_vo = ds.selectByEmail(m_email);
					session.setAttribute("seller_email", m_email);
					session.setAttribute("seller", d_vo.getSeller());
					session.setAttribute("d_no", d_vo.getD_no());
					
					msg = d_vo.getSeller()+" 개발자님 환영합니다.";
					url = "home.jsp";
				} else if(result == DeveloperService.DISAGREE_PWD){
					msg = "패스워드가 다릅니다.";
				} else if(result == DeveloperService.USERID_NONE){
					msg = "아이디가 존재하지 않습니다.";
				}				
			}
		} else {
			ck = false;
			if(ck != true){
				int result = ms.loginCheck(m_email, m_pwd);
				if(result == MemberService.LOGIN_OK){
					MemberVO vo = ms.selectByEmail(m_email);
					session.setAttribute("m_email", m_email);
					session.setAttribute("m_name", vo.getM_name());
					session.setAttribute("m_no", vo.getM_no());
					
					msg = vo.getM_name()+" 고객님 환영합니다.";
					url = "home.jsp";
				} else if(result == MemberService.DISAGREE_PWD){
					msg = "패스워드가 다릅니다.";
				} else if(result == MemberService.USERID_NONE){
					msg = "아이디가 존재하지 않습니다.";
				}							
			}
		}
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