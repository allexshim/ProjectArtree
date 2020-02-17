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
<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
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
	
	img.thumbNail {
		border-radius: 15px;
	}
	
	div#myImages div#bigImage {
		padding-top : 20px;
	}

	div#myImages div#bigImage .arrow {
		cursor : pointer;
		font-size:60px; 
		font-weight:bold; 
		color : black;
		text-decoration: none;
	}
	
	div#myImages div#bigImage a {
		vertical-align: middle;
	}
	
	.item > img  {
		width : 400px;
		height : 400px !important;
	}
	
	.item {
		display : inline-block;
	}
	
	table#extraInfoTable tr td:first-child {
		width : 160px;
		font-weight: bold;
	}
	
	#extraInfoTable > tbody > tr > td:nth-child(2) {
		font-weight: normal;
	}
	
	#openBtn {
		padding-top : 20px;
		padding-bottom : 20px;
		overflow : hidden;
		cursor : pointer;
	}
	
	table > tbody > tr {
		height: 4vh;
	}
	
</style>


<script type="text/javascript">
	$(document).ready(function(){ 
		
		 $("#myCarousel").carousel({interval: false});
		
		 // Enable Carousel Controls
		  $(".left").click(function(){
		    $("#myCarousel").carousel("prev");
		  });
		  $(".right").click(function(){
		    $("#myCarousel").carousel("next");
		  });
		 
		 
		// open 버튼을 클릭한다면 해당 전시회를 '전시중' 상태로 변경한다.
		$("#openBtn").click(function(){
			var exhibitionCode = "${exhibitionCode}"; // 상세 페이지로 넘어올때 해당 전시회의 전시회 코드를 함께 넘긴다.
			window.location.href="/artree/*.at?exhibitionCode="+exhibitionCode;	
		}); // end of $("#openBtn").click -----------------------------
		
		
	}); // --------------------------------------------------------------
</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">ADMIN ONLY</span>
			<span class="lt">EXHIBITION</span>
			<span class="titleDetail">Artree 에 전시중인 전시회입니다.</span>
		</div>
	
		<div id="detailContents">

			<table id="detailTable">
				<tbody>
				<c:if test="${ not empty exhibitionInfo }">
					<tr>
						<td>no.</td><td>${ exhibitionInfo.exhibitionno }</td>
					</tr>
					<tr>
						<td>지원자명</td><td>${ exhibitionInfo.applier }</td>
					</tr>
					<tr>
						<td>작가명</td><td>${ exhibitionInfo.author }</td>
					</tr>
					<tr>
						<td>전시회명</td><td >${ exhibitionInfo.exhibitionname }</td>
					</tr>
					<tr>
						<td>전시회정보</td><td>${ exhibitionInfo.exhibitioninfo }</td>
					</tr>
					<tr>
						<td>갤러리명</td><td>${ exhibitionInfo.galleryname }</td>
					</tr>
					<tr>
						<td>일정</td><td>${ exhibitionInfo.startdate } - ${ exhibitionInfo.enddate }</td>
					</tr>
					<tr>
						<td>운영시간</td><td>${ exhibitionInfo.openclosetime }</td>
					</tr>
					<tr>
						<td>이메일</td><td>${ exhibitionInfo.email }</td>
					</tr>
					<tr>
						<td>연락처</td><td>${ exhibitionInfo.tel }</td>
					</tr>
					<tr>
						<td>가격</td><td><fmt:formatNumber value="${ exhibitionInfo.price }" pattern="###,###" /> 원</td>
					</tr>
				</c:if>
				</tbody>
			</table>
		</div>
		
		<div id="myPoster" align="center">
			<h2>포스터</h2>
			<c:if test="${ not empty exhibitionInfo }">
			
			<c:if test="${ exhibitionInfo.mainposter.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
			<img src="${ exhibitionInfo.mainposter }" />
			</c:if>
			<c:if test="${ !exhibitionInfo.mainposter.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
			<img src="<%= ctxPath %>/resources/files/${ exhibitionInfo.mainposter }" />
			</c:if>
			
			</c:if>
		</div>
		
		<div id="myImages" align="center">
			<h2>작품전경</h2>
			<div>
				<c:if test="${ not empty exhibitionInfo }">
				
				<c:if test="${ exhibitionInfo.image1 != '없음' }">
				<c:if test="${ exhibitionInfo.image1.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
				<img class="thumbNail" width="200px" height="200px" src="${ exhibitionInfo.image1 }" />
				</c:if>
				<c:if test="${ !exhibitionInfo.image1.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
				<img class="thumbNail" width="200px" height="200px" src="<%= ctxPath %>/resources/files/${ exhibitionInfo.image1 }" />
				</c:if>
				</c:if>
				
				
				<c:if test="${ exhibitionInfo.image2 != '없음' }">
				<c:if test="${ exhibitionInfo.image2.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
				<img class="thumbNail" width="200px" height="200px" src="${ exhibitionInfo.image2 }" />
				</c:if>
				<c:if test="${ !exhibitionInfo.image2.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
				<img class="thumbNail" width="200px" height="200px" src="<%= ctxPath %>/resources/files/${ exhibitionInfo.image2 }" />
				</c:if>
				</c:if>
				
				
				<c:if test="${ exhibitionInfo.image3 != '없음' }">
				<c:if test="${ exhibitionInfo.image3.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
				<img class="thumbNail" width="200px" height="200px" src="${ exhibitionInfo.image3 }" />
				</c:if>
				<c:if test="${ !exhibitionInfo.image3.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
				<img class="thumbNail" width="200px" height="200px" src="<%= ctxPath %>/resources/files/${ exhibitionInfo.image3 }" />
				</c:if>
				</c:if>
				
				</c:if>
			</div>
			
			<c:if test="${ not empty exhibitionInfo && 
						( exhibitionInfo.image1 != '없음' || exhibitionInfo.image2 != '없음' || exhibitionInfo.image3 != '없음' ) }">
			<div id="myCarousel" class="carousel slide"  style="display:inline-block; overflow:hidden;">
				<div id="bigImage" align="center" style="display:inline-block; vertical-align: middle;">
				<a class="left" style="display:inline-block;">
					<i class='fa fa-angle-left arrow'></i>
				</a>
				<div class="carousel-inner" role="listbox" style="display:inline-block; width: 500px; min-height: 505px; overflow:hidden; vertical-align: middle;">
				
					<c:if test="${ exhibitionInfo.image1 != '없음' }">
					<c:if test="${ exhibitionInfo.image1.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
				    <div class="item active">
				      <img src="${ exhibitionInfo.image1 }" alt="" width="400px" height="400px">
				    </div>
				    </c:if>
				    <c:if test="${ !exhibitionInfo.image1.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
				    <div class="item active">
				      <img src="<%= ctxPath %>/resources/files/${ exhibitionInfo.image1 }" alt="" width="400px" height="400px">
				    </div>
				    </c:if>
				    </c:if>
				    
				    <c:if test="${ exhibitionInfo.image2 != '없음' }">
				    <c:if test="${ exhibitionInfo.image2.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
				    <div class="item">
				      <img src="${ exhibitionInfo.image2 }" alt="" width="400px" height="400px">
				    </div>
				    </c:if>
				    <c:if test="${ !exhibitionInfo.image2.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
				    <div class="item">
				      <img src="<%= ctxPath %>/resources/files/${ exhibitionInfo.image2 }" alt="" width="400px" height="400px">
				    </div>
				    </c:if>
				    </c:if>
				    
				    <c:if test="${ exhibitionInfo.image3 != '없음' }">
				    <c:if test="${ exhibitionInfo.image3.contains('http://') }">	<%-- 이미지가 url 일 때 --%>
				    <div class="item">
				      <img src="${ exhibitionInfo.image3 }" alt="" width="400px" height="400px">
				    </div>
				    </c:if>
				    <c:if test="${ !exhibitionInfo.image3.contains('http://') }">	<%-- 이미지가 url 이 아닐 때 --%>
				    <div class="item">
				      <img src="<%= ctxPath %>/resources/files/${ exhibitionInfo.image3 }" alt="" width="400px" height="400px">
				    </div>
				    </c:if>
				    </c:if>
				</div>
					
					<a class="right" style="display:inline-block;">
						<i class='fa fa-angle-right arrow'></i>
					</a>
				</div>
			</div>
			</c:if>
		
			<div id="extraInfo">
				<table id="extraInfoTable">
					<c:if test="${ not empty exhibitionInfo }">
					<c:if test="${ exhibitionInfo.image1info != '없음' }">
					<tr>
						<td>이미지 1 설명</td><td>${ exhibitionInfo.image1info }</td>
					</tr>
					</c:if>
					<c:if test="${ exhibitionInfo.image2info != '없음' }">
					<tr>
						<td>이미지 2 설명</td><td>${ exhibitionInfo.image2info }</td>
					</tr>
					</c:if>
					<c:if test="${ exhibitionInfo.image3info != '없음' }">
					<tr>
						<td>이미지 3 설명</td><td>${ exhibitionInfo.image3info }</td>
					</tr>
					</c:if>
					<tr>
						<td>식음료 반입 가능 여부</td><td>${ exhibitionInfo.foodordrink }</td>
					</tr>
					<tr>
						<td>촬영 가능 여부</td><td>${ exhibitionInfo.photo }</td>
					</tr>
					<tr>
						<td>기타 관람 제한 사항</td><td>${ exhibitionInfo.extrarestriction }</td>
					</tr>
					<tr>
						<td>장르</td><td>${ exhibitionInfo.genre }</td>
					</tr>
					<tr>
						<td>태그</td><td>${ exhibitionInfo.tag }</td>
					</tr>
					</c:if>
				</table>
	<%-- 			<div align="center">
					<img id="openBtn" src="<%= ctxPath %>/resources/images/board/openDisplyBtn.JPG" />
				</div> --%>
			</div>
		</div>
	</div>
</body>
</html>