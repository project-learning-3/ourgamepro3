<%@page import="java.sql.SQLException"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.game.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="../vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('form[name=login]').submit(function(){
		if($('#exampleInputEmail').val().length<1){
			alert("email을(를) 입력하세요");
			$(this).focus();
			event.preventDefault();
		} else if($('#exampleInputPassword').val().length<1){
			alert("pwd을(를) 입력하세요");
			$(this).focus();
			event.preventDefault();
		}
	});
});
</script>
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<!-- 테스트 -->
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center1">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block">
								<a href="../html/home.jsp"><img alt="로그인 이미지" src="../img/Gg.png" style="width: 500px; background: black;"></a>
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
									</div>
									<form class="user" action="login_ok.jsp" name="login" method="post">
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="exampleInputEmail" aria-describedby="emailHelp"
												placeholder="아이디(이메일) 입력..." name="m_email">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="exampleInputPassword" placeholder="비밀번호" name="m_pwd">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck" name="customCheck"> <label
													class="custom-control-label" for="customCheck">개발자 로그인</label>
											</div>
										</div>
                                        <input type="submit" value="login" class="btn btn-primary btn-user btn-block" onclick="checklogin()">
                                       
										<!--  <hr>
										<a href="index.html" class="btn btn-google btn-user btn-block">
											<i class="fab fa-google fa-fw"></i> Login with Google
										</a> <a href="index.html"
											class="btn btn-facebook btn-user btn-block"> <i
											class="fab fa-facebook-f fa-fw"></i> Login with Facebook
										</a> -->
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="../html/forgot-password.jsp">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="../register/membershipTerms.jsp">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>



</body>

</html>