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
			window.location.href="/artree/reviewDetail.at?no="+no;	
		});
		
		// 글쓰기 페이지로 가기
		$("div#goWrite").click(function(){
			window.location.href="/artree/addReview.at";	
		});
		
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
			<h1 style="margin:0;">Review</h1>
		</div>
		
		<div id="searchContainer">	
			<select id="searchCondition">
				<option value="">검색조건</option>
				<option value="name">전시회 이름</option>
				<option value="titleContents">제목+글내용</option>
				<option value="writer">작성자</option>
			</select>
			<input id="searchWord" type="text" placeholder="검색어를 입력하세요." />
		
			<a style="vertical-align: middle;"><img id="searchicon" src="<%= ctxPath %>/resources/images/board/searchicon.PNG" /></a>
		</div>
		
		<div id="contentContainer">
			<table id="reviewContents">
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
					<tr>
						<td>1</td>
						<td>국립현대미술관 50주년 기념전 《광장: 미술과 사회 1900-2019》개최</td>
						<td>리뷰제목리뷰제목리뷰제목리목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>2</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>3</td>
						<td>가나아트 컬렉션 상설전 시대유감 時代遺憾 </td>
						<td>리뷰제목리뷰제목리뷰제목제목리뷰제</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>4</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>5</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>6</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>7</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>8</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>9</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>10</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>리뷰제목리뷰제목리뷰제목</td>
						<td>2020-01-10 22:10</td>
						<td>5</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 페이징바 들어올 자리 -->
		<!-- 페이지 바 여유되면 넣겠습니다........ㅠㅠㅠㅠㅠㅠㅠㅠㅠ-->
		<div class="pagination" align="center">
		<%-- 	${pageBar} --%>
		</div>
		
		<div id="goWrite">
			<img src="<%= ctxPath %>/resources/images/board/writeBtn.JPG" />
		</div>
		
	</div>

</body>
</html>