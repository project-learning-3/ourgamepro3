<%@page import="java.sql.SQLException"%>
<%@page import="com.game.payment.model.PaymentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.game.payment.model.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 거래목록</title>
</head>
<body>
<%
	//charge_ok 에서 get방식으로 이동
	String Sm_no=request.getParameter("m_no");
	int m_no=Integer.parseInt(Sm_no);	

	PaymentDAO dao=new PaymentDAO();
	
	List<PaymentVO> list=null;
	try{
		list=dao.selectbyNo(m_no);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!-- 테이블만들어서 전체 거래목록 불러올것. null 일 경우 공백으로 채우기 -->
	<table>
		<tr>
			<th>거래순서</th>
			<th>거래금액</th>
			<th>잔액</th>
			<th>거래일자</th>
			<th>취소여부</th>
			<th>취소일</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</body>
</html>