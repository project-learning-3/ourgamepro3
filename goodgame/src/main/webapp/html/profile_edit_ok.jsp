<%@page import="java.util.Date"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberService"
	class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<jsp:useBean id="developerService"
	class="com.game.developer.model.DeveloperService" scope="session"></jsp:useBean>
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
	String no = request.getParameter("m_no");  */

	try {
		if (m_email != null && !m_email.isEmpty()) { //멤버일떄
			MemberVO vo1 = new MemberVO();
			vo1.setM_pwd(request.getParameter("pwd"));
			vo1.setM_name(request.getParameter("name"));
			vo1.setM_phone(request.getParameter("phone"));
			vo1.setM_email(request.getParameter("email"));
			vo1.setM_birth(Timestamp.valueOf(request.getParameter("number")));

			if (memberService.checkPwd(request.getParameter("pwd"))) {
				int cnt = memberService.updateMember(vo1);
				if (cnt > 0) {
					%>
					<script type="text/javascript">
						alert("프로필이 수정되었습니다.");
						location.href = "Proflie.jsp";
					</script>
					<%} else {%>
					<script type="text/javascript">
						alert("프로필 수정이 실패했습니다");
						/* history.back(); */
					</script>
					<%
				}
		 	}  
		} else { //개발자일때
		DeveloperVO vo2 = new DeveloperVO();
		vo2.setD_pwd(request.getParameter("pwd"));
		vo2.setSeller(request.getParameter("name"));
		vo2.setSeller_phone(request.getParameter("phone"));
		vo2.setSeller_email(request.getParameter("email"));
		vo2.setBusiness_no(request.getParameter("number"));

			if (memberService.checkPwd(request.getParameter("pwd"))) {
				int cnt = memberService.updateMember(vo2);
					if (cnt > 0) {
					%>
						<script type="text/javascript">
							alert("프로필이 수정되었습니다.");
							location.href = "Proflie.jsp";
						</script>
					<%} else { %>
					<script type="text/javascript">
						alert("프로필 수정이 실패했습니다");
						/* history.back(); */
					</script>
					<%
					}	
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>