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
		height: 631px;
		border-radius: 10px;
		margin-top: 200px;
		margin-bottom: 100px;
	}
	
	div.idFind_wrap {
		width: 400px;
		margin: 0 auto;
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
	
	input#hp {
		border: none;
		width: 95%;
		padding: 8px;
		font-size: 14px;
	}
	
	/* 성별 */
	div.gender_div {
		margin-top: 25px;
		height: 40px;
		width: 100%;
	}
	
	button#gender_1 {
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
	
	button#gender_2 {
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
	$(function() {
		
		$("#gender").val("1");
		
		$("#age_select").click(function() {
			$("#agegroup").val($("#age_select option:selected").val());
		}); 
		
		$("#area_select").click(function() {
			$("#area").val($("#area_select option:selected").val());
		});
	});

	function gender_chg(g) {
		$(".gender").removeClass("on");
		$("#gender_"+g).addClass("on");
		$("#gender").val(g);
	}
	
	function find_id() {
		
		if($("#name").val().trim() == "") {
			alert("성함을 입력해 주세요.");
			$("#name").focus();
			return;
		}	
		else if($("#hp").val().trim() == "") {
			alert("전화번호를 입력해 주세요.");
			$("#hp").focus();
			return;
		}
		else if($("#gender").val().trim() == "") {
			alert("성별을 선택해 주세요.");
			$("#gender").focus();
			return;
		}
		else if($("#agegroup").val().trim() == "") {
			alert("연령대를 선택해 주세요.");
			$("#agegroup").focus();
			return;
		}
		else if($("#area").val().trim() == "") {
			alert("지역 선택해 주세요.");
			$("#area").focus();
			return;
		}
	
		 var frm = document.idFind;
		  frm.method = "POST";
		  frm.action = "idFindEnd.at";
		  frm.submit();
	}
</script>

<body>
	<div class="idFind_container">
		<h2>아이디 찾기</h2>
		<span>회원가입 시 기입한 항목을 입력해 주세요.</span>
		<form name="idFind">
		<div class="idFind_wrap">
			<div class="input_div">
				<input type="text" placeholder="성함" name="name" id="name"/>
			</div>
			<div class="input_div" style="padding-top: 15px;">
				<input type="text" placeholder="전화번호" name="hp" id="hp"/>
			</div>
			
			<div class="gender_div">
				<button type="button" id="gender_1" class="gender on" onclick="javascript:gender_chg(1)">남</button>
				<button type="button" id="gender_2" class="gender" onclick="javascript:gender_chg(2)">여</button>
				<input type="hidden" name="gender" id="gender" />
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
				<input type="hidden" name="agegroup" id="agegroup" />
			</div>
			<div class="area_div">
				<select id="area_select">
					<option value="">지역선택</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="강원">강원</option>
						<option value="경기">경기</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="제주">제주</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
				</select>
				<input type="hidden" name="area" id="area" />
			</div>
		</div>
		</form>
		<div class="blank">
		</div>
		<div class="btn_div">
			<button type="button" id="submit_btn" onClick="find_id()">확인</button>
		</div>
	</div>
	
</body>