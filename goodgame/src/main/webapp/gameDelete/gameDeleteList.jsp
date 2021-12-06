<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.game.game.model.GameVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="gs" class="com.game.game.model.GameService" scope="session"></jsp:useBean>
<%
String devNo = request.getParameter("d_no");
List<GameVO> list = null;
try{
	list = gs.selectByDno(Integer.parseInt(devNo));
} catch(SQLException e){
	e.printStackTrace();
}
DecimalFormat df=new DecimalFormat("#,### \u00A4");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

int currentPage=1;

if(request.getParameter("currentPage")!=null){
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
}

int totalRecord=list.size();
int pageSize=5; 
int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
int blockSize=5;

int firstPage=currentPage-((currentPage-1)%blockSize);
int lastPage = firstPage + (blockSize-1);

int curPos =(currentPage-1)*pageSize;

int num=totalRecord - curPos;	
%>
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

<title>Goodgame - 게임삭제페이지</title>

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
								<h1 class="h4 text-gray-900 mb-4">Delete your game</h1>
							</div>
							<div>
								<p>* 게임삭제</p>
								<br>
							</div>
							<article>
								<table class="table">
									<tr>
										<th>게임명</th>
										<th>가격</th>
										<th>등록일</th>
										<th>게임설명</th>
										<th>장르번호</th>
									</tr>
							<%
									for(int i=0;i<pageSize;i++){
										if(num<1) break;
										GameVO g_vo =list.get(curPos++);
										num--;
							%>
										<tr>
							            	<td>
							               		<a href="gameDelete.jsp?g_no=<%=g_vo.getG_no()%>&d_no=<%=devNo%>">
							                  		<%=g_vo.getGname() %>
							               		</a>
							            	</td>   
							            	<td><%=df.format(g_vo.getPrice()) %></td>   
							            	<td><%=sdf.format(g_vo.getGdate()) %></td>   
							            	<td><%=g_vo.getGtext() %></td>
							            	<td></td>
							         	</tr>
							<%		}	 %>
								</table>
								<div style="text-align:center; padding:5px 0;">
							<%	if(firstPage>1){	%>
									<a href="gameDeleteList.jsp?d_no=<%=devNo%>&currentPage=<%=firstPage-1 %>">
										<img src="../img/first.JPG" alt="이전블럭">
									</a>
							<%	}	%>
							<%	for(int i=firstPage;i<=lastPage;i++){
									if(i>totalPage) break;
									if(i==currentPage){		%>
										<span>[<%=i %>]</span>
							<%		}else{	%>
									<a href="gameDeleteList.jsp?d_no=<%=devNo%>&currentPage=<%=i%>">&nbsp;[<%=i %>]&nbsp;</a>
							<%		}
								}	%>
							<%	if(lastPage<totalPage){	%>
									<a href="gameDeleteList.jsp?d_no=<%=devNo%>&currentPage=<%=lastPage+1%>">
										<img src="../img/last.JPG" alt="다음블럭">
									</a>
							<%	} 	%>
								</div>
							</article>
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