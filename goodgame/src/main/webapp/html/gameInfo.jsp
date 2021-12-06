<%@page import="com.game.member.model.MemberVO"%>
<%@page import="com.game.grade.model.GradeVO"%>
<%@page import="java.text.DecimalFormat"%>
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
<jsp:useBean id="gradeService" class="com.game.grade.model.GradeService" scope="session"></jsp:useBean>
<jsp:useBean id="memberService" class="com.game.member.model.MemberService" scope="session"></jsp:useBean>
<!DOCTYPE html>

<html lang="ko"></html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <meta name="description" content="">
<meta name="author" content=""> -->

<title>SB Admin 2 - Blank</title>
<%
//할 것 페이징 처리, 한줄평 테이블 불러오는것
 	String g_no =request.getParameter("g_no"); 
	String m_email=(String)session.getAttribute("m_email");
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
	
	GameVO vo = new GameVO();
	MemberVO mVo= new MemberVO();
	List<GradeVO> list= null;
	try{
		vo=gameService.selectByGame(1);
		list=gradeService.selectAll();
		mVo=memberService.selectByEmail(m_email);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String notice = vo.getNotice();
	if(notice!=null){
		notice= notice.replace("\r\n", "<br>");
	}else{
		notice="";
	} 
	
	int currentPage=1;  
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord=list.size(); 
	int pageSize=5;  
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize); 
	int blockSize=10;  
	
	int firstPage=currentPage-((currentPage-1)%blockSize); 
	int lastPage=firstPage+ (blockSize-1);  
	
	int curPos=(currentPage-1)*pageSize;
	
	int num=totalRecord-curPos; 
%>
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
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		var targetScore=<%=vo.getStar() %>;
		$('.star1 i:nth-child(-n+'+targetScore+')').css({color:'#babdcd'});
		
		$('#buyGame').click(function() {
			window.open('buyGame.jsp', '안뇽', 'width=680, height=450');
		}); 
	});
	
</script>
</head>
<style>
</style>


<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<h1><%=vo.getGname() %></h1>
	<section id="video-image">
		<div id="game-video">
			<iframe src="<%=vo.getVideo()%>"></iframe>
			<!-- 이것도 테이블에서 가져와야 -->
		</div>
		<div id="game-image">
			<div>
				<img alt="임시이미지"
					src="<%=vo.getSrc()%>">
			</div>
			<div>
				<img alt="임시이미지"
					src="<%=vo.getSrc2()%>">
			</div>
		</div>
	</section>
	<aside class="gameInfo">
		<div>
			<p>게임명 : <%=vo.getGname() %></p>
			<!-- 여기다 이름불러오는거 -->
		</div>
		<div>
			<p>가격 : <%=df.format(vo.getPrice()) %></p>
		</div>
		<div>
			<p>발매일 : <%=sdf.format(vo.getGdate()) %></p>
		</div>

		<div id="notice">
			<textarea id="noticeM" ><%=vo.getNotice() %></textarea>
		</div>
		<div>
			<input type="submit" value="<%=vo.getGname() %>구매하기" id="buyGame">
		</div>
	</aside>
		<div class="rationg">
		<div class="star1" data-rate="3">
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>
			<i class="fas fa-star"></i>	
		</div>
	</div>	
	<form class="comment" name="commentWap" method="post" action="gameInfo_ok.jsp">
		<table id="comment">
			<!-- 여기에 반복 for문 넣어주세요 -->
			
			<tr>
				<td>아이디</td>
				<td>내용</td>
				<td>게시일자</td>
			</tr>
		  <%for(int i=0;i<pageSize ;i++){
			  if(num<1) break;
			GradeVO vo2 = list.get(curPos++);
			mVo=memberService.selectMByNo(vo2.getM_no());
			num--;
			%>
			<tr>
				<th><%=mVo.getM_email() %></th>
				<th><%=vo2.getReview() %></th>
				<th><%=sdf.format(vo2.getR_date())%></th>
			</tr>
		<%  }%>
			<tr>
				<%mVo=memberService.selectByEmail(m_email); %>
				<td><%=mVo.getM_email() %> <input type="hidden" id="m_noComment" name="nComment" value="<%=mVo.getM_no()%>"> </td>
				<td> <input type="text" id="inputComment" name="tComment" placeholder="입력해주세요"> </td>
				<td> <input type="submit" id="submitComment" name="submitComment" value="등록하기"> </td>
			</tr>
		</table>
			<input type=hidden id="gameNo" name="g_no" value="<%=1%>">	
	</form>
	<div class="divPage">
		<%	if(firstPage>1){ %>
				<a href="list.jsp?currentPage=<%=firstPage-1%>">
					<img src="../img/last.JPG" alt="이전블럭">
				</a>	
		<%	}	%>					
							
		<%
			for(int i=firstPage;i<=lastPage;i++){
				if(i>totalPage) break; 			
				if(i==currentPage){ 	%>
					<span style="color:blue;font-weight: bold;font-size: 1em">
						<%=i %></span>
				<%}else{ %>
					<a href="gameInfo.jsp?currentPage=<%=i%>">
						[<%=i %>]</a>			
				<%}//if %>
		<%	}//for 	%>
		
		<%	if(lastPage < totalPage){ %>
				<a href="gameInfo.jsp?currentPage=<%=lastPage+1%>">
					<img src="../img/last.JPG" alt="다음블럭">
				</a>	
		<%	}	%>					
	</div>

</div>


<%@ include file="../inc/bottom.jsp"%>
