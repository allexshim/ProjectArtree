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
	
	#communityContainer {
		padding-bottom : 100px;
	}
	
	img#boardtop {
		/* position : absolute; */
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		padding-top : 50px;
		width : 100px;
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
	
	div#searchContainer #searchType {
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
	
	table#communityContents {
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
		width : 25%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(4), div#contentContainer table tbody td:nth-child(3) {
		width : 30%;
		text-align: center;
	}
	
	div#contentContainer table tbody td:nth-child(2), div#contentContainer table tbody td:nth-child(3) {
		cursor: pointer;
	}

	div#contentContainer table thead td:nth-child(5), div#contentContainer table tbody td:nth-child(4) {
		width : 10%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(6), div#contentContainer table tbody td:nth-child(5) {
		width : 5%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(7), div#contentContainer table tbody td:nth-child(5) {
		width : 5%;
		text-align: center !important;
	}

	div#contentContainer table thead td {
		padding-top : 10px;
		padding-bottom : 10px; 
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
			goSearch();
		}); // end of $("#searchicon").click()
		
		// 엔터 치기
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13){
				goSearch();
			}
		});
		
		// 리스트의 전시회 이름을 클릭하면 전시회 상세페이지로 이동한다.
		$("div#contentContainer table tbody td:nth-child(2)").click(function(){
			
			var exhibitionno = $(this).next().text();
			
			// 페이지로 들어올 때 전시회 코드도 같이 받아와서, 클릭한 전시회 코드를 넘겨줍니다.
			window.location.href="/artree/exhDetail.at?eno="+exhibitionno;	
		});
		
		// 리스트의 리뷰 제목을 클릭하면 리뷰 상세페이지로 이동한다.
		$("div#contentContainer table tbody td:nth-child(4)").click(function(){
			// 글번호를 넘긴다.
			var no = $(this).prev().prev().prev().text();
			window.location.href="/artree/communityDetail.at?no="+no;	
		});
		
		// 글쓰기 페이지로 가기
		$("div#goWrite").click(function(){
			if(${sessionScope.loginuser == null}){
				alert("먼저 로그인 하세요!");
				location.href="javascript:layer_open('layer')";
				return;
			}
			else {
				window.location.href="/artree/addCommunity.at";	
			}
		});
		
	}); // end of document.ready ------------------------------------------------

	function goSearch(){
		// 유효성 검사
		var searchType = $("#searchType").val().trim();
		var searchWord = $("#searchWord").val().trim();
		
		if( searchType == "" ){
			alert("검색 조건을 선택하세요.");
			return;
		}
		else if( searchWord == "" ){
			alert("검색어를 입력하세요.");
			$("#searchWord").focus();
			return;
		}
		window.location.href="/artree/communityList.at?searchType="+searchType+"&searchWord="+searchWord;
	} // end of goSearch() ------------------------
	
</script>
</head>
<body>
	<div id="communityContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage3.jpg" />
		</div>

		<div id="topText">
			<span style="text-align:center">Membership</span>
			<h1 style="margin:0;">Community</h1>
		</div>
		
		<div id="searchContainer">	
			<select id="searchType">
				<option value="">검색조건</option>
				<option value="name">전시회 이름</option>
				<option value="titleContents">제목+글내용</option>
				<option value="writer">작성자</option>
			</select>
			<input id="searchWord" type="text" placeholder="검색어를 입력하세요." />
		
			<a style="vertical-align: middle;"><img id="searchicon" src="<%= ctxPath %>/resources/images/board/searchicon.PNG" /></a>
		</div>
		
		<div id="contentContainer">
			<table id="communityContents">
				<c:if test='${communityList != null or communityList != "" }'>
					<thead>
						<tr style="text-align: center !important;">
							<td>No.</td>
							<td>Exhibition</td>
							<td style="display:none;"></td>
							<td>Title</td>
							<td>Writer</td>
							<td>WriteDay</td>
							<td>Read</td>
						</tr>	
					</thead>
					
					<tbody><!-- exhibitionname, C.title, C.name, C.writeday, C.readcount -->
						<c:forEach var="item" items="${communityList}">
							<tr>
								<td>${item.no}</td>
								<td>${item.exhibitionname}</td>
								<td style="display:none;">${item.exhibitionno}</td>
								<td style="cursor:pointer;">${item.title} <c:if test="${item.CmtCount != 0}"><span style="font-weight:bold; font-size: 10pt;">[${item.CmtCount}]</span></c:if></td>
								<td>${item.name}</td>
								<td>${item.writeday}</td>
								<td style="text-align: center !important;">${item.readcount}</td>		
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				<c:if test='${communityList == null or communityList == "" }'>
					<thead>
						<tr>
							<td colspan="4">아직 등록된 글이 없습니다.</td>
						</tr>	
					</thead>
				</c:if>
			</table>
		</div>

		<!-- 페이징바  -->
		<div class="pagination" align="center">
			${pageBar}
		</div>
		
		<div id="goWrite">
			<img src="<%= ctxPath %>/resources/images/board/writeBtn.JPG" />
		</div>
		
	</div>

</body>
</html>