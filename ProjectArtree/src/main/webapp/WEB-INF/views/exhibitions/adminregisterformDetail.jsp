<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

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
		padding-top : 100px;
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
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		
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
			<span class="st">ADMIN ONLY</span>
			<span class="lt">Registeration</span>
			<span class="titleDetail">Artree는 작가 여러분이 개최하시는 전시회를 <br/> 홈페이지, 공식 SNS에 홍보합니다.</span>
		</div>
	
		<div id="detailContents">

			<table id="detailTable">
				<tr>
					<td>전시회코드</td>
					<td>ABC-DER-123456</td>
				<tr>
				<tr>
					<td>신청자 이름</td>
					<td>심예은</td>
				<tr>
				<tr>
					<td>전시회명</td>
					<td>전시회명전시회명전시회명전시회명전시회명전시회명</td>
				<tr>
				<tr>
					<td>작가명</td>
					<td>심예은</td>
				<tr>
				<tr>
					<td>작가정보</td>
					<td>수상내역전시경력수상내역전시경력수상내역전시
						경력수상내역전시경력수상내역전시경력ㅍ수상내역전시경력ㅍ
						수상내역전시경력수상내역전시경력수상내역전시
						경력수상내역전시경력수상내역전시경력ㅍ수상내역전시경력ㅍ
					</td>
				<tr>
				<tr>
					<td>전시정보</td>
					<td>수상내역전시경력수상내역전시경력수상내역전시
						경력수상내역전시경력수상내역전시경력ㅍ수상내역전시경력ㅍ
						수상내역전시경력수상내역전시경력수상내역전시
						경력수상내역전시경력수상내역전시경력ㅍ수상내역전시경력ㅍ
					</td>
				<tr>
				<tr>
					<td>전시관</td>
					<td>갤러리이름갤러리이름</td>
				<tr>
				<tr>
					<td>일정</td>
					<td>2020-01-10 - 2020-02-28</td>
				<tr>
				<tr>
					<td>운영시간</td>
					<td>12:00 - 22:00</td>
				<tr>
				<tr>
					<td>이메일</td>
					<td>kh.shim2019@gmail.com</td>
				<tr>
				<tr>
					<td>연락처</td>
					<td>010-0000-0000</td>
				<tr>
				<tr>
					<td>입장료</td>
					<td><fmt:formatNumber value="12000" pattern="###,###" />원</td>
				<tr>
			</table>
		</div>
		
		<div id="myPoster" align="center">
			<h2>포스터</h2>
			<img src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
		</div>
		
		<div id="myImages" align="center">
			<h2>작품전경</h2> <!--  썸네일 아직 안배워서 일단 이렇게 처리 -->
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