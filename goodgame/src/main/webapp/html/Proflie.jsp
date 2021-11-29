<%@page import="java.sql.SQLException"%>
<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
String no=request.getParameter("no");
	
/*	if(no==null || no.isEmpty()){
%>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="main.jsp";
		</script> 
	<%
 	return;
 	 		}*/
 	 		DeveloperDAO dao = new DeveloperDAO();
 	 		DeveloperVO vo = null;
 	 		try{
 	 			vo=dao.selectDByNo(Integer.parseInt(no));
 	 		}catch(SQLException e){
 	 			e.printStackTrace();
 	 		}
 	 		/* if문으로 해서 개발자랑 회원 구분하게 하자 
 	 		ex :
 	 			String name=""; 그래서 이걸 value값에 넣게
 	 			if(){
 	 		name = vo.getSeler();llll
 	 			}else{
 	 		name = vo.getName();
 	 			}
 	 		*/
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
						<p style="font-size: 23px">로그인과 차별화를 위한 이미지 변경 어때요?</p>
					</div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">My Profile!</h1>
							</div>
							<form class="user">
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="name" value="<%=vo.getSeller() %>" disabled>
									<!-- 이름 -->
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="<%=vo.getSeller_email() %>"
										disabled>
									<!-- 이메일 -->
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="birth" placeholder="<%=vo.getBusiness_no() %>" disabled>
									<!-- 생년월일 -->
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="phoneNumber" placeholder="<%=vo.getSeller_phone() %>" disabled>
									<!-- 핸드폰번호 -->
								</div>
								<div class="form-group">
									<input type="number" class="form-control form-control-user"
										id="point" placeholder="point 나오는 곳" disabled>
									<!-- 핸드폰번호 -->
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<a id="regbtn" href="main.jsp"
											class="btn btn-primary btn-user btn-block" onclick="regbtn()">
											Go Main </a>

									</div>
									<div class="col-sm-6">
										<a id="regbtn" href="profile_edit.jsp?no=<%=vo.getD_no() %>"
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