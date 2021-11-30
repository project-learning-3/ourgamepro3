<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberService" class="com.game.member.model.MemberService" scope="session"></jsp:useBean> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String m_email=(String) session.getAttribute("m_email");
	String d_email=(String) session.getAttribute("d_email");

	
	
	/* DeveloperDAO dao = new DeveloperDAO(); */
	//라라라 졸려서 진도가 안나가~
	try {
		if(m_email !=null && !m_email.isEmpty()){
				
		DeveloperVO vo1 = new DeveloperVO();
		vo.setD_pwd(pwd);
		vo.setSeller(name);
		vo.setSeller_phone(phone);
		vo.setBusiness_no(businessNo);
		vo.setD_no(Integer.parseInt(no));
		
		}
		if (dao.checkPwd(vo)) {
			int cnt = dao.updateDeveloper(vo);

			if (cnt > 0) {
	%>
	<script type="text/javascript">
					alert("회원정보가 수정되었습니다.");
					location.href="profile.jsp"
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("회원정보 수정에 실패했습니다.");
		history.go(-1);
	</script>
	<%
	}
	} else {
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
	<%
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
</body>
</html>