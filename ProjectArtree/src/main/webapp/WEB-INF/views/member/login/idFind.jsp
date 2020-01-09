<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	/* 기본 */
	
	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	div.idFind_container {
		width: 658px;
		margin: 0 auto;
		text-align: center;
		border: 1px solid #dcdcdc;
		height: 581px;
		border-radius: 10px;
		margin-top: 70px;
	}
	
	div.idFind_wrap {
		width: 400px;
		margin: 0 auto;
	}
	
	/* 드래그 시 색상변경 */
	::selection {
	    background-color: #6e1fff;
	    color: #fff;
	}

	/* 아이디 찾기 */
	div.idFind_container h2 {
		font-size: 35px;
		margin: 44px 0 31px;
		font-weight: bold;
	}
	
	div.idFind_container span {
		font-size: 16px;
	}
	
	/* 항목 입력 */
	/* 성함 */
	div.input_div {
		border-bottom: 1px solid #ddd;
		width: 100%;
		padding-top: 63px;
		margin: 0 auto;
	}
	
	input#name {
		border: none;
		width: 95%;
		padding: 8px;
		font-size: 14px;
	}
	
	/* 성별 */
	div.gender_div {
		margin-top: 21px;
		height: 40px;
		width: 100%;
	}
	
	button#gender_male {
		float: left;
		width: 50%;
		cursor: pointer;
		font-weight: bold;
		height: 40px;
		background-color: #fff;
		color: #757575;
		border: 1px solid #e7e7e7;
		outline: none;
	}
	
	button#gender_female {
		float: right;
		width: 50%;
		cursor: pointer;
		font-weight: bold;
		height: 40px;
		background-color: #fff;
		color: #757575;
		border: 1px solid #e7e7e7;
		outline: none;
	}
	
	/* 선택 시 css 변경 */
	.on {
		color: #612581 !important; 
		border: 2px solid black !important;
	}
	
	/* 연령 */
	div.age_div {
		margin-top: 21px;
		width: 100%;
	}
	
	select#age_select {
		width: 400px;
		text-align-last: center;
		font-size: 14px; 
		height: 40px;
	}
	
	/* 지역 */
	div.area_div {
		width: 100%;
		margin-top: 21px;
	}
	
	select#area_select {
		width: 400px;
		text-align-last: center;
		font-size: 14px; 
		height: 40px;
	}
	
	/* 밑줄 */
	div.blank {
		width: 500px;
		border-top: 1px solid #d7d7d7;
		height: 1px;
		margin: 0 auto;
		margin-top: 35px;
	}
	
	/* 확인 버튼 */
	div.btn_div {
		width: 500px;
		margin: 0 auto;
		margin-top: 36px;
		text-align: center;
	}
	
	button#submit_btn {
		background: #000;
		width: 250px;
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
	function gender_chg(g) {
		$(".gender").removeClass("on");
		$("#gender_"+g).addClass("on");
		$("#gender").val(g);
	}
</script>

<body>
	<div class="idFind_container">
		<h2>아이디 찾기</h2>
		<span>회원가입 시 기입한 항목을 입력해 주세요.</span>
		
		<div class="idFind_wrap">
			<div class="input_div">
				<input type="text" placeholder="성함" id="name"/>
			</div>
			<div class="gender_div">
				<button type="button" id="gender_male" class="gender on" onclick="javascript:gender_chg('male')">남</button>
				<button type="button" id="gender_female" class="gender" onclick="javascript:gender_chg('female')">여</button>
			</div>
			<div class="age_div">
				<select id="age_select">
					<option value="">연령</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대이상</option>
				</select>
			</div>
			<div class="area_div">
				<select id="area_select">
					<option value="">지역선택</option>
					<option value="0">서울</option>
					<option value="1">부산</option>
					<option value="2">대구</option>
					<option value="3">인천</option>
					<option value="4">광주</option>
					<option value="5">대전</option>
					<option value="6">울산</option>
					<option value="7">세종</option>
					<option value="8">강원</option>
					<option value="9">경기</option>
					<option value="10">경남</option>
					<option value="11">경북</option>
					<option value="12">전남</option>
					<option value="13">전북</option>
					<option value="14">제주</option>
					<option value="15">충남</option>
					<option value="16">충북</option>
				</select>
			</div>
		</div>
		<div class="blank">
		</div>
		<div class="btn_div">
			<button type="button" id="submit_btn" onClick="find_id();">확인</button>
		</div>
	</div>
	
	<!-- 이메일 찾기 -->
	<form method="post" action="" id="find_form">
		<input type="hidden" name="find_email" id="find_email">
	</form>
</body>