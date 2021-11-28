<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Goodgame - 충전페이지</title>
    
    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

window.onload=function(){
	onlyNumber(document.getElementById("chargeMoney"));
}

function onlyNumber(o) {
	var num=/[^0-9]/gi;
	p.onkeyup = function(e){
		var v = this.value;
		this.value=v.replace(num,'');
	}	
} 

</script>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-charge-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Enjoy our service!</h1>
                            </div>
                            <div>
                            	<p>* 1회당 충전금액 제한은 200,000원 입니다.<br>
                            		* 최소 충전 금액은 10,000원 입니다.
                            	</p>
                            </div>
							<form class="user" action="charge_ok.jsp" name="charge"
								method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" name="m_pwd" placeholder="비밀번호">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="exampleRepeatPassword" name="ch_pwd" placeholder="비밀번호 확인">
									</div>

								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="chargeMoney" name="m_money" placeholder="충전금액">
								</div>
           							 <input type="submit" value="충전하기" class="btn btn-primary btn-user btn-block" onclick="regbtn()">


							</form>
							<hr>
                            <div class="text-center">
                                <a class="small" href="charge_before.jsp">이용약관</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="MainMenu.jsp">메인으로 돌아가기</a>
                            </div>
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