<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.game.game.model.GameVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../html/sessionLogin.jsp"%>
<%@ include file="../inc/top.jsp"%>
<jsp:useBean id="gs" class="com.game.game.model.GameService" scope="session"></jsp:useBean>
<%
	String devNo = request.getParameter("d_no");
	System.out.println(devNo);
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
	int pageSize=10; 
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=5;
	
	int firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage = firstPage + (blockSize-1);
	
	int curPos =(currentPage-1)*pageSize;
	
	int num=totalRecord - curPos;
%>
<!-- 내용추가 -->
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
               		<a href="../html/gameInfo.jsp">
                  		<%=g_vo.getGname() %>
               		</a>
            	</td>   
            	<td><%=df.format(g_vo.getPrice()) %></td>   
            	<td><%=sdf.format(g_vo.getGdate()) %></td>   
            	<td><%=g_vo.getGtext() %></td>
            	<td><%=g_vo.getC_no() %></td>
         	</tr>
<%		}	 %>
	</table>
	<div style="text-align:center; padding:5px 0;">
<%	if(firstPage>1){	%>
		<a href="gameListDev.jsp?d_no=<%=devNo%>&currentPage=<%=firstPage-1 %>">
			<img src="../img/first.JPG" alt="이전블럭">
		</a>
<%	}	%>
<%	for(int i=firstPage;i<=lastPage;i++){
		if(i>totalPage) break;
		if(i==currentPage){		%>
			<span>[<%=i %>]</span>
<%		}else{	%>
		<a href="gameListDev.jsp?d_no=<%=devNo%>&currentPage=<%=i%>">&nbsp;[<%=i %>]&nbsp;</a>
<%		}
	}	%>
<%	if(lastPage<totalPage){	%>
		<a href="gameListDev.jsp?d_no=<%=devNo%>&currentPage=<%=lastPage+1%>">
			<img src="../img/last.JPG" alt="다음블럭">
		</a>
<%	} 	%>
	</div>
</article>
<%@ include file="../inc/bottom.jsp"%>
