<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 내용추가 -->
<article>
	<!-- main -->
	<span>새소식</span>
	<input id="button" type="button" value="추가" onclick="add()">
	<div id="container">
		<!-- 게임 새로등록되면 ng클래스 추가해서 새소식에 업데이트됨 -->
		<!-- <div class='ng'>
			original
		</div> -->
	</div>
</article>
<%@ include file="../inc/bottom.jsp"%> 