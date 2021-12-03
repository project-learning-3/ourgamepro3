<%@page import="com.game.developer.model.DeveloperVO"%>
<%@page import="com.game.payment.model.PaymentDAO"%>
<%@page import="com.game.developer.model.DeveloperDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인출확인</title>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");

String d_pwd=request.getParameter("d_pwd");
String ch_pwd=request.getParameter("ch_pwd");

System.out.println(d_pwd);
System.out.println(ch_pwd);

String s_charge=request.getParameter("c_money");

System.out.println(s_charge);

int charge=Integer.parseInt(s_charge);

if(d_pwd == null || d_pwd=="" || d_pwd.isEmpty()){ 	%>
	<script type="text/javascript">
		alert('패스워드를 입력하세요.');
		history.back();
	</script>
	<%	}else if(!d_pwd.equals(ch_pwd)){	%>
	<script type="text/javascript">
		alert('패스워드가 다릅니다. 다시 확인해주세요.');
		history.back();
	</script>
	<%	}
	else if(d_pwd.equals(ch_pwd)) {	//비밀번호같음

			DeveloperDAO d_dao=new DeveloperDAO();
			DeveloperVO vo=null;
			vo.setD_pwd(d_pwd);
			boolean check=d_dao.checkPwd(vo);
			//System.out.print(vo.getD_pwd());
	
			if(check){ //비밀번호 맞으면
				String d_no=(String)session.getAttribute(d_no); 
				System.out.print(d_no);
				int member_no=Integer.parseInt(d_no);
				
				PaymentDAO p_dao=new PaymentDAO();
				int cnt=p_dao.Withdraw(d_no,charge); /////////
				//저장할 테이블이없는디.. 만드렁야함 ㅠㅠㅠㅠ
				//+) 개발자의잔액넣을거도 만들어야함,
			%>
	<script type="text/javascript">
		alter('충전이 완료되었습니다.');
		location.href('../html/mypay.jsp');
	</script>
	<%}else{%>
	<script type="text/javascript">
		alter('비밀번호를 다시 확인해주세요');
		history.back();
	</script>
	<%}
	}
%>

</body>
</html>