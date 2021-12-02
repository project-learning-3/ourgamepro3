<%@page import="com.game.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memService" class="com.game.member.model.MemberService" 
	scope="session"></jsp:useBean>
<%
	//[1]register.jsp에서 [중복확인] 클릭하면 open()으로 새창열기 => get방식으로 이동			
	//[2]checkUserid.jsp에서 post방식으로 서브밋
		
	//1
	request.setCharacterEncoding("utf-8");
	String email=request.getParameter("email");
	System.out.println("email="+email);
	//2
	int result=0;
	if(email!=null && !email.isEmpty()){
		try{
			result=memService.duplicateEmail(email);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	//3
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>checkUserid.jsp</title>
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" 
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){	
			if($('#email').val().length<1){ 
				alert("이메일을 입력하세요"); 
				$('#email').focus(); 
				event.preventDefault(); 
			}
		});

		$('#btUse').click(function(){
			<%-- opener.document.frm1.userid.value='<%=userid%>'; --%>
			$(opener.document).find('#exampleInputEmail').val('<%=email%>');
			$(opener.document).find('#chkEmail').val('Y'); //중복확인 완료
			
			self.close();
		});
	});
	
</script>	
</head>
<body>

	<h2>이메일 중복 검사</h2><br>
	<form name="frmId" method="post" action="checkUserid.jsp">
		<input type="email" name="email" id="email" 
			title="아이디입력" value="<%=email%>">
		<input type="submit" id="submit" value="이메일 확인">
		
		<%if(result==MemberService.EXIST_ID){%>
			<p>이미 등록된 이메일입니다. 다른 이메일을 입력하세요</p>	
		<%}else if(result==MemberService.NON_EXIST_ID){	%>
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 이메일입니다. [사용하기] 버튼을 클릭하세요</p>			
		<%} %>
	</form>
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
</body>
</html>






