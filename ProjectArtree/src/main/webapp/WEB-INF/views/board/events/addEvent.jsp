<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	#addEvent {   
		margin: 100px 0 100px 0;
	}   
      
	#addEvent .Title_Area {   
		margin: 0 auto;
		width: 100%;
		display: inline-block;
		text-align: center;
		height: 20vh;
	}   
      
	#addEvent .Title_Area .st {   
		display: block;
		font-size: 15pt;
      
	}   
      
	#addEvent .Title_Area .lt {   
		display: block;
		font-size: 35pt;
		font-weight: bold;
	}
	
	.labels {
		width: 150px;
	}
	
</style>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script type="text/javascript">
	
	$("#datepicker1").datepicker();
	$("#datepicker2").datepicker();
	
</script>

</head>
<body>

	<div id="addEvent">
		<div class="container">
			<div class="row">
				<div class="Title_Area">
					<span class="st">ADMIN ONLY</span>
					<span class="lt">NEW EVENT</span>
				</div>
				
				<div class="content-area">
					<h4>이벤트 등록하기</h4>
					<hr style="border: 1px solid grey">
					
					<div class="form-area">
						
						<form action="addEventFrm">
							
							<div>
								<label class="labels">이벤트명</label>
								<input type="text" placeholder="이벤트명을 입력해주세요" />
							</div>
							
							<div>
								<label class="labels">이벤트기간</label>
								<input type="text" id="datepicker1" /><span>&nbsp;-&nbsp;</span>
								<input type="text" id="datepicker2" />
							</div>
							
							<div>
								<label class="labels">이벤트내용</label>
								<input type="text" placeholder="이벤트내용을 입력해주세요" />
							</div>
							
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>