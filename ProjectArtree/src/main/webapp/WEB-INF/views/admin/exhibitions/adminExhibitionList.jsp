<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	div#registerFormContainer {
		padding-bottom : 100px;
		width: 80%;
		margin: 0 auto;
	}
	
	table#registerFormContents > tbody > tr:hover {
		box-shadow: 2px 2px 2px 2px grey;
		border-radius: 5px;
		cursor: pointer;
	}
	
	img#boardtop {
		position : absolute;
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		padding-top : 610px;
		width : 500px;
		padding-left : 60px;
	}
	
	div#topText span {
		font-size : 13pt;
		text-align : left;
		margin-left : 8px;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}

	/* == 전시 상태별 선택 부분 == */
	div#eachStatus {
		padding-top : 40px;
		padding-left : 60px;
		font-size: 16pt;
	}

	div#eachStatus .displayStatus {
		padding-right : 20px;
		color : gray;
		text-align: center;
		cursor: pointer;
	}
	
	div#eachStatus .currentStatus {
		color : black !important;
		font-weight: bold !important;
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

	div#contentContainer table tbody td:nth-child(2) {
		cursor : pointer;
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
	
	#newDisplay, #onDisplay {
		margin-right: 20px;
	}
	
	#afterDisplay {
		border-right: solid 2px lightgrey;
		margin-right: 50px;
	}

</style>

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

<script type="text/javascript">
	
	$(document).ready(function() {
		
		// 각 글제목을 클릭하면 상세 페이지로 이동
		$("#contentContainer table tbody tr").click(function(){
			
		//	alert("선택");
			
			let no = $(this).find(".exhibitionno").text();
			
			
		//	console.log(no);

			window.location.href="/artree/exhibitionDetail.at?no=" + no;
			
		}); // end of $("#contentContainer table tbody tr").click
		
	});
	
</script>

</head>
<body>

	<div id="imgcontainer">	
 		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage4.jpg" />
	</div>

	<div id="registerFormContainer">

		<div id="topText">
			<span>ADMIN ONLY</span>
			<h1 style="margin:0; font-weight: bold;">Exhibition List</h1>
		</div>
		
		<div id="eachStatus">
			<a class="displayStatus currentStatus" id="onDisplay" href="<%= ctxPath %>/exhibitionList.at">전시중</a>
			<a class="displayStatus" id="newDisplay" href="<%= ctxPath %>/newDisplayList.at">새로운 전시</a>
			<a class="displayStatus" id="afterDisplay" style="padding-right: 50px;" href="<%= ctxPath %>/afterDisplayList.at">전시종료</a>
			<a class="displayStatus" id="appliedList" id="appliedDisplay" href="<%= ctxPath %>/appliedDisplayList.at">검토 대기중</a>
		</div>

		<div id="contentContainer">
			<table id="registerFormContents">
				<thead>
					<tr>
						<td>No.</td>
						<td>Title</td>
						<td>Author</td>
						<td>Status</td>
					</tr>	
				</thead>
				
				<tbody>
					<c:if test="${ not empty exhibitionList  }">
					<c:forEach var="exhibit" items="${ exhibitionList }">
					<tr>
						<td class="exhibitionno">${ exhibit.exhibitionno }
							<input type="hidden" name="no" value="${ exhibit.exhibitionno }" />
						</td>
						<td>${ exhibit.exhibitionname }</td>
						<td>${ exhibit.author }</td>
						<td><img src="<%= ctxPath %>/resources/images/exhibition/onDisplayBtn.JPG" /></td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${ empty exhibitionList  }">
						<tr>
							<td colspan="4">결과가 존재하지 않습니다.</td>
						</tr>
					</c:if>
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