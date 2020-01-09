<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/v4-shims.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%= ctxPath %>/resources/jquery-ui-1.11.4.custom/datepicker-ko.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	div#detailContainer {
		
	}
	
	#detailContainer {	
		margin: 100px 0 100px 0;
	}	
		
	#detailContainer .Title_Area {	
		margin: 0 auto;
		width: 100%;
		display: inline-block;
		text-align: center;
	}	
	
	#detailContainer .Title_Area:after {
		content: "";
	  	display: block;
		width : 80%;
		margin : 0 auto;	
		/* padding-top : 100px; */
		border-bottom : solid 2px lightgray;
	}
		
	#detailContainer .Title_Area .st {	
		display: block;
		font-size: 15pt;
		
	}	
		
	#detailContainer .Title_Area .lt {	
		display: block;
		font-size: 35pt;
		font-weight: bold;
	}	
	
	#detailContainer .Title_Area .titleDetail {
		display: block;
		font-size: 11pt;
		padding-top : 15px;
	}
	
	#detailContainer .Title_Area h3 {
		text-align: left;
		padding-left: 10%;
		padding-top: 80px;
	}
	 
	div#detailContents, div#extraInfo {
		width: 80%;
		margin: 0 auto;
		padding-top : 20px;
		padding-bottom: 20px;
		overflow: hidden; /* div밖으로 이미지가 넘칠 때 해결 방법! 기억해둘것! */
	}
	
	table#detailTable, table#extraInfoTable {
		width : 95%;
		margin : 0 auto;
	}
	
	table#detailTable tr td, table#extraInfoTable tr td{
		padding-top : 4px;
		padding-bottom :4px;
		font-size : 12pt;
	}
	
	table#detailTable tr td:first-child {
		width : 100px;
		font-weight: bold;
	}
	
	div#myPoster:before {
		content: "";
	  	display: block;
		width : 80%;		
		border-bottom : solid 2px lightgray;
	}
	
	div#myPoster img, div#bigImage img {
		border-radius: 15px;
		box-shadow: 5px 5px 5px grey;
	}
	
	div#myPoster, div#myImages {
		overflow : hidden;
		font-weight: bold;
	}
	
	div#myImages {
		padding-top : 10px;
	}
	
	div#myImages h2 {
		margin : 0;
		padding-top: 10px;
		padding-bottom: 20px;
	}
	
	div#myPoster:after {
		content: "";
	  	display: block;
		width : 80%;		
		padding-top : 30px;
		border-bottom : solid 2px lightgray;
	}
	
	div#myImages .thumbNail {
		padding : 15px;
	}
	
	div#myImages div#bigImage {
		padding-top : 20px;
	}
	
	div#myImages div#bigImage .bigImage {
		margin-left : 50px;
		margin-right : 50px;
	}
	
	div#myImages div#bigImage .arrow {
		cursor : pointer;
	}
	
	table#extraInfoTable tr td:first-child {
		width : 80px;
		font-weight: bold;
	}
	
	
	div#openBtn {
		padding-top : 20px;
		padding-bottom : 20px;
		overflow : hidden;
		cursor : pointer;
	}
	
	.fa-envelope {
		font-size : 20pt;
		text-decoration: none;
		color : black;
	}
	
	div#emailArtree span {
		vertical-align: top;
	}
	
	.Title_Area .titleContact {
		color : gray;
	}
	
	div#detailContainer input {
		
	}
	
	div#detailContainer input, div#detailContainer textarea {
		width : 100%;
		border : 1px solid lightgray;
		border-radius: 5px;
	}
	
	/* date picker */
	.ui-widget-header {
		background : #ccb3ff !important;
	}
	
	.ui-state-active, .ui-state-active {
		background : #ccb3ff !important;
		border: none !important;
	}
	
	.ui-datepicker {
		box-shadow: 5px 5px 5px grey;
	}
	
	/* 포스터 이미지 등록 부분 */
	#poster-wrap {
		margin: 30px auto;
		border: solid 1px black;
		border-radius: 10px;
		height: 500px;
		width: 400px;
		box-shadow: 5px 5px 5px grey;
	}
	
	#poster {
		width: 100%;
		height: 100%;
/* 		border: solid 2px red; */
/* 		display: none; */
		border-radius: 10px;
	}
	
	#poster-explain {
		font-weight: bold;
		font-size: 1.2em;
		position: relative;
		top: 45%;
	}
	
	#poster-input:hover {
		cursor: pointer;
	}
	
	#poster-input {
		text-align: center;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function(){ 
		
		// datePicker
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
	//	$(".ui-datepicker").css('background','#ffe680');
		$(".ui-datepicker").css('border','none');
		$(".ui-state-active").css('background','#ccb3ff');
		
		
		// 각각 화살표 클릭하면 해당 방향의 
		$("div#myImages div#bigImage .fa-angle-left").click(function(){
			// console.log("left");
		});
		
		$("div#myImages div#bigImage .fa-angle-right").click(function(){
			// console.log("right");
		});
		
		// open 버튼을 클릭한다면 해당 전시회를 '전시중' 상태로 변경한다.
		$("div#openBtn").click(function(){
			var exhibitionCode = "${exhibitionCode}"; // 상세 페이지로 넘어올때 해당 전시회의 전시회 코드를 함께 넘긴다.
			window.location.href="/artree/*.at?exhibitionCode="+exhibitionCode;	
		}); // end of $("div#openBtn").click -----------------------------
		
		
	}); // --------------------------------------------------------------
</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Exhibition</span>
			<span class="lt">Registeration</span>
			<span class="titleDetail">Artree는 작가 여러분이 개최하시는 전시회를 <br/> 홈페이지, 공식 SNS에 홍보합니다.</span>
			<span class="titleContact"><br/>*자료가 많은 경우 아래 메일로 보내주세요.<br/><br/></span>
			
			<div id="emailArtree">
				<i class="far fa-envelope"></i>
				<span style="font-size:13pt;">&nbsp;artree0213@gmail.com</span>
			</div>
			<h3>전시회 등록하기</h3>
		</div>
		<div id="detailContents">
			
			<table id="detailTable">
				<tr>
					<td>신청자 이름</td>
					<td>심예은</td> <!-- ${session.loginuser.username} -->
				<tr>
				<tr>
					<td>전시회명</td>
					<td><input type="text" name="exhibitionTitle" id="exhibitionTitle" /></td>
				<tr>
				<tr>
					<td>작가명</td>
					<td><input type="text" name="author" id="author" /></td>
				<tr>
				<tr>
					<td style="vertical-align: top;">작가정보</td>
					<td>
						<textarea id="authorInfo" name="authorInfo" style="resize:none; border:solid 1px lightgray" rows="5" >
						</textarea>
					</td>
				<tr>
				<tr>
					<td style="vertical-align: top;">전시정보</td>
					<td>
						<textarea id="exhibitionInfo" name="exhibitionInfo" style="resize:none; border:solid 1px lightgray" rows="5" >
						</textarea>
					</td>
				<tr>
				<tr>
					<td>전시관</td>
					<td><input type="text" name="gallery" id="gallery" /></td>
				<tr>
				<tr>
					<td>일정</td>
					<td><input style="width:100px;" class="pickDate" type="text" name="startDate" id="startDate" />
						- 
						<input style="width:100px;" class="pickDate" type="text" name="endDate" id="endDate" />
					</td>
				<tr>
				<tr>
					<td>운영시간</td>
					<td><input style="width:100px;" type="text" name="openTime" id="openTime" />
						- 
						<input style="width:100px;" type="text" name="closeTime" id="closeTime" />
					</td>
				<tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" /></td>
				<tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="tel" id="tel" /></td>
				<tr>
				<tr>
					<td>입장료</td>
					<td>
					
					<input style="width:100px;" type="text" name="price" id="price" />원
					
					</td>
				<tr>
			</table>
		</div>
		
		<div id="myPoster" align="center">
			<h2 style="font-weight:bold">포스터</h2>
			<div id="poster-wrap">
									
			<%-- <c:if test="${ eventImg == null }"> --%>
			<!-- <span id="poster-explain">클릭해서 포스터를 등록해주세요.<br/>전시회 대표 포스터와 동일합니다.</span> -->
			<%-- </c:if> --%>
			<!-- </input> -->
				<img id="poster" style="border: none;"/>
				<c:if test="${ eventImg != null }">
					<input type="text" />
				</c:if>
			</div>
			
			<div align="center" style="margin: 0 auto;">
				<input type="file" id="poster-input" />
			</div>
		</div>
		
		<div id="myImages" align="center">
			<h2 style="font-weight:bold">작품전경</h2> <!--  썸네일 아직 안배워서 일단 이렇게 처리 -->
			<img class="thumbNail" width="200px" height="200px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
			<img class="thumbNail" width="200px" height="200px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
			<img class="thumbNail" width="200px" height="200px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
			
			<div id="bigImage" align="center">
				<i class='fa fa-angle-left arrow' style='font-size:60px; font-weight:bold;'></i>
				<img class="bigImage" width="400px" height="400px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
				<i class='fa fa-angle-right arrow' style='font-size:60px; font-weight:bold;'></i>
			</div>	
		</div>
		
		<div id="extraInfo">
			<table id="extraInfoTable">
				<tr>
					<td>분야</td>
					<td>설치미술</td>
				<tr>
				<tr>
					<td>태그</td>
					<td>
						<span>모던한</span>,
						<span>현대적인</span>
					</td>
				<tr>
			</table>
			<div id="openBtn" align="center">
				<img id="openBtn" src="<%= ctxPath %>/resources/images/board/openDisplyBtn.JPG" />
			</div>
		</div>
	
	</div>
</body>
</html>