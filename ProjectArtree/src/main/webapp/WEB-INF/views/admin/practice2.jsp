<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	#container-members {
		width: 60%;
		margin: 30vh auto;
	}
	
	.active:hover {
		background-color: #ffe680;
		color: black;
		border-radius: 40px;
	}
	
	a#members-link {
		background-color: white;
		color: black;
	}
	
	a#members-link:hover {
		background-color: #ffe680;
		color: black;
		border-radius: 40px;
	}
	
	a#members-link:active {
		background-color: #ccb3ff;
		color: white;
		border-radius: 40px;
	}
	
</style>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>

	<div id="container-members">
		<div class="container">
		
			<h4 style="text-align: center">회원관리</h4>
			<hr style="border: 1px solid grey">
			<ul class="nav nav-pills" style="text-align: center">
				<li class="active" style="align-items: center;"><a data-toggle="pill" href="#memberLink" id="members-link" style="text-align: center">회원목록</a></li>
			</ul>
			
			<div class="tab-content">
				<div id="memberLink">
					<table class="table">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>아이디</th>
								<th>회원번호</th>
								<th>회원번호</th>
								<th>회원번호</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td><span>464546</span></td>
								<td><span>leedh</span></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
	
</body>
</html>