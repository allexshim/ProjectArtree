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
	
	#reviewContainer {
		padding-bottom : 100px;
	}
	
	img#boardtop {
		position : absolute;
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		padding-top : 610px;
		width : 40vw;
		text-align: center;
		padding-left : 60px;
	}
	
	div#topText span {
		font-size : 15pt;
	}
	
	div#topText > h1 {
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
	
	div#contentContainer {
		clear:both;
	}
	
	div#contentContainer {
		padding-top : 50px;
	}
	
	/* == 테이블 부분 == */
	
	table#reviewContents {
		width : 90%;
		margin : 0 auto;
		border-collapse: collapse;
	}

	div#contentContainer table td {
		font-size: 14pt;
		padding-top : 10px;
		padding-bottom : 10px; 
	}

	div#contentContainer table thead tr {
		font-size: 16pt;
		font-weight:bold;
		border-bottom : solid 2px lightgray;
	}
	
	div#contentContainer table thead td:first-child, div#contentContainer table tbody td:first-child {
		width : 5%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(2), div#contentContainer table tbody td:nth-child(2) {
		width : 35%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(3), div#contentContainer table tbody td:nth-child(3) {
		width : 25%;
		text-align: center;
	}
	
	div#contentContainer table tbody td:nth-child(2), div#contentContainer table tbody td:nth-child(3) {
		cursor: pointer;
	}

	div#contentContainer table thead td:nth-child(4), div#contentContainer table tbody td:nth-child(4) {
		width : 10%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(5), div#contentContainer table tbody td:nth-child(5) {
		width : 5%;
		text-align: center;
	}

	div#contentContainer table thead td {
		padding-top : 10px;
		padding-bottom : 10px; 
	}
	
	#reviewContents > tbody > tr:hover {
		cursor: pointer;
		box-shadow: 3px 3px 3px 3px grey;
	}
	
	/* == 페이징 바 == */
	.pageNumber {
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
	  display: block;
	}
	
	.pagination a {
	  color: black;
	  padding: 3px 10px;
	  text-decoration: none;
	  cursor : pointer;
	  margin : 0 10px;
	}
		
	.pagination span.active {
	 	border : solid 2px black;
	 	color: black;
		padding: 3px 10px;
		text-decoration: none;
		cursor : pointer;
		margin : 0 10px;
		font-size: 16px; 
		font-weight: bold;  
	}
		
	.pagination a:hover, .pagination span:hover {
	   text-decoration: underline;
	}
	
	div#goWrite {
		float : right;
		padding-right : 7%;
		cursor : pointer;
	}
		
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		
		// 검색하기 버튼 클릭
		$("#searchicon").click(function(){
			
			// 유효성 검사
			var searchCondition = $("#searchCondition").val().trim();
			var searchWord = $("#searchWord").val().trim();
			
			if( searchCondition == "" ){
				alert("검색 조건을 선택하세요.");
				return;
			}
			
			else if( searchWord == "" ){
				alert("검색어를 입력하세요.");
				$("#searchWord").focus();
				return;
			}
			
			window.location.href="**.at?searchCondition="+searchCondition+"&searchWord="+searchWord;

		}); // end of $("#searchicon").click()
		
		// 각 글제목을 클릭하면 상세 페이지로 이동
		$("div#contentContainer table tbody td:nth-child(2)").click(function(){
			var no = $(this).prev().text(); // 클릭한 글번호를 받아온다.

			window.location.href="/artree/memberInfo.at?no="+no;
			
		}); // end of $("div#contentContainer table tbody td:nth-child(2)").click
		
	});

</script>
</head>
<body>
	<div id="reviewContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage1.jpg" />
		</div>

		<div id="topText">
			<span style="text-align:center">Membership</span>
			<h1 style="margin:0;">Member List</h1>
		</div>
		
		<div id="searchContainer">	
			<select id="searchCondition">
				<option value="">검색조건</option>
				<option value="name">회원명</option>
				<option value="no">회원번호</option>	<%-- 회원번호 value 바꾸기 --%>
				<option value="email">이메일</option>
			</select>
			<input id="searchWord" type="text" placeholder="검색어를 입력하세요." />
		
			<a style="vertical-align: middle;"><img id="searchicon" src="<%= ctxPath %>/resources/images/board/searchicon.PNG" /></a>
		</div>
		
		<div id="contentContainer">
			<table id="reviewContents">
				<thead>
					<tr>
						<td>No.</td>
						<td>NAME</td>
						<td>PHONE</td>
						<td>STATUS</td>
					</tr>	
				</thead>
				
				<tbody>
					<tr>
						<td>1</td>
						<td>심예은</td>
						<td>010-9479-4312</td>
						<td>가입</td>
					</tr>
					<tr>
						<td>2</td>
						<td>이다희</td>
						<td>010-9479-4312</td>
						<td>가입</td>
					</tr>
					<tr>
						<td>3</td>
						<td>박서준</td>
						<td>010-9479-4312</td>
						<td>탈퇴</td>
					</tr>
					<tr>
						<td>4</td>
						<td>김민하</td>
						<td>010-9479-4312</td>
						<td>가입</td>
					</tr>
					<tr>
						<td>5</td>
						<td>박수연</td>
						<td>010-9479-4312</td>
						<td>가입</td>
					</tr>
					<tr>
						<td>6</td>
						<td>김현준</td>
						<td>010-9479-4312</td>
						<td>탈퇴</td>
					</tr>
					<tr>
						<td>7</td>
						<td>김현지</td>
						<td>010-9479-4312</td>
						<td>탈퇴</td>
					</tr>
					<tr>
						<td>8</td>
						<td>정하빈</td>
						<td>010-9479-4312</td>
						<td>가입</td>
					</tr>
					<tr>
						<td>9</td>
						<td>임소미</td>
						<td>010-9479-4312</td>
						<td>가입</td>
					</tr>
					<tr>
						<td>10</td>
						<td>지서영</td>
						<td>010-9479-4312</td>
						<td>탈퇴</td>
					</tr>
				</tbody>
			</table>
		</div>

		<%-- 페이지바 --%>
		<div></div>

	</div>

</body>
</html>