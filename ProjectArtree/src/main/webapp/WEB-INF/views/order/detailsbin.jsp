<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DetailBin</title>
</head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	body{
		font-family: 'Noto Sans Kr', sans-serif;
		font-size: 250%;
	}
	
	.menubin {
		border-right: solid 1px black;
		width: 100%;
		padding: 1%;
	}
	
</style>
<body>
	<div style="width: 60%; margin: 0 auto;" align="center">
		<div style="padding-top: 5%;">
			<ul style="border-radius:4px; border-top: solid 1px black; list-style-type: none; display: inline-flex; padding: 0;
			border-bottom: solid 1px black; border-left: solid 1px black; width: 100%;">
				<li class="menubin" style="background-color: black; color: white;">1.Ticket</li>
				<li class="menubin" style="background-color: black; color: white;">2.Date</li>
				<li class="menubin" style="background-color: black; color: white;">3.Detail</li>
				<li class="menubin">4.Payment</li>			
			</ul>		
		</div>
		<div style="padding: 5% 0%;">
			<div>정보를 입력해주세요.</div>
		</div>
		
		<div>		
			<div>이름</div>
			<div><input type="text"></div>
			<div>이메일주소</div>
			<div><input type="text"></div>
			<div>이메일주소 확인</div>
			<div><input type="text"></div>			
		</div>
		
		<div style="overflow: hidden;">	
			<div onclick="location.href='<%= ctxPath %>/datebin.at'" style="color:white; background:black; cursor:pointer; float: left; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">이전</div>
			<div onclick="location.href='<%= ctxPath %>/paymentbin.at'" style="color:white; background:black; cursor:pointer; float: right; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">다음</div>
		</div>
		
	</div>
</body>
</html>
