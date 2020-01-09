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
	
	div#detailContents {
		width: 80%;
		margin: 0 auto;
		padding-top : 20px;
		padding-bottom: 20px;
		overflow: hidden; /* div밖으로 이미지가 넘칠 때 해결 방법! 기억해둘것! */
		font-size :
	}
	
	table#detailTable tr td {
		padding-top : 2px;
		padding-bottom :2px;
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
		padding-top : 20px;
		border-bottom : solid 2px lightgray;
	}
	
	div#myPoster, div#myImages {
		padding-top : 10px;
		overflow : hidden;
		font-weight: bold;
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
	
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		
		
		
	})
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
			<img width="200px" height="200px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
			<img width="200px" height="200px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
			<img width="200px" height="200px" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
		
			
		</div>
	
	</div>
</body>
</html>