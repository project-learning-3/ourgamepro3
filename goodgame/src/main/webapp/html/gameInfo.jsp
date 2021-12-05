<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.game.gameUrl.model.GameUrlVO"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.game.game.model.GameVO"%>
<%@page import="com.game.game.model.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="gameService" class="com.game.game.model.GameService"
	scope="session"></jsp:useBean>
<jsp:useBean id="gameUrlService" class="com.game.gameUrl.model.GameUrlService" scope="session"></jsp:useBean>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <meta name="description" content="">
<meta name="author" content=""> -->

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
 .rationg {
	margin-top: -268px;
	margin-left: 697px;
	border: 3px solid #212121;
	border-radius: 10px;
	width: 328px;
	height: 63px;
}

.star1>* {
	font-size: -webkit-xxx-large;
	margin: 4px;
}

.star1 {
	width: inherit;
	height: inherit;
} 
.container-fluid {
	overflow: auto;
}
footer.sticky-footer {
    width: 100%;
    height: 100px;
    position: absolute;
    bottom: 0;
    text-align: center;
    overflow: visible;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var targetScore=<%= 4%>;
		$('.star1 i:nth-child(-n+'+targetScore+')').css({color:'#babdcd'});
		
		$('#buyGame').click(function() {
			window.open('buyGame.jsp', '안뇽', 'width=680, height=450');
		}); 
	});
	
</script>
</head>
<style>
</style>
<%
//할 것 페이징 처리, 한줄평 테이블 불러오는것
 	String g_no =request.getParameter("g_no"); 
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");

	GameVO vo = new GameVO();
	try{
		vo=gameService.selectByNo(1);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String notice = vo.getNotice();
	if(notice!=null){
		notice= notice.replace("\r\n", "<br>");
	}else{
		notice="";
	} 
%>

<%@ include file="../inc/topGInfo.jsp"%>

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
				<img alt="임시이미지"
					src="https://image.zdnet.co.kr/2015/08/27/firstblood_oHA56Yn7s.jpg">
			</div>
			<div>
				<img alt="임시이미지"
					src="http://cdn.playwares.com/upload_images/users/1445062261_a3eda06190583fc1e9190b0beb0793c6.png">
			</div>
		</div>
	</section>
	<aside class="gameInfo">
		<div>
			<p><%=vo.getGname() %></p>
			<!-- 여기다 이름불러오는거 -->
		</div>
		<div>
			<p><%=vo.getPrice() %></p>
		</div>
		<div>
			<p><%=sdf.format(vo.getGdate()) %></p>
		</div>

		<div id="notice">
			<input type=text id="noticeM" value="<%=vo.getNotice() %>">
		</div>
		<div>
			<input type="submit" value="<%=vo.getGname() %>구매하기" id="buyGame">
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
			<th>김준영입니다</th>
			<th>내용이라우아루아루우라</th>
			<th>2012-12-05</th>
		</tr>
	
	</table>
	
	<div class="rationg">
		<div class="star1" data-rate="3">
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>	
		</div>
	</div>	
</div>


<%@ include file="../inc/bottom.jsp"%>
