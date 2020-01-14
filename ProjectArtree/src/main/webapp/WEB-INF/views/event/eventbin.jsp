<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENTS Artree</title>
</head>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	.bodybin{
		font-family: 'Noto Sans Kr', sans-serif;
		font-size: 250%;
	}
	
	.contentBin {
		float: left;
		width: 280px;
		height: 380px;
	}
	
</style>

<body class="bodybin">
	<div style="line-height:1; text-align:center; margin: 86px 0px 86px 0px;">
		<div style="font-size: 15px;">Artree</div>
		<div style="font-size: 47px; font-weight: bold;">EVENTS</div>
	</div>
	
	<div style="padding: 0px 75px;">	
		${content}
	</div>
	<div style="margin: 10px 0px;"></div>
	
</body>
</html>