<%@page import="com.game.grade.model.GradeVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gradeService" class="com.game.grade.model.GradeService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String m_no= request.getParameter("nComment");
	String g_no=request.getParameter("g_no");
	String review= request.getParameter("tComment");
		GradeVO vo = new GradeVO();
	try{
		vo.setM_no(Integer.parseInt(m_no));
		vo.setG_no(Integer.parseInt(g_no));
		vo.setReview(review);
		
		int cnt = gradeService.insertGrade(vo);
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("한줄평 등록이 성공했습니다.");
				location.href = "gameInfo.jsp";
			</script>
	<%	}else{ %>
			<script type="text/javascript">
				alert("한줄평 등록이 실패했습니다.");
				location.href = "gameInfo.jsp";
			</script>	
	<% 	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>