<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%= ctxPath %>/resources/jquery-ui-1.11.4.custom/datepicker-ko.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
		width: 90px;
	}
	
	.labels-inputs {
		height: 50px;
	}
	
	.inputs {
		padding: 4px;
		border-radius: 5px;
		width: 91%;
	}
	
	#exhibitionCode {
		width: 100px;
	}
	
	#startDate, #endDate {
		width: 100px;
	}
	
	.ui-widget-header {
		background : #ccb3ff !important;
	}
	
	.ui-state-active, .ui-state-active {
		background : #ccb3ff !important;
		border: none !important;
	}
	
	.ui-datepicker {
		box-shadow: 5px 5px 5px grey;
	}
	
	#poster-area {
		width: 40%;
		height: 50vh;
/* 		border: solid 2px black; */
		margin: 50px auto; 
	}
	
	#poster-wrap {
		margin: 30px auto;
		border: solid 2px black;
		border-radius: 10px;
		height: 80%;
		width: 60%;
		box-shadow: 5px 5px 5px grey;
	}
	
	#poster {
		width: 100%;
		height: 100%;
/* 		border: solid 2px red; */
/* 		display: none; */
		border-radius: 10px;
	}
	
	#poster-explain {
		font-weight: bold;
		font-size: 1.2em;
		position: relative;
		top: 45%;
	}
	
	#poster-input:hover {
		cursor: pointer;
	}
	
	#poster-input {
		text-align: center;
	}
	
	#addEventBtn {
		margin: 8vh 0;
		display: inline-block;
		width: 200px;
		height: 50px;
		background: black;
		color: white;
		font-weight: bold;
		font-size: 1.2em;
		border: none;
	}
	
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
		
	//	alert("확인용");
		
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
	//	$(".ui-datepicker").css('background','#ffe680');
		$(".ui-datepicker").css('border','none');
		$(".ui-state-active").css('background','#ccb3ff');
		
		$("#poster-input").on("change", handleImgFileSelect);
		
		$("#addEventBtn").click(function(){
			
			let exhibitionCode = $("#exhibitionCode").val().trim();
			let startDate = $("#startDate").val().trim();
			let endDate = $("#endDate").val().trim();
			let eventTitle = $("#eventTitle").val().trim();
			let eventContent = $("#eventContent").val().trim();
			let poster = $("#poster").val().trim();	
			
			if(exhibitionCode == null	|| exhibitionCode == ""
				|| startDate  == null 	|| startDate == ""
				|| endDate == null 		|| endDate == ""
				|| eventTitle == null 	|| eventTitle == ""
				|| eventContent == null || eventContent == "") {
				
				alert("빈칸을 채워주세요");
				return;
			}
			
			var frm = document.addEventFrm;
			frm.method="POST";
			frm.action="<%= ctxPath %>/addEvent.at";
			frm.submit();
			
		});
		
	});
	
	function handleImgFileSelect(e) {
		
		let files = e.target.files;
		let filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			let reader = new FileReader();
			reader.onload = function(e) {
				$("#poster").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
			
		});
		
	}
	
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
					<h3 style="font-weight: bold;">이벤트 등록하기</h3>
					<hr style="border: 1px solid grey">
					
					<div class="form-area">
						
						<form name="addEventFrm">
							
							<div class="labels-inputs">
								<label class="labels" for="exhibitionCode">전시회코드</label>
								<input type="text" class="inputs" id="exhibitionCode" name="exhibitionCode" />
							</div>
							
							<div class="labels-inputs">
								<label class="labels">이벤트기간</label>
								<input type="text" class="inputs" id="startDate" name="startDate" placeholder="시작일" /><span>&emsp;-&emsp;</span>
								<input type="text" class="inputs" id="endDate" name="endDate" placeholder="종료일" />
							</div>
							
							<div class="labels-inputs">
								<label class="labels" for="eventTitle">이벤트명</label>
								<input type="text" class="inputs" placeholder="이벤트명을 입력해주세요" id="eventTitle" name="eventTitle" />
							</div>
							
							<div class="labels-inputs">
								<label class="labels" for="eventContent">이벤트내용</label>
								<input type="text" class="inputs" placeholder="이벤트내용을 입력해주세요" id="eventContent" name="eventContent" />
							</div>
						
							<div id="poster-area" align="center">
							
								<h3 style="font-weight: bold;">포스터</h3>
								
								<div id="poster-wrap">
									
<%-- 										<c:if test="${ eventImg == null }"> --%>
<!-- 											<span id="poster-explain">클릭해서 포스터를 등록해주세요.<br/>전시회 대표 포스터와 동일합니다.</span> -->
<%-- 										</c:if> --%>
<!-- 									</input> -->
									<img id="poster" style="border: none;"/>
									<c:if test="${ eventImg != null }">
											<input type="text" />
									</c:if>
								</div>
								
								<div align="center" style="margin: 0 auto;">
									<input type="file" id="poster-input" />
								</div>
								<input type="hidden" />
								<button type="button" id="addEventBtn">REGISTER</button>
							</div>
							
						</form>
					</div>
						
				</div>
			</div>
		</div>
	</div>

</body>
</html>