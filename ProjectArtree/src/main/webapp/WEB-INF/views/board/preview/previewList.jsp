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
	
	#previewContainer {
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
	
	table#previewContents {
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
	
	/* == 페이징 바 == */
	#previewContainer .board_paginate {
		margin-top: 50px;
		text-align: center;
	}
	
	#previewContainer .board_paginate ul {
		display: inline-block;
	  	margin: 0 17px 0 17px;
	    padding: 0;
	}
	
	#previewContainer .board_paginate li {
		display: inline-block;
	}

	#previewContainer .board_paginate li span, #previewContainer .board_paginate li a {
		display: block;
	    width: 31px;
	    padding: 7px 0 6px;
	    box-sizing: border-box;
	    font-size: 16px;
	    color: #000;
	    font-weight: bold;
	    line-height: 14px;
	}

	#previewContainer .board_paginate .this {
		border: 2px solid #000000;
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

		if(${paraMap != null}){
			$("#searchType").val("${paraMap.searchType}");
			$("#searchWord").val("${paraMap.searchWord}");
		}
		
		$("#searchWord").keydown(function(event){
			if(event.keyCode == 13){
				goSearch();
			}
		});
	
		// 검색하기 버튼 클릭
		$("#searchicon").click(function(){
			goSearch();
		}); // end of $("#searchicon").click()
		
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
			
			window.location.href="<%=ctxPath%>/previewList.at?searchType="+searchType+"&searchWord="+searchWord;
		}
		
		
		// 리스트의 전시회 이름을 클릭하면 전시회 상세페이지로 이동한다.
		$("div#contentContainer table tbody td:nth-child(2)").click(function(){
			
			var exhibitionCode = "${exhibitionCode}";
			// 페이지로 들어올 때 전시회 코드도 같이 받아와서, 클릭한 전시회 코드를 넘겨줍니다.
			window.location.href="/artree/*.at?exhibitionCode="+exhibitionCode;	
		});
		
		// 리스트의 리뷰 제목을 클릭하면 리뷰 상세페이지로 이동한다.
		$("div#contentContainer table tbody td:nth-child(3)").click(function(){
			// 글번호를 넘긴다.
			var no = $(this).prev().prev().text();
			window.location.href="/artree/previewDetail.at?no="+no;	
		});
		
		// 글쓰기 페이지로 가기
		$("div#goWrite").click(function(){
			
			if(${sessionScope.loginuser == null}){
				alert("먼저 로그인을 진행해주세요 !");
				location.href="javascript:layer_open('layer')";
				return;
			}
			else{
				window.location.href="/artree/addPreview.at";	
			}
				
		});
		
	});

</script>
</head>
<body>
	<div id="previewContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage4.jpg" />
		</div>

		<div id="topText">
			<span style="text-align:center">Membership</span>
			<h1 style="margin:0; cursor: pointer;" onclick="location.href='<%= ctxPath %>/previewList.at'">Preview</h1>
		</div>
		
		<div id="searchContainer">	
			<select id="searchType">
				<option value="">검색조건</option>
				<option value="name">전시회 이름</option>
				<option value="title">제목</option>
			</select>
			<input id="searchWord" type="text" placeholder="검색어를 입력하세요." />
		
			<a style="vertical-align: middle;"><img id="searchicon" src="<%= ctxPath %>/resources/images/board/searchicon.PNG" /></a>
		</div>
		
		<div id="contentContainer">
			<table id="previewContents">
				<thead>
					<tr>
						<td>No.</td>
						<td>Exhibition</td>
						<td>Title</td>
						<td>WriteDay</td>
						<td>Read</td>
					</tr>	
				</thead>
				
				<tbody>
					<c:if test="${not empty previewListMap}">
						<c:forEach var="previewMap" items="${previewListMap}" varStatus="status">
							<tr>
								<td>${startIdx-status.index}</td>
								<td>${previewMap.NAME}</td>
								<td>${previewMap.TITLE}</td>
								<td>${previewMap.REGDATE}</td>
								<td>${previewMap.READCOUNT}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty previewListMap}">
						<tr>
							<td colspan="5">게시글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<div class="board_paginate" align="center">
		 	${pageBar} 
		</div>
		
		<div id="goWrite">
			<img src="<%= ctxPath %>/resources/images/board/writeBtn.JPG" />
		</div>
		
	</div>

</body>
</html>