<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	div.idFind_container {
		width: 658px;
		margin: 0 auto;
		text-align: center;
		border: 1px solid #dcdcdc;
		height: 280px;
		border-radius: 10px;
		margin-top: 185px;
		margin-bottom: 56px;
	}
	
	div.idFind_wrap {
		width: 400px;
		margin: 0 auto;
	}
	
	/* h2 */
	div.idFind_container h2 {
		font-size: 35px;
		margin-top: 44px;
		margin-bottom: 31px;
		font-weight: bold;
	}
	
	/* span */
	div.idFind_container span {
		display: block;
		margin-top: 31px;
		margin-bottom: 38px;
	}
	
	/* 로그인 버튼 */
	button#login_find_btn {
		background: #000;
		width: 250px;
		margin-top: 38px;
		padding: 10px 40px;
		color: #fff;
		font-size: 18px;
		border-radius: 5px;
		margin: 0 auto;
		border: 0;
		cursor: pointer;
		outline: none;
	}
	
</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
</script>

<body>
	<body>
	<div class="idFind_container">
		<h2>이메일 찾기</h2>
		<span>회원님의 이메일은 <b>${email}</b>입니다.</span>
		
		<button type="button" id="login_find_btn" class="login_btn" onClick="javascript:layer_open('layer')">로그인</button>
	</div>
	
</body>