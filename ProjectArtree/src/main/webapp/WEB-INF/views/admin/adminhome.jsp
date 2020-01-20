<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

body, html {
	font-family: 'Noto Sans Kr', sans-serif !important;
}

#container-admin {
	margin: 20vh auto;
	width: 90%;
}

.categories {
	width: 80%;
	margin: 0 auto;
	padding : 0;
	height: 40vh;
}

.card-front {
	font-weight: bold;
	font-size: 1.5em;
	padding: 10px;
	position: relative;
	top: 100px;
}

.card-back {
	position: relative;
	top: 45%;
	padding: 10px;
	font-weight: bold;
	font-size: 1em;
}

/*

////////////////////////////////// flip card CSS //////////////////////////////////

*/
#members, #exhibitions, #statistics {
	cursor: pointer;
}

.flip-card {
  background-color: transparent;
  width: 100%;
  height: 40vh;
  border: none;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
  box-shadow: 10px 10px 5px grey;
  border-radius: 10px;
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  border-radius: 10px;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #ffe680;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: #ccb3ff;
  color: white;
  transform: rotateY(180deg);
}

</style>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#members").click(function(){
			
			window.location.href="/artree/memberList.at";
			
		});
		
		$("#exhibitions").click(function(){
				
			window.location.href="/artree/registerformList.at";
			
		});
			
		$("#statistics").click(function(){
			
			window.location.href="/artree/bySales.at"
			
		});
		
	});
	
</script>

</head>
<body>

	<div id="container-admin">
	
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div id="members" class="categories">
					
						<div class="flip-card">
							<div class="flip-card-inner">
								<div class="flip-card-front">
									<div class="card-front">
										<img src="<%= ctxPath %>/resources/images/admin/members.png" style="width: 100px; height: 100px;">
										<br/>
										<span>회원관리</span>
									</div>
								</div>
								<div class="flip-card-back">
									<div class="card-back">
										<span>회원목록을 볼 수 있습니다.</span>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="col-sm-4">
					<div id="exhibitions" class="categories">
						
						<div class="flip-card">
							<div class="flip-card-inner">
								<div class="flip-card-front">
									<div class="card-front">
										<img src="<%= ctxPath %>/resources/images/admin/exhibition.png" style="width: 100px; height: 100px;">
										<br/>
										<span>전시회관리</span>
									</div>
								</div>
								<div class="flip-card-back">
									<div class="card-back">
										<span>전시회의 통합적인 관리가 가능합니다.</span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				
				<div class="col-sm-4">
					<div id="statistics" class="categories">
						
						<div class="flip-card">
							<div class="flip-card-inner">
								<div class="flip-card-front">
									<div class="card-front">
										<img src="<%= ctxPath %>/resources/images/admin/chart.png" style="width: 100px; height: 100px;">
										<br/>
										<span>통계</span>
									</div>
								</div>
								<div class="flip-card-back">
									<div class="card-back">
										<span>회원, 매출, 전시회 별 각종 통계를 볼 수 있습니다.</span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	
	</div>

</body>
</html>