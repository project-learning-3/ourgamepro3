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

<title>개발자 회원가입</title>

<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
#test_btn1 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-left: -3px;
	width: 50%;
}

#test_btn2 {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right: -4px;
	width: 50%;
	opacity: 0.5;
}

.opa {
	opacity: 0.5;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function regbtn() {
		if ($('#name').val().length < 1) {
			alert("이름을(를) 입력하세요");
			$('#name').focus();
			event.preventDefault();
		} else if ($('#exampleInputEmail').val().length < 1) {
			alert("이메일을(를) 입력하세요");
			$('#exampleInputEmail').focus();
			event.preventDefault();
		} else if ($('#birth').val().length < 1) {
			alert("생일을(를) 입력하세요");
			$('#birth').focus();
			event.preventDefault();
		} else if ($('#birth').val().length != 6) {
			alert("생일은 6자리입니다");
			$('#birth').focus();
			event.preventDefault();
		} else if ($('#phoneNumber').val().length < 1) {
			alert("휴대폰번호을(를) 입력하세요");
			$('#phoneNumber').focus();
			event.preventDefault();
		} else if ($('#phoneNumber').val().length != 11) {
			alert("휴대폰번호는 11자리입니다");
			$('#phoneNumber').focus();
			event.preventDefault();
		} else if ($('#exampleInputPassword').val().length < 1) {
			alert("비밀번호을(를) 입력하세요");
			$('#exampleInputPassword').focus();
			event.preventDefault();
		} else if ($('#exampleRepeatPassword').val().length < 1) {
			alert("비밀번호확인을(를) 입력하세요");
			$('#exampleRepeatPassword').focus();
			event.preventDefault();
		} else if ($('#exampleRepeatPassword').val() != $(
				'#exampleInputPassword').val()) {
			alert("비밀번호가 일치하지 않습니다.");
			event.preventDefault();
		}
	}
	
	/* function selbtn2(){ 
		location.href="register1.html"; */
		/* $('#bn').attr('disabled', true); */
		/* $('#bn').hide(); */
		/* $('#bn').css('display','none'); */
		/* $('#bn').css('display','block'); */
		/* $("#bn").hide(); */
		/* document.getElementById("bn").style.display = "none"; */
	/* } */
	
	
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
								<h1 class="h4 text-gray-900 mb-4" style="font-weight: bold;">개 발 자 회 원 가 입</h1>
							</div>
							<form class="user">
								<input type="hidden" name="no" value="<%=2%>">
								<div class="form-group">
									<a id="test_btn2" href="registerMem.jsp"
										class="btn btn-primary btn-user" >유저</a> <a
										id="test_btn1" class="btn btn-primary btn-user">개발자</a>
								</div>

								<!-- 이메일 -->
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="이메일 입력..."
										name="email" value = "">
								</div>
								
								<!-- 비밀번호, 비밀번호확인 -->
								<div class="form-group row">
									
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" placeholder="비밀번호" name="pwd">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="exampleRepeatPassword" placeholder="비밀번호 재입력">
									</div>
								</div>

								<!-- 이름 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="name" placeholder="이름" name="name">
								</div>

								<!-- 연락처 -->
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="phoneNumber" placeholder="휴대폰 번호" name="phone">
								</div>

								<!-- 생일 -->
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="birth" placeholder="생년월일" name="birth">
								</div>

								<!-- 등록버튼 -->
								<a id="regbtn" href="register_ok.jsp"
									class="btn btn-primary btn-user btn-block" onclick="regbtn()">
									회원가입하기! </a>


							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="login.jsp">로그인 화면</a>
							</div>
							<div class="text-center">
								<a class="small" href="forgot-password.jsp">비밀번호 찾기</a>
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