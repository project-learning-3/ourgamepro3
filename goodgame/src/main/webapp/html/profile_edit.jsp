<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.game.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberSevice" class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<jsp:useBean id="developerService" class="com.game.developer.model.DeveloperService" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>

<head>

<title>개인정보 수정</title>
<%
String m_email = (String) session.getAttribute("m_email");
String d_email = (String) session.getAttribute("seller_email");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

MemberVO vo1 = null;
DeveloperVO vo2 = null;

String email = "";
String pwd = "";
String pwd2 ="";
String name = "";
String phone = "";
String number = ""; //birth or businessNumber 
Timestamp birth=null;
try {
	if (m_email != null && !m_email.isEmpty()) {
		vo1 = memberSevice.selectByEmail(m_email);
		email = vo1.getM_email();
		pwd = vo1.getM_pwd();
		name = vo1.getM_name();
		birth = vo1.getM_birth();
		phone = vo1.getM_phone();
	} else if (d_email != null && !d_email.isEmpty()) {
		vo2= developerService.selectByEmail(d_email);
		email=vo2.getSeller_email();
		pwd2= vo2.getD_pwd();
		name=vo2.getSeller();
		number= vo2.getBusiness_no(); 
		phone=vo2.getSeller_phone(); 
	}
} catch (SQLException e) {
	e.printStackTrace();
}
%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#regbtn1').click(function(){
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
		})
	})
	
</script>
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

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
							<form class="user" name="wap" method="post" action="profile_edit_ok.jsp">
							 	<%-- <input type="hidden" name="no" value="<%=2%>">  --%>
								<!-- 기본적으로 본인의 정보가 입력된 상태에서 수정 하게끔 -->
								<!-- 이메일 -->
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail" name="email" value="<%=email%>" readonly="readonly">
								</div>

								<!-- 비밀번호, 비밀번호확인 -->
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" name="pwd" value=
											<%if(m_email != null && !m_email.isEmpty()){%>
													"<%=pwd%>"
										   	<%}else{ %>
													"<%=pwd2%>"
											<%	} %> 
											 readonly="readonly">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="exampleRepeatPassword" name="pwdRepeat"
											placeholder="Repeat Password">
									</div>
								</div>

								<!-- 이름 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="name" placeholder="Name" name="name" value="<%=name%>">
								</div>

								<!-- 연락처 -->
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="phoneNumber" placeholder="Phone Number" name="phone"
										value="<%=phone%>">
								</div>
								<!-- 사업자번호 -->
								<div class="form-group" id="bn">
									<input type="text" class="form-control form-control-user"
										id="businessNumber" placeholder="Business Number"
										name="number" 
										value=<%if(m_email != null && !m_email.isEmpty()){%>
													"<%=sdf.format(birth) %>" readonly="readonly"
										   	<%}else{ %>
													"<%=number %>"
											<%	} %> >
								</div>

								<!-- 등록버튼 -->
								<input type="submit" id="regbtn1" value="Profile Edit"
									class="btn btn-primary btn-user btn-block" onclick="regbtn()">
									
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


</body>

</html>