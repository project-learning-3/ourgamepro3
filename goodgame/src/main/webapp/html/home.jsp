<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.game.game.model.GameVO"%>
<%@page import="java.util.List"%>
<%@page import="com.game.game.model.GameService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<jsp:useBean id="gs" class="com.game.game.model.GameService" scope="session"></jsp:useBean>
<%
	List<GameVO> list = null;

	try{
		list = gs.selectAll();
	} catch(SQLException e){
		e.printStackTrace();
	}
	DecimalFormat df=new DecimalFormat("#,### \u00A4");
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord=list.size();
	int pageSize=8; 
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=5;
	
	int firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage = firstPage + (blockSize-1);
	
	int curPos =(currentPage-1)*pageSize;
	
	int num=totalRecord - curPos;
%>
<!-- 내용추가 -->
<article>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
<%				for(int i=0;i<pageSize;i++){
					if(num<1) break;
					GameVO g_vo =list.get(curPos++);
					num--;	%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src='<%=g_vo.getSrc() %>' alt="게임이미지" />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><a href="#"><%=g_vo.getGname() %></a></h5>
								<!-- Product reviews-->
								<div class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<%=df.format(g_vo.getPrice()) %>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
<%				}		 %>
			</div>
		</div>
	</section>
	<div style="text-align:center; padding:5px 0;">
<%	if(firstPage>1){	%>
		<a href="home.jsp?currentPage=<%=firstPage-1 %>">
			<img src="../img/first.JPG" alt="이전블럭">
		</a>
<%	}	%>
<%	for(int i=firstPage;i<=lastPage;i++){
		if(i>totalPage) break;
		if(i==currentPage){		%>
			<span>[<%=i %>]</span>
<%		}else{	%>
		<a href="home.jsp?currentPage=<%=i%>">&nbsp;[<%=i %>]&nbsp;</a>
<%		}
	}	%>
<%	if(lastPage<totalPage){	%>
		<a href="home.jsp?currentPage=<%=lastPage+1%>">
			<img src="../img/last.JPG" alt="다음블럭">
		</a>
<%	} 	%>
	</div>
</article>
<%@ include file="../inc/bottom.jsp"%>
