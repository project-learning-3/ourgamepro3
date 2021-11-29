<%@page import="java.util.List"%>
<%@page import="com.game.payment.model.PaymentDAO"%>
<%@page import="com.game.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전확인</title>
</head>
<body>
<%

// 비밀번호를 세션에 담아서가져와야 로그인상태인 사람의 비밀번호랑 비교를 할 수 있을것같음,.
// jsp usebean 잘몰라서 물어보기 ㅠ
	request.setCharacterEncoding("utf-8");
	
	String m_pwd=request.getParameter("m_pwd");
	String ch_pwd=request.getParameter("ch_pwd");

	System.out.println(m_pwd);
	System.out.println(ch_pwd);
	
	String s_charge=request.getParameter("m_money");

	System.out.println(s_charge);

	int charge=Integer.parseInt(s_charge);
	
	
	if(m_pwd == null || m_pwd=="" || m_pwd.isEmpty()){ 	%>
	<script type="text/javascript">
		alert('패스워드를 입력하세요.');
		history.back();
	</script>
<%	}else if(m_pwd != ch_pwd){ //같은거 입력해도 이거뜸 확인해보기..	%>
		<script type="text/javascript">
		alert('패스워드가 다릅니다. 다시 확인해주세요.');
		history.back();
		</script>
<%	}else if(charge<10000||charge>=200000){ 	%>
		<script type="text/javascript">
		alert('충전금액은 최소 10,000원 최대 200,000원 입니다.');
		history.back();
		</script>
<%	}
	else if(m_pwd.equals(ch_pwd)) {	

			MemberDAO m_dao=new MemberDAO();
			boolean check=m_dao.checkPwd(m_pwd);
	
			if(check){ //비밀번호 맞으면
				int m_no=m_dao.checkM_no(m_pwd); //고객번호추출
				
				PaymentDAO p_dao=new PaymentDAO();
				int cnt=p_dao.AddBalance(m_no,charge); //잔액충전
			%>
	<script type="text/javascript">
		alter('충전이 완료되었습니다.');
		location.href('mypay.jsp');
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