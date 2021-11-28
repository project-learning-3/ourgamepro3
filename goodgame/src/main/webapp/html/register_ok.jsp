<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@page import="com.game.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register_ok</title>
</head>
<body>
<%
//1. 요청 파라미터 읽어오기
	String no=request.getParameter("no");
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String birth=request.getParameter("birth");
	String businessNo=request.getParameter("businessNo");
	
	
	//2. db작업
	
	try{
		int cnt=0;
		if(no=="1"){
	MemberDAO dao = new MemberDAO();
	MemberVO vo = new MemberVO();
	vo.setM_email(email);
	vo.setM_pwd(pwd);
	vo.setM_name(name);
	vo.setM_phone(phone);
	vo.setM_birth(Timestamp.valueOf(birth));
	
	cnt=dao.insertMember(vo);
		}else if(no=="2"){
	DeveloperDAO dao = new DeveloperDAO();
	DeveloperVO vo = new DeveloperVO();
	vo.setSeller_email(email);
	vo.setD_pwd(pwd);
	vo.setSeller(name);
	vo.setSeller_phone(phone);
	vo.setBusiness_no(businessNo);
	
	cnt=dao.insertDeveloper(vo);
		}
	
		//3. 결과 처리  
		if(cnt>0){
%>
			<script type="text/javascript">
				alert("글쓰기 처리되었습니다.");
				location.href="list.jsp";
			</script>
	<%  }else{ %>
			<script type="text/javascript">
				alert("글쓰기 실패!");
				history.back();
			</script>			
	<%	}//if
	}catch(SQLException e){
		e.printStackTrace();
	}	
%>
</body>
</html>