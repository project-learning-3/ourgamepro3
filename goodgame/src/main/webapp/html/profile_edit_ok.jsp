<%@page import="com.game.developer.model.developerVO"%>
<%@page import="com.game.developer.model.developerDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	
	String pwd=request.getParameter("pwd");
	String pwdRepeat=request.getParameter("pwdRepeat");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone"); 
	String businessNo = request.getParameter("businessNo"); //이거 개발자랑, 회원이랑 구분 해야함
	String no = request.getParameter("no");
	
	
	developerDAO dao = new developerDAO(); 
	try{
		developerVO	vo = new developerVO();
		vo.setD_pwd(pwd);
		vo.setSeller(name);
		vo.setSeller_phone(phone);
		vo.setBusiness_no(businessNo);
		vo.setD_no(Integer.parseInt(no));
		
		if(dao.checkPwd(vo)){
			int cnt= dao.updateDeveloper(vo);
			
			if(cnt>0){ %>
				<script type="text/javascript">
					alert("회원정보가 수정되었습니다.");
					location.href="Profile.jsp?no=<%=no%>";
				</script>
		<%	}else{  %>
				<script type="text/javascript">
					alert("회원정보 수정에 실패했습니다.");
					history.go(-1);				
				</script>
		<% 	}
		}else{ %>
			<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);				
		</script>
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>