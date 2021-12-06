<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- 테스트 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>비밀번호 찾기</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script type="text/javascript" 
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

		$(function(){
			$('#findpwd').click(function(){
				if ($('#exampleInputEmail').val().length < 1) {
					alert("이메일을 입력하세요");
					$('#exampleInputEmail').focus();
					event.preventDefault();
				}else if ($('#phoneNumber').val().length < 1) {
					alert("전화번호를 입력하세요");
					$('#exampleInputEmail').focus();
					event.preventDefault();
				}
			});
		});
</script>
<body class="bg-gradient-primary">
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                            <img alt="로그인 이미지" src="../img/Gg.png" style="width: 500px; background: black;">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
                                        <p class="mb-4">이메일과 전화번호를 입력해주세요</p>
                                    </div>
                                    <form class="user" name="frm1" method="post" action="pwdReset.jsp">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="email"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="아이디(이메일) 입력...">
                                        </div>
                                        <div class="form-group">
											<input type="text" class="form-control form-control-user"
										id="phoneNumber" placeholder="전화번호입력" name="phone">
										</div>
                                        <div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck" name="customCheck"> <label
													class="custom-control-label" for="customCheck">개발자</label>
											</div>
										</div>    
                                        <input type="submit" value="비밀번호 찾기!" id="findpwd" class="btn btn-primary btn-user btn-block">
                                     
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="../register/registerMem.jsp">회원가입</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="../login/login.jsp">계정이 이미 있으신가요? 로그인 하세요</a>
                                    </div>
                                </div>
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