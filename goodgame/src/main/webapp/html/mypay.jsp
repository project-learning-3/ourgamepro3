<%@page import="java.sql.SQLException"%>
<%@page import="com.game.payment.model.PaymentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.game.payment.model.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="payVo" class="com.game.payment.model.PaymentVO" scope="page"/>
<jsp:useBean id="payDao" class="com.game.payment.model.PaymentDAO" scope="page"/>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>거래내역</title>

<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body>
<%
	//charge_ok 에서 get방식으로 이동 -> 고객넘 세션이용해서 불러오기
	String Sm_no=request.getParameter("m_no");
	int m_no=Integer.parseInt(Sm_no);	

	PaymentDAO dao=new PaymentDAO();
 
//	int m_no = 2;//테스트용
	List<PaymentVO> list=null;
	try{
		list=payDao.selectbyNo(m_no);
	}catch(SQLException e){
		e.printStackTrace();
	} 
	
	
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
								<th>잔액</th>
								<th>거래일자</th>
								<th>취소여부</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>거래순서</th>
								<th>거래금액</th>
								<th>잔액</th>
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
								<td><%=payVo.getPayno() %></td>
								<td><%=payVo.getBalance() %></td>
								<td><%=payVo.getPayprice() %></td> <!-- 잔액테이블만들어서 추가해야함 -->
								<td><%=payVo.getPaydate() %></td>
								<td><%=payVo.getCancle() %></td>
							</tr>
						<%} %>
						</tbody>
					</table>
				</div>
			</div>
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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../js/demo/datatables-demo.js"></script>

</body>

</html>