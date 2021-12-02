<%@page import="java.sql.Timestamp"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberService"
	class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String m_email = (String) session.getAttribute("m_email");
	String d_email = (String) session.getAttribute("d_email");



/* 	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String number = request.getParameter("number");
	String no = request.getParameter("m_no"); */

	try {
		if (m_email != null && !m_email.isEmpty()) { //멤버일떄
			MemberVO vo1 = new MemberVO();
			vo1.setM_pwd((String)session.getAttribute("m_pwd"));
			System.out.println("여기냐!");
			vo1.setM_name((String)session.getAttribute("m_name"));
			vo1.setM_phone(request.getParameter("phone"));
			vo1.setM_email((String)session.getAttribute("m_email"));
			vo1.setM_birth((Timestamp) session.getAttribute("m_birth"));

		/* 	if (memberService.checkPwd((String)session.getAttribute("m_pwd"))) {   */
			int cnt = memberService.updateMember(vo1);
			if (cnt > 0) {
	%>
	<script type="text/javascript">
		alert("프로필이 수정되었습니다.");
		location.href = "Proflie.jsp";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("프로필 수정이 실패했습니다");
		history.back();
	</script>
	<%
	}
/* 	 	}  */
	} else { //개발자일때

	}

	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
</body>
</html>