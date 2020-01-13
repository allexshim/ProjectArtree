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
		width : 200px;
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
		cursor : pointer;
	}

	div#eachStatus .displayStatus {
		padding-right : 20px;
		color : gray;
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
		
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
	
		var status = "${status}";
		// 검색 조회 버튼을 눌러서 새로고침 된 경우 클릭한 버튼을 검정색, bold로 보이게 함
		if(status != null && status != ""){
			$(".displayStatus").each(function(){
				if(status == $(this).text()){
					$(".displayStatus").removeClass("currentStatus");
					$(this).addClass("currentStatus");
				}
			});			
		} // end of if ------------------------------------------
		
		// 전시 상태별 조회 버튼 클릭
		$(".displayStatus").click(function(){
			
			var status = $(this).text(); // 전체, 검토 대기중, 전시중, 전시 종료
			
			window.location.href="/artree/*.at?status="+status;
			
		}); // end of $(".displayStatus").click -------------
		
		
		// 각 글제목을 클릭하면 상세 페이지로 이동
		$("div#contentContainer table tbody td:nth-child(2)").click(function(){
			var no = $(this).prev().text(); // 클릭한 글번호를 받아온다.

			window.location.href="/artree/registerformDetail.at?no="+no;
			
		}); // end of $("div#contentContainer table tbody td:nth-child(2)").click
		
	});

</script>
</head>
<body>
	<div id="registerFormContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage4.jpg" />
		</div>

		<div id="topText">
			<span>ADMIN ONLY</span>
			<h1 style="margin:0;">Statistics</h1>
		</div>
		
		<div id="eachStatus">
			<span class="displayStatus">매출</span>
			<span class="displayStatus currentStatus">예매율</span>
			<span class="displayStatus">성별 통계</span>
			<span class="displayStatus">선호 장르</span>
			<span class="displayStatus">선호 태그</span>
		</div>

		<div id="contentContainer">
			
			
			
		</div>

	</div>

</body>
</html>