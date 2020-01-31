<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
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
	
	#memberinfo-container {
		padding-bottom : 100px;
		width: 70%;
		margin: 0 auto;
	}
	
	img#boardtop {
		position : absolute;
		width : 96vw;
		height : 540px;
	}
	
	div#topText {
		padding-top : 610px;
		width : 40vw;
		text-align: left;
		padding-left : 60px;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}
	
	div#middleText {
		padding-top : 8vh;
		width : 40vw;
		text-align: left;
		padding-left : 60px;
	}
	
	div#middleText > h1 {
		font-size: 50px;
	}
	
	/* == 검색바 부분 == */
	
	div#searchContainer {
		float : right;
		padding-right : 100px;
		vertical-align: middle;
	}
	
	div#searchContainer input#searchWord {
		border : none;
		padding-bottom: 5px;
		border-bottom : solid 1px black;
		font-size : 12pt;
	} 
	
	div#searchContainer #searchCondition {
		font-size : 12pt;
		height : 30px;
		margin-right : 10px;
	}
	
	div#searchContainer #searchicon {
		cursor : pointer;
	}
	
	/* == table 부분 == */
	
	#orderContents {
		clear:both;
		margin-top : 10vh;
		text-align: center !important;
	}
	
	th {text-align: center !important;}
	
	#orderContents > tbody > tr:hover {
		cursor: pointer;
		box-shadow: 3px 3px 3px 3px grey;
	}
	
	/* == ul 부분 == */
	
	#infos {
		margin-top: 10vh;
	}
	
	#infos > ul > li {
		line-height: 300%;
		font-size: 1.3em;
	}
	
	#infos > ul > li > label {
		width: 100px;
		
	}
	
	/* == 페이징 버튼 == */
	#morebtn {
		width: 120px;
		height: 50px;
		font-weight: bold;
		font-size: 1.3em;
		background-color: black;
		color: white;
		border: none;
		margin-top: 5vh;
	}
		
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){ 
		
		
		
	});

</script>
</head>
<body>

	<div id="imgcontainer">	
	  	<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage1.jpg" />
	</div>

	<div id="memberinfo-container">

		<div id="topText">
			<h1 style="margin:0;">Member Info</h1>
		</div>
		
		<div id="infos">
		
			<ul style="list-style-type: none;">
			
				<li><label>No.</label><span>${ memberInfo.idx }</span></li>
				<li><label>EMAIL</label><span>${ memberInfo.email }</span></li>
				<li><label>NAME</label><span>${ memberInfo.name }</span></li>
				<li><label>GENDER</label><span>${ memberInfo.gender }</span></li>
				<li><label>AGELINE</label><span>${ memberInfo.agegroup }</span></li>
				<li><label>AREA</label><span>${ memberInfo.area }</span></li>
				<li><label>PHONE</label><span>${ memberInfo.hp }</span></li>
				<li><label>STATUS</label><span>${ memberInfo.status }</span></li>
			
			</ul>
		
		</div>
		
		<hr style="border-bottom: 1px solid grey; margin-top: 10vh;">
		
		<div id="middleText">
			<h1 style="margin:0;">Order Info</h1>
		</div>
		
		<div id="contentContainer" class="container">
			<table id="orderContents" class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>DATE</th>
						<th>PRICE</th>
						<th>NAME</th>
						<th>PHONE</th>
					</tr>	
				</thead>
				
				<tbody>
					<c:if test="${ not empty orderList }">
					<c:forEach var="order" items="${ orderList }">
					<tr>
						<td>${ order.reserno }</td>
						<td>${ order.reserdate }</td>
						<td>${ order.resertotal }</td>
						<td>${ order.name }</td>
						<td>${ order.hp }</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${ empty orderList }">
					<tr>
						<td colspan="5">주문내역이 없습니다.</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			<div style="margin: 0 auto" align="center">
				<button type="button" id="morebtn">MORE</button>
			</div>
		</div>
		
	</div>

</body>
</html>