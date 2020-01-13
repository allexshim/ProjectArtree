<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABOUT Artree</title>
</head>

<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	body{
		font-family: 'Noto Sans Kr', sans-serif;
		font-size: 250%;
	}
	
	.headerBin {
		text-align: center;
		color: white;
		width: 100%;
		height: 180px;
		font-size: 38px;
		line-height: 4.5;
	}
</style>

<body>
	<div class="headerBin" style="background-image:url('<%= ctxPath %>/resources/images/main/mainImg.jpg')">
		<div>Artree</div>
	</div>
</body>
</html>