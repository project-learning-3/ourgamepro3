<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 테스트 -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Goodgame - 게임등록페이지</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/fb21a5c3b2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$('.btn').click(function(){
		if($('#gname').val().length<1){
			alert('게임명을 입력하세요');
			$('#gname').focus();
			event.preventDefault();
		}else if($('#price').val().length<1){
			alert('가격을 입력하세요');
			$('#price').focus();
			event.preventDefault();
		}else if($('#c_no').val().length<1){
			alert('장르번호를 입력하세요');
			$('#c_no').focus();
			event.preventDefault();
		}else if($('#gtext').val().length<1){
			alert('게임설명을 입력하세요');
			$('#gtext').focus();
			event.preventDefault();
		}else if($('#src').val().length<1){
			alert('게임이미지[1]을 등록하세요');
			$('#src').focus();
			event.preventDefault();
		}else if($('#src2').val().length<1){
			alert('게임이미지[2]를 등록하세요');
			$('#src').focus();
			event.preventDefault();
		}else if($('#video').val().length<1){
			alert('게임영상을 등록하세요');
			$('#src').focus();
			event.preventDefault();
		}else if(!validate_num($('#price').val())){
			alert('가격은 숫자만 가능합니다.');
			$('#price').focus();
			event.preventDefault();
		}
	});
	$('#gameimg1').html('<i class="fas fa-times"></i>');
	$('#gameimg2').html('<i class="fas fa-times"></i>');
	$('#gameimg3').html('<i class="fas fa-times"></i>');
	$('#src').on('change', function(){
		if($('#src').val().length > 1){
			$('#gameimg1').html('<i class="fas fa-check"></i>');
		} else if($('#src').val().length < 1){
			$('#gameimg1').html('<i class="fas fa-times"></i>');
		}
	});
	$('#src2').on('change', function(){
		if($('#src2').val().length > 1){
			$('#gameimg2').html('<i class="fas fa-check"></i>');
		} else if($('#src2').val().length < 1){
			$('#gameimg2').html('<i class="fas fa-times"></i>');
		}
	});
	$('#video').on('change', function(){
		if($('#video').val().length > 1){
			$('#gameimg3').html('<i class="fas fa-check"></i>');
		} else if($('#video').val().length < 1){
			$('#gameimg3').html('<i class="fas fa-times"></i>');
		}
	});
});
function validate_num(num){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(num);
		
	/* 0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
	(^는 시작, $는 끝을 의미) 
	닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
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
								<h1 class="h4 text-gray-900 mb-4">Insert your Good game!</h1>
							</div>
							<div>
								<p>* 당신의 게임을 회원들과 함께 즐겨요.</p>
								<br>
							</div>
							<form class="user" action="gameInsert_ok.jsp" enctype="multipart/form-data" method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="gname" name="gname" placeholder="게임명">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control form-control-user"
											id="price" name="price" placeholder="게임가격">
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="gtext" name="gtext" placeholder="게임설명">
								</div>
								<div class="form-group">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<label for="src" class="btn-user">
											게임이미지선택[1]
										</label>
										<input type="file" id="src" name="src" style="display: none"> 
										<span id="gameimg1"></span>
									</div>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<label for="src2" class="btn-user">
											게임이미지선택[2]
										</label>
										<input type="file" id="src2" name="src2" style="display: none"> 
										<span id="gameimg2"></span>
									</div>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<label for="video" class="btn-user">
											영상선택
										</label>
										<input type="file" id="video" name="video" style="display: none"> 
										<span id="gameimg3"></span>
									</div>
								</div>
								<input type="submit" value="등록하기"
									class="btn btn-primary btn-user btn-block">
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="gameInsert_before.jsp">이용약관</a>
							</div>
							<div class="text-center">
								<a class="small" href="../html/home.jsp">메인으로 돌아가기</a>
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