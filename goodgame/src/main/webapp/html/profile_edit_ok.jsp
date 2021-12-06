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
	String d_email = (String) session.getAttribute("seller_email");


	try {
		if (m_email != null && !m_email.isEmpty()) { //멤버일떄
			MemberVO vo1 = new MemberVO();
			vo1.setM_pwd(request.getParameter("pwd"));
			vo1.setM_name(request.getParameter("name"));
			vo1.setM_phone(request.getParameter("phone"));
			vo1.setM_email(request.getParameter("email"));
		
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
						 history.back(); 
					</script>
					<%
					}
		 	
		} else if(d_email != null && !d_email.isEmpty()){ //개발자일때
		DeveloperVO vo2 = new DeveloperVO();
		vo2.setD_pwd(request.getParameter("pwd2"));
		vo2.setSeller(request.getParameter("name"));
		vo2.setSeller_phone(request.getParameter("phone"));
		vo2.setSeller_email(request.getParameter("email"));
		vo2.setBusiness_no(request.getParameter("number"));

		vo2.setD_no((int)session.getAttribute("d_no"));
		 	if (developerService.checkPwd(vo2))  { 
				int cnt = developerService.updateDeveloper(vo2);
				if (cnt > 0) {

					%>
					<script type="text/javascript">
						alert("프로필이 수정되었습니다.");
						location.href = "Proflie.jsp";
					</script>
				<%} else { %>
				<script type="text/javascript">
					alert("프로필 수정이 실패했습니다");
					 history.back(); 
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