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
	
	#registerFormContainer {
		padding-bottom : 100px;
	}
	
	img#boardtop {
		position : absolute;
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		padding-top : 610px;
		width : 100px;
		text-align: center;
		padding-left : 60px;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}
	
	/* == 테이블 부분 == */
	div#contentContainer {
		padding-top : 100px;
	}
	
	table#registerFormContents {
		width : 90%;
		margin : 0 auto;
		border-collapse: collapse;
	}

	div#contentContainer table td {
		padding-top : 10px;
		padding-bottom : 10px; 
	}

	div#contentContainer table thead tr {
		font-size: 16pt;
		font-weight:bold;
		border-bottom : solid 2px lightgray;
	}
	
	div#contentContainer table thead td:first-child, div#contentContainer table tbody td:first-child {
		width : 10%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(2), div#contentContainer table tbody td:nth-child(2) {
		width : 50%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(3), div#contentContainer table tbody td:nth-child(3) {
		width : 15%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(4), div#contentContainer table tbody td:nth-child(4) {
		width : 20%;
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
			
			/*임의 링크로 설정*/
			window.location.href="/artree/registerformList.at?searchCondition="+searchCondition+"&searchWord="+searchWord;

		}); // end of $("#searchicon").click()
		
	});

</script>
</head>
<body>
	<div id="registerFormContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage1.jpg" />
		</div>

		<div id="topText">
			<span style="text-align:center">ADMIN ONLY</span>
			<h1 style="margin:0;">Registeration</h1>
		</div>
		
		<div id="eachStatus">
			<span>전체</span>
			<span>검토 대기중</span>
			<span>전시중</span>
			<span>전시종료</span>
		</div>
		
		<div id="contentContainer">
			<table id="registerFormContents">
				<thead>
					<tr>
						<td>No.</td>
						<td>Title</td>
						<td>Submit</td>
						<td>Status</td>
					</tr>	
				</thead>
				
				<tbody>
					<tr>
						<td>1</td>
						<td>국립현대미술관 50주년 기념전 《광장: 미술과 사회 1900-2019》개최</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/watingBtn.JPG" /></td>
					</tr>
					<tr>
						<td>2</td>
						<td>국립현대미술관 50주년 기념전국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/watingBtn.JPG" /></td>
					</tr>
					<tr>
						<td>3</td>
						<td>가나아트 컬렉션 상설전 시대유감 時代遺憾 </td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/watingBtn.JPG" /></td>
					</tr>
					<tr>
						<td>4</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/watingBtn.JPG" /></td>
					</tr>
					<tr>
						<td>5</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/watingBtn.JPG" /></td>
					</tr>
					<tr>
						<td>6</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/onDisplayBtn.JPG" /></td>
					</tr>
					<tr>
						<td>7</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/onDisplayBtn.JPG" /></td>
					</tr>
					<tr>
						<td>8</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/endDisplayBtn.JPG" /></td>
					</tr>
					<tr>
						<td>9</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/endDisplayBtn.JPG" /></td>
					</tr>
					<tr>
						<td>10</td>
						<td>국립현대미술관 50주년 기념전</td>
						<td>2020-01-08 12:04</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/endDisplayBtn.JPG" /></td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 페이징바 들어올 자리 -->
		<!-- 페이지 바 여유되면 넣겠습니다........ㅠㅠㅠㅠㅠㅠㅠㅠㅠ-->
		<div class="pagination" align="center">
		<%-- 	${pageBar} --%>
		</div>
		
	</div>

</body>
</html>