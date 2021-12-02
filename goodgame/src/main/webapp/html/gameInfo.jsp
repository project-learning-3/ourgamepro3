<%@page import="java.sql.SQLException"%>
<%@page import="com.game.game.model.GameVO"%>
<%@page import="com.game.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Blank</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/gameInfo.css" rel="stylesheet">
<style type="text/css">
/* 틀 다 잡히면 집어 넣을거에요~~ */

#content-wrapper{
    background-color: #0D0D09;
    background-image: linear-gradient(
180deg,#0D0D09 10%,#545D90 100%);
    background-size: cover;
}
</style>
</head>
<style>
</style>
<%
//게임 동영상, 이미지 테이블에서 가져오기

%>
<%@ include file="../inc/topGInfo.jsp" %>

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<h1>게임명 넣는곳</h1>
					<section id="video-image">
						<div id="game-video">
							<iframe src="https://www.youtube.com/embed/c0i88t0Kacs"></iframe>
							<!-- 이것도 테이블에서 가져와야 -->
						</div>
						<div id="game-image">
							<div>
								<img alt="임시이미지" src="https://image.zdnet.co.kr/2015/08/27/firstblood_oHA56Yn7s.jpg">
							</div>
							<div>
								<img alt="임시이미지" src="http://cdn.playwares.com/upload_images/users/1445062261_a3eda06190583fc1e9190b0beb0793c6.png">
							</div>
						</div>
					</section>
					<aside class="gameInfo">
						<div>
							<p>게임명 넣어주세요</p>
							<!-- 여기다 이름불러오는거 -->
						</div>
						<div>
							<p>가격자리 넣어주세요</p>
						</div>
						<div>
							<p>등록일시자리 넣어주세요</p>
						</div>

						<div id="notice">
							<input type=text id="noticeM" value="게임설명">
						</div>
						<div>
							<input type="button" value="게임명구매하기" href="#">
						</div>
					</aside>
					<table id="comment">
						<!-- 여기에 반복 for문 넣어주세요 -->
						<tr>
							<td>아이디</td>
							<td>내용</td>
							<td>게시일자</td>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</table>
					<div class=rating>
						<p>별점 넣는곳 근데 어떻게 넣을꺼에요??</p>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
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