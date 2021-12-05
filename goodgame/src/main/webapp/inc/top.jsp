<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String name = "";
	String ck = (String)session.getAttribute("ck");
	
	int d_no = 0;
	int m_no = 0;
	if(ck == null) ck ="";
	if(ck.equals("t") && ck != null && !ck.isEmpty()){
		name = (String)session.getAttribute("seller");
		d_no = (int)session.getAttribute("d_no");
	} else if(ck.equals("f")){
		name = (String)session.getAttribute("m_name");
		m_no = (int)session.getAttribute("m_no");
	} else if(ck == null || ck.isEmpty()){
		name = "";
		d_no = 0;
		m_no = 0;
	}
	//String m_name = (String)session.getAttribute("m_name");
	
	/* int m_no = (int)session.getAttribute("m_no");
	System.out.print(m_no); */
	//사용자번호 불러오는 방법 로그인 안하고 사용자넘버 불러올경우 널포인트 에러 뜸 
	//=> 인트값에 널이 들어갈 수 없어서 if로 처리 불가능
	System.out.println(name+" : name");
	System.out.println(d_no+" : d_no");
	System.out.println(m_no+" : m_no");


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
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				로그아웃 하시겠습니까?<br> 아이디와 비밀번호는 다시 입력 하셔야 합니다.
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-primary" href="../login/logout.jsp">로그아웃</a>
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
	});
	
	function add(){
		$('#container').prepend("<div class='ng'>"+""+"</div>");
	}
	
	$(function(){
		$('#dev-item').hide();
<%		if(ck.equals("t")){		%>
			$('#dev-item').show();
<%		}	%>
	});
</script>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Goodgame-MainMenu</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="../css/assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../html/home.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img alt="메인이미지" src="../img/Gg.png" style="width: 59px; height: 59px;">
                </div>
                <div class="sidebar-brand-text mx-3">G <sup>ood </sup>G <sup>ame</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
				<a class="nav-link" href="../html/mypage.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>마이페이지</span>
				</a>
			</li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">카테고리</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> 
					<i class="fas fa-fw fa-folder"></i> 
					<span>카테고리</span>
				</a>
				<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a href="#" data-toggle="collapse" data-target="#collapsePages1_1" style="text-decoration: none">
							<h6 class="collapse-header" style="font-size: 13px; color:#333333;">장르</h6>
						</a>
						<div id="collapsePages1_1" class="collapse">
							<a class="collapse-item" href="blank.html" style="background: white;">FPS</a> 
							<a class="collapse-item" href="blank.html" style="background: white;">액션</a> 
							<a class="collapse-item" href="blank.html" style="background: white;">롤플레잉</a> 
							<a class="collapse-item" href="blank.html" style="background: white;">어드벤처</a> 
							<a class="collapse-item" href="blank.html" style="background: white;">전략</a> 
							<a class="collapse-item" href="blank.html" style="background: white;">공포</a> 
							<a class="collapse-item" href="blank.html" style="background: white;">레이싱</a>
						</div>
						<div class="bg-white py-2 collapse-inner rounded">
							<a href="#" data-toggle="collapse" data-target="#collapsePages1_2" style="text-decoration: none">
								<h6 class="collapse-header" style="font-size: 13px; color:#333333;">추천 게임</h6>
							</a>
							<div id="collapsePages1_2" class="collapse">
								<a class="collapse-item" href="blank.html" style="background: white;">연령별 추천</a> 
									<a class="collapse-item" href="blank.html" style="background: white;">계절별 추천</a> 
									<a class="collapse-item" href="blank.html" style="background: white;">출시일 순</a> 
									<a class="collapse-item" href="blank.html" style="background: white;">평점높은 순</a>
							</div>
						</div>
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">


			<!-- Nav Item - Pages Collapse Menu -->

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> 
					<i class="fas fa-fw fa-wrench"></i> 
					<span>도움말</span>
				</a>
				<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header"><%=name %> 님, 무엇을 도와드릴까요?</h6>
						<a href="#" data-toggle="collapse" data-target="#collapsePages1_1" style="text-decoration: none">
							<h6 class="collapse-header" style="font-size: 13px; color:#333333;">고객지원</h6>
						</a>
						<div id="collapsePages1_1" class="collapse" style="font-size: 11px; font-family: fantasy; font-style: italic; font-weight: bold;">
								<a class="collapse-item" href="../question/customerSupport.jsp">계정</a>
								<a class="collapse-item" href="../question/purchaseSupport.jsp">구매</a>
								<a class="collapse-item" href="../question/pointSupport.jsp">포인트</a>
								<a class="collapse-item" href="../question/TermsOfUse.jsp">데이터</a>
						</div>
						<!--이용약관 html만 만듭시다-->
						<a class="collapse-item" href="../html/TermsAndConditions.jsp">이용약관</a>
						<!-- 이용약관 만들어주게 -->
					</div>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseuser" aria-expanded="true" aria-controls="collapseuser"> 
					<i class="fas fa-fw fa-table"></i> 
					<span>계정</span>
				</a>
<%				if(name != null && !name.isEmpty()){ 		%>				
				<div id="collapseuser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login</h6>
						<a class="collapse-item" href="blank.html">프로필 수정</a>
						<!-- 계정변경 html로 연결 -->
						<a class="collapse-item" href="blank.html">프로필 정보</a> 
						<a class="collapse-item1" href="../login/logout.jsp" data-toggle="modal" data-target="#logoutModal">
                        	<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        	로그아웃
                        </a>
					</div>
				</div>
<%				} else if(name == null || name.isEmpty() || name == ""){ 			%>
					<div id="collapseuser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Login</h6> 
							<a class="collapse-item1" href="../login/login.jsp" data-toggle="modal" data-target="#loginModal">
                        		<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        		로그인
                        	</a>
						</div>
					</div>
<%				} %>				
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<!-- 개발자 메뉴 -->
			<li class="nav-item" id="dev-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsedev" aria-expanded="true" aria-controls="collapsedev"> 
					<i class="fas fa-fw fa-table"></i> 
					<span>개발자메뉴</span>
				</a>
				<div id="collapsedev" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">개발자</h6>
						<a class="collapse-item" href="../gameInsert/gameInsert_before.jsp">게임등록</a>
						<!-- 계정변경 html로 연결 -->
						<a class="collapse-item" href="../gameList/gameListDev.jsp?d_no=<%=d_no%>">게임등록 현황</a> 
						<a class="collapse-item" href="#">게임판매 현황</a>
					</div>
				</div>
			</li>
						
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
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
                   

                        <div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
<%					 if(name != null && !name.isEmpty()){	%>						
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=name %></span>
								<img class="img-profile rounded-circle" src="../img/undraw_profile.svg">
							</a> 
							<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
								</a> 
				<%				if(m_no > 0){	 %>
									<a class="dropdown-item" href="../charge/charge_before.jsp"> 
										<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 포인트 충전
									</a> 
				<%				}				 %>
								<a class="dropdown-item" href="../html/mypay.jsp"> 
									<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 거래내역
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div>
						</li>
<%					 } else if(name == null || name.isEmpty() || name == ""){	%>	
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link" href="../login/login.jsp"> 
									로그인
								</a>
							</li>
<%					 }	%>					
					</ul>
				</nav>