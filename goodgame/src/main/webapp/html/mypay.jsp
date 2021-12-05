<%@page import="java.sql.SQLException"%>
<%@page import="com.game.payment.model.PaymentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.game.payment.model.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp" %>

<jsp:useBean id="payVo" class="com.game.payment.model.PaymentVO" scope="page"/>
<jsp:useBean id="payDao" class="com.game.payment.model.PaymentDAO" scope="page"/>
<%
	//charge_ok 에서 get방식으로 이동 -> 고객넘 세션이용해서 불러오기
	m_no=(int)session.getAttribute("m_no"); 

	PaymentDAO dao=new PaymentDAO();
 
	//int m_no = 2;//테스트용
	List<PaymentVO> list=null;
	try{
		list=payDao.selectbyNo(m_no);
	}catch(SQLException e){
		e.printStackTrace();
	} 
	
	String balance = request.getParameter("balance");
	
	//페이징처리
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord=list.size();
	int pageSize=5; //15개씩보여줌
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=5;
	
	int firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage = firstPage + (blockSize-1);
	
	int curPos =(currentPage-1)*pageSize;
	
	int num=totalRecord - curPos;
	
	
	
%>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1> -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">거래 내역</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>거래순서</th>
								<th>거래금액</th>
								<th>거래일자</th>
								<th>취소여부</th>
							</tr>
						</thead>
				
						<tbody>
						<%
							for(int i=0;i<pageSize;i++){
								if(num<1) break;
								payVo =list.get(curPos++);
								num--;
						%>
							<tr>
								<td><%=list.size()-i%></td>
								<td><%=payVo.getPayprice() %></td> 
								<td><%=payVo.getPaydate() %></td>
								<td><%=payVo.getCancle() %></td>
							</tr>
						<%} %>
						</tbody>
						<%-- <tfoot>
							<tr>
								<td  colspan="4"><%=payVo.getBalance() %></td>
							</tr>
						</tfoot> --%>
					</table>
					<p style="font-size:20px;text-align:right;color:midnightblue" name="balance">잔액 : <%=payVo.getBalance() %></p>
				
				<!-- 페이지 번호 추가 -->
					<div style="text-align:center; padding:5px 0;">
						<!-- 이전 블럭으로 이동 -->
						<%if(firstPage>1){%>
						<a href="mypay.jsp?currentPage=<%=firstPage-1 %>&balance=<%=payVo.getBalance()%>"><img src="../img/first.JPG" alt="이전블럭"></a>
						<%}%>
						<% for(int i=firstPage;i<=lastPage;i++){
							if(i>totalPage) break;
							if(i==currentPage){%>
							<span>[<%=i %>]</span>
							<%}else{%>
								<a href="mypay.jsp?currentPage=<%=i%>">&nbsp;[<%=i %>]&nbsp;</a>
							<%}
						}
						%>
						<%if(lastPage<totalPage){%>
						<a href="mypay.jsp?currentPage=<%=lastPage+1%>&balance=<%=payVo.getBalance()%>"><img src="../img/last.JPG" alt="다음블럭"></a>
						<%} %>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%> 