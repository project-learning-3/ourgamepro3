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
	int m_no=(int)session.getAttribute("m_no");

	PaymentDAO dao=new PaymentDAO();
 
	//int m_no = 2;//테스트용
	List<PaymentVO> list=null;
	try{
		list=payDao.selectbyNo(m_no);
	}catch(SQLException e){
		e.printStackTrace();
	} 
	
	//숫자가 순서대로 안나옴
	
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
						<tfoot>
							<tr>
								<th>거래순서</th>
								<th>거래금액</th>
								<th>거래일자</th>
								<th>취소여부</th>
							</tr>
						</tfoot>
						<tbody>
						<%
							for(int i=0;i<list.size();i++){
								payVo =list.get(i);
						%>
							<tr>
								<td><%=list.size()-i%></td>
								<td><%=payVo.getPayprice() %></td> 
								<td><%=payVo.getPaydate() %></td>
								<td><%=payVo.getCancle() %></td>
							</tr>
						<%} %>
						</tbody>
					</table>
					<p style="font-size:20px;text-align:right;">잔액 : <%=payVo.getBalance() %></p>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%> 