<%@page import="java.sql.Time"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="memberService" class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<%-- <jsp:useBean id="developerService" class="com.game.member.model.DeveloperService" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Goodgame - profile</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<%
	String m_email = (String) session.getAttribute("m_email");
	String d_email = (String) session.getAttribute("d_email");

/*  세션으로 가져온 아이디로 각각 검사하고 int 나오면 그걸로 들어가자  */

	SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");		

	MemberVO vo1 = null;
	DeveloperVO vo2 = null;
	
	String email ="";
	String pwd="";
	String name="";
	String phone="";
	String number=""; //birth or 
	
	
	try {
		if (m_email != null && !m_email.isEmpty()) {
			vo1 = memberService.selectByEmail(m_email);
			email=vo1.getM_email();
			pwd=vo1.getM_pwd();
			name=vo1.getM_name();
			number= sdf.format(vo1.getM_birth()); 
			phone=vo1.getM_phone();
		}else if(d_email != null && !d_email.isEmpty()){
			//	vo = dao.selectDByNo(d_email);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}  
%>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var bool = false;
	$(function() {
		$('#CSupport2').hide();
		$('#CSupport1 ,#CSupport2').hover(function() {
			$('#CSupport2').show();
		}, function() {
			$('#CSupport2').hide();
		});

	});
</script>
<style>
#wrapper #content-wrapper #content1 {
	flex: 0 auto;
}
</style>
<head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image">
						<p style="font-size: 23px"></p>
					</div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">My Profile!</h1>
							</div>
							<form class="user">
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="name" value="name : <%=name%>" readonly="readonly">
									<!-- 이름 -->
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail"
										placeholder="email : <%=email%>" readonly="readonly">
									<!-- 이메일 -->
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="birth" placeholder="birth : <%=number %>" readonly="readonly">
									<!-- 생년월일 -->
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="phoneNumber" placeholder="phone : <%=phone%>"
										readonly="readonly">
									<!-- 핸드폰번호 -->
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="point" placeholder="point : 나오는 곳"  readonly="readonly">
									<!-- 핸드폰번호 -->
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<a id="regbtn" href="home.jsp"
											class="btn btn-primary btn-user btn-block" onclick="regbtn()">
											Go Main </a>

									</div>
									 <div class="col-sm-6">
										<a id="regbtn" href="profile_edit.jsp"
											class="btn btn-primary btn-user btn-block" onclick="regbtn()">
											Edit-Profile </a>
									</div> 
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>

</html>