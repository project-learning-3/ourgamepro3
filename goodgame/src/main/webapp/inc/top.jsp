<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	String m_name = (String)session.getAttribute("m_name");
	
	/* int m_no = (int)session.getAttribute("m_no");
	System.out.print(m_no); */
	//사용자번호 불러오는 방법 로그인 안하고 사용자넘버 불러올경우 널포인트 에러 뜸 
	//=> 인트값에 널이 들어갈 수 없어서 if로 처리 불가능
	System.out.print(m_name);
	if(m_name==null){	
		m_name = "";	%>
		<script type="text/javascript">
			alert('로그인 후 이용가능한 페이지입니다.');
			location.href="login.jsp";	
		</script>	
<%		
	}

	request.setCharacterEncoding("utf-8");
	
%>
<!DOCTYPE html>
<html lang="ko">
<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>
<!-- 테스트 -->
<!-- Page level plugins -->
<script src="../vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="../js/demo/chart-area-demo.js"></script>
<script src="../js/demo/chart-pie-demo.js"></script>
<script src="../js/demo/chart-bar-demo.js"></script>

<!-- Logout 경고창-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">경 고</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				로그아웃 하시겠습니까?<br> 아이디와 비밀번호는 다시 입력 하셔야 합니다.
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-primary" href="login.jsp">로그아웃</a>
			</div>
		</div>
	</div>
</div>

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
		/* $('.collapse-item1').on("click",function() {
			alert('로그아웃 하시겠습니까?');
			if(bool == true){
			location.href = "logout.jsp";
			};
		}); */
	});
</script>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Goodgame-MainMenu</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="MainMenu.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img alt="메인이미지" src="../img/Gg.png" style="width: 59px; height: 59px;">
                </div>
                <div class="sidebar-brand-text mx-3">G <sup>ood </sup>G <sup>ame</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="mypage.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>마이페이지</span>
			</a></li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">카테고리</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>카테고리</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a href="#" data-toggle="collapse" data-target="#collapsePages1_1"
							style="text-decoration: none"><h6 class="collapse-header"
								style="font-size: 13px;">장르</h6></a>
						<div id="collapsePages1_1" class="collapse">
							<a class="collapse-item" href="blank.html"
								style="background: white;">FPS</a> <a class="collapse-item"
								href="blank.html" style="background: white;">액션</a> <a
								class="collapse-item" href="blank.html"
								style="background: white;">롤플레잉</a> <a class="collapse-item"
								href="blank.html" style="background: white;">어드벤처</a> <a
								class="collapse-item" href="blank.html"
								style="background: white;">전략</a> <a class="collapse-item"
								href="blank.html" style="background: white;">공포</a> <a
								class="collapse-item" href="blank.html"
								style="background: white;">레이싱</a>
						</div>
						<div class="bg-white py-2 collapse-inner rounded">
							<a href="#" data-toggle="collapse"
								data-target="#collapsePages1_2" style="text-decoration: none">
								<h6 class="collapse-header" style="font-size: 13px;">추천 게임</h6>
							</a>
							<div id="collapsePages1_2" class="collapse">
								<a class="collapse-item" href="blank.html"
									style="background: white;">연령별 추천</a> <a class="collapse-item"
									href="blank.html" style="background: white;">계절별 추천</a> <a
									class="collapse-item" href="blank.html"
									style="background: white;">출시일 순</a> <a class="collapse-item"
									href="blank.html" style="background: white;">평점높은 순</a>
							</div>
						</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">환경설정</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>설정</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header"><%=m_name %></h6>
						<!-- 로그인 하면 이름 나오게 -->
						<a class="collapse-item" href="">환경 설정</a>
						<!-- 환경설정 페이지 나오게 -->
						<a class="collapse-item" href="cards.html">쿠키 및 검색</a>
						<!-- 쿠키 값 가져오자 -->
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>도움말</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header"><%=m_name %> 님, 무엇을 도와드릴까요?</h6>
						<a class="collapse-item" id="CSupport1"
							href="utilities-color.html">고객지원</a>
						<div id="CSupport2" style="font-size: 11px; font-family: fantasy; font-style: italic; font-weight: bold;">
							<div>
								<a class="collapse-item" href="blank.html">게임,소프트웨어,기타</a>
							</div>
							<div>
								<a class="collapse-item" href="blank.html">구매</a>
							</div>
							<div>
								<a class="collapse-item" href="blank.html">나의계정</a>
							</div>
							<div>
								<a class="collapse-item" href="blank.html">포인트</a>
							</div>
						</div>
						<!--이용약관 html만 만듭시다-->
						<a class="collapse-item" href="utilities-border.html">이용약관</a>
						<!-- 이용약관 만들어주게 -->
						<a class="collapse-item" href="utilities-animation.html">시스템정보</a>
						<!-- 컴퓨터 사양나오게 둘 다-->
						<a class="collapse-item" href="utilities-other.html">[증기]정보</a>
						<!-- 이건 대충 창으로-->
					</div>
				</div> <!--  --></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseuser"
				aria-expanded="true" aria-controls="collapseuser"> <i
					class="fas fa-fw fa-table"></i> <span>계정</span>
			</a>
				<div id="collapseuser" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login</h6>
						<a class="collapse-item" href="blank.html">프로필 수정</a>
						<!-- 계정변경 html로 연결 -->
						<a class="collapse-item" href="blank.html">프로필 정보</a> <a
							class="collapse-item1" href="logout.jsp">로그아웃</a>
						<a class="collapse-item" href="blank.html">프로필 정보</a> 
						<a class="collapse-item1" href="login.jsp" data-toggle="modal" data-target="#logoutModal">
                        	<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        로그아웃</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

					<!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter"><!-- 알람갯수 --></span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    알 람
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500"><!-- December 12, 2019 --></div>
                                        <span class="font-weight-bold"><!-- A new monthly report is ready to download! --></span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500"><!-- December 7, 2019 --></div>
                                        <!-- $290.29 has been deposited into your account! -->
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500"><!-- December 2, 2019 --></div>
                                        <!-- Spending Alert: We've noticed unusually high spending for your account. -->
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">모든 알람 보기</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter"><!-- 메세지 갯수 --></span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    받은 메세지
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate"><!-- Hi there! I am wondering if you can help me with a
                                            problem I've been having. --></div>
                                        <div class="small text-gray-500"><!-- Emily Fowler · 58m --></div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate"><!-- I have the photos that you ordered last month, how
                                            would you like them sent to you? --></div>
                                        <div class="small text-gray-500"><!-- Jae Chun · 1d --></div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate"><!-- Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work! --></div>
                                        <div class="small text-gray-500"><!-- Morgan Alvarez · 2d --></div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate"><!-- Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good... --></div>
                                        <div class="small text-gray-500"><!-- Chicken the Dog · 2w --></div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">메세지 더 읽기..</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"><%=m_name %></span>
								<img class="img-profile rounded-circle"
								src="../img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
								</a> <a class="dropdown-item" href="../html/charge_before.jsp"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 포인트 충전
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 라이브러리
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>

					</ul>

				</nav>