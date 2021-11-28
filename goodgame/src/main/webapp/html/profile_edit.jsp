<%@page import="java.sql.SQLException"%>
<%@page import="com.game.developer.model.developerVO"%>
<%@page import="com.game.developer.model.developerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>sign up for developer</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
#test_btn1 {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right: -4px;
	width: 50%;
}

#test_btn2 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-left: -3px;
	width: 50%;
	opacity: 0.5;
}

.opa {
	opacity: 0.5;
}
</style>
<%
	String no=request.getParameter("no");

	if(no==null || no.isEmpty()){ %>
	<script type="text/javascript">
		alert("잘못된 url입니다.");
		location.href="main.jsp";
	</script>
	<%	return;
	}
	developerDAO dao = new developerDAO();
	developerVO vo = null;
	try{
		vo=dao.selectDByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function regbtn() {
		$('.user input').each(function() {
			if ($(this).val() == "") {
				alert($(this).attr("name") + "을(를) 입력하세요");
				$(this).focus();
				event.preventDefault();
			}
		})
		var pwd1 = $('#exampleInputPassword').val();
		var pwd2 = $('#exampleRepeatPassword').val();
		if (pwd1 != pwd2) {
			alert("비밀번호가 일치하지 않습니다");
			event.preventDefault();
		}
	}
</script>
</head>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form class="user">
								<input type="hidden" name="no" value="<%=2%>">
								<!-- 기본적으로 본인의 정보가 입력된 상태에서 수정 하게끔 -->
								<!-- 이메일 -->
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail" name="email" value="<%=vo.getSeller_email()%>" disabled>
								</div>

								<!-- 비밀번호, 비밀번호확인 -->
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" name="pwd" value="<%=vo.getD_pwd()%>">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="exampleRepeatPassword" name="pwdRepeat"
											placeholder="Repeat Password" >
									</div>
								</div>

								<!-- 이름 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="name" placeholder="Name" name="name" value="<%=vo.getSeller()%>">
								</div>

								<!-- 연락처 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="phoneNumber" placeholder="Phone Number" name="phone"
										value="<%=vo.getSeller_phone()%>">
								</div>
								<!-- 사업자번호 -->
								<div class="form-group" id="bn">
									<input type="text" class="form-control form-control-user"
										id="businessNumber" placeholder="Business Number"
										name="businessNo" value="<%=vo.getBusiness_no()%>">
								</div>

								<!-- 등록버튼 -->
								<a id="regbtn" href="register_ok.jsp"
									class="btn btn-primary btn-user btn-block" onclick="regbtn()">
									Register Account </a>


							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot
									Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login.html">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

</body>

</html>