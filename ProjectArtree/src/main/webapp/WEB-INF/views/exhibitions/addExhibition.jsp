<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
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

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	div#detailContainer {
		
	}
	
	#detailContainer {	
		margin: 100px 0 100px 0;
	}	
		
	#detailContainer .Title_Area {	
		margin: 0 auto;
		width: 100%;
		display: inline-block;
		text-align: center;
	}	
	
	#detailContainer .Title_Area:after {
		content: "";
	  	display: block;
		width : 80%;
		margin : 0 auto;	
		/* padding-top : 100px; */
		border-bottom : solid 2px lightgray;
	}
		
	#detailContainer .Title_Area .st {	
		display: block;
		font-size: 15pt;
		
	}	
		
	#detailContainer .Title_Area .lt {	
		display: block;
		font-size: 35pt;
		font-weight: bold;
	}	
	
	#detailContainer .Title_Area .titleDetail {
		display: block;
		font-size: 11pt;
		padding-top : 15px;
	}
	
	#detailContainer .Title_Area h3 {
		text-align: left;
		padding-left: 10%;
		padding-top: 80px;
	}
	 
	div#detailContents, div#extraInfo {
		width: 80%;
		margin: 0 auto;
		padding-top : 20px;
		padding-bottom: 20px;
		overflow: hidden; /* div밖으로 이미지가 넘칠 때 해결 방법! 기억해둘것! */
	}
	
	table#detailTable, table#extraInfoTable {
		width : 95%;
		margin : 0 auto;
	}
	
	table#detailTable tr td, table#extraInfoTable tr td{
		padding-top : 4px;
		padding-bottom :4px;
		font-size : 12pt;
	}
	
	table#detailTable tr td:first-child {
		width : 100px;
		font-weight: bold;
	}
	
	/*가격 버튼*/
	div#priceArea {
		vertical-align: bottom;
		border-bottom : solid 1px gray;
	}
	
	div#priceArea input {
		border : 0 !important;
	}
	
	div#myPoster:before {
		content: "";
	  	display: block;
		width : 80%;		
		border-bottom : solid 2px lightgray;
	}
	
	div#myPoster img, div#bigImage img {
		border-radius: 15px;
		box-shadow: 5px 5px 5px grey;
	}
	
	div#myPoster, div#myImages {
		overflow : hidden;
		font-weight: bold;
	}
	
	div#myImages {
		padding-top : 10px;
	}
	
	div#myImages h2 {
		margin : 0;
		padding-top: 10px;
		padding-bottom: 20px;
	}
	
	div#myPoster:after {
		content: "";
	  	display: block;
		width : 80%;		
		padding-top : 30px;
		border-bottom : solid 2px lightgray;
	}
	
	div#myImages .thumbNail {
		border-radius: 10px;
		width:200px;
		height:200px; 
	}
	
	div.thumbNail-wrap {
		display : inline-block;
		border: solid 1px lightgray;
		border-radius: 10px;
		height: 200px;
		width: 200px;
		overflow: hidden;
	}
	
	
	div#myImages div#bigImage {
		padding-top : 20px;
	}
	
	div#myImages div#bigImage .bigImage {
		margin-left : 50px;
		margin-right : 50px;
	}
	
	div#myImages div#bigImage .arrow {
		cursor : pointer;
	}
	
	table#extraInfoTable tr td:first-child {
		width : 80px;
		font-weight: bold;
	}
	
	
	div#openBtn {
		padding-top : 20px;
		padding-bottom : 20px;
		overflow : hidden;
		cursor : pointer;
	}
	
	.fa-envelope {
		font-size : 20pt;
		text-decoration: none;
		color : black;
	}
	
	div#emailArtree span {
		vertical-align: top;
	}
	
	.Title_Area .titleContact {
		color : gray;
	}
	
	div#detailContainer input, div#detailContainer textarea {
		width : 100%;
		border : 1px solid lightgray;
		border-radius: 5px;
	}
	
	/* date picker */
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
	
	/* 포스터 이미지 등록 부분 */
	#poster-wrap {
		margin: 30px auto;
		border: solid 1px black;
		border-radius: 10px;
		height: 500px;
		width: 400px;
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
		width : 200px !important;
		border : none !important;
	}
	
	.image-input:hover {
		cursor: pointer;
	}
	
	.image-input {
		text-align: center;
		width : 200px !important;
		border : none !important;
		padding-top:3px;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function(){ 

		// datePicker
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
	//	$(".ui-datepicker").css('background','#ffe680');
		$(".ui-datepicker").css('border','none');
		$(".ui-state-active").css('background','#ccb3ff');
		
		// 상단 대표 포스터
		$("#poster-input").on("change", handleImgFileSelect);
		
		// 하단 작품 전경
		$(".image-input").on("change", handleSubImgFileSelect);

		// 가격 정보 입력 버튼 --------------------------------------------
		$(".freeBtn").on("click", function(){
			
			// 반대 버튼이 눌려있다면
			if($(".priceBtn").hasClass("clicked") ){
				$(".priceBtn").attr("src", "<%= ctxPath %>/resources/images/board/button_price.PNG");
				$("#priceArea").hide();
				$(".priceBtn").removeClass("clicked");
			} 
			if($(this).hasClass("clicked")){
				$(this).removeClass("clicked");
				$(this).attr("src", "<%= ctxPath %>/resources/images/board/button_free.PNG");
			}	
			else {
				$(this).addClass("clicked");
				$(this).attr("src", "<%= ctxPath %>/resources/images/board/button_free_afterClick.PNG");
			}
		});
		
		$(".priceBtn").on("click", function(){
			if($(".freeBtn").hasClass("clicked") ){
				$(".freeBtn").attr("src", "<%= ctxPath %>/resources/images/board/button_free.PNG");
				$(".freeBtn").removeClass("clicked");
			} 
			if($(this).hasClass("clicked")){
				$(this).removeClass("clicked");
				$(this).attr("src", "<%= ctxPath %>/resources/images/board/button_price.PNG");
				$("#priceArea").hide();
			}	
			else {
				$(this).addClass("clicked");
				$(this).attr("src", "<%= ctxPath %>/resources/images/board/button_price_afterClick.PNG");
				$("#priceArea").show().css('display','inline-block');
			}
		});
		// 가격 정보 입력 버튼 끝 --------------------------------------------
		
		
		/* --------- 유효성 검사 ---------------------------------------- */
		$("#openBtn").click(function(){
			var frm = document.addExhibitionFrm;
			
			/* frm.inputName.value */
			/* frm.exhibitionTitle
			frm.author
			frm.authorInfo
			frm.exhibitionInfo
			frm.gallery
			frm.startDate
			frm.endDate
			frm.email
			frm.tel
			frm.price
			frm.poster-input
			frm.image-input1
			frm.image-input2
			frm.image-input3 */
			
			frm.method = "POST";
			frm.action = "*.at";
			frm.submit();
		});
		/* --------- 유효성 검사 끝--------------------------------------- */
		
	}); // --------------------------------------------------------------
	
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
	} // end of function handleImgFileSelect
	

	function handleSubImgFileSelect(e) {
	
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
				$("div#bigImage img#bigImage").attr("src", e.target.result);
				handleThumbNailImages(e.target.result);	
			}
			reader.readAsDataURL(f);
		});
	} // end of function handleSubImgFileSelect

	function handleThumbNailImages(img){

		let bool = false;
		$(".thumbNail").each(function(){
			if($(this).attr("src") == ""){
				$(this).attr("src", img);
				bool = true;
				return false;
			}
		});
		if(!bool){
			// 모든 칸이 차 있다면 가장 마지막 썸네일 자리에 새 이미지를 교체해서 넣는다.
			$("#myImages > img:nth-child(4)").attr("src",img);
		}
		
	} // end of handleThumbNailImages

</script>

</head>
<body>
	<form name="addExhibitionFrm">
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Exhibition</span>
			<span class="lt">Registeration</span>
			<span class="titleDetail">Artree는 작가 여러분이 개최하시는 전시회를 <br/> 홈페이지, 공식 SNS에 홍보합니다.</span>
			<span class="titleContact"><br/>*자료가 많은 경우 아래 메일로 보내주세요.<br/><br/></span>
			
			<div id="emailArtree">
				<i class="far fa-envelope"></i>
				<span style="font-size:13pt;">&nbsp;artree0213@gmail.com</span>
			</div>
			<h3>전시회 등록하기</h3>
		</div>
		<div id="detailContents">
			
			<table id="detailTable">
				<tr>
					<td>신청자 이름</td>
					<td>심예은</td> <!-- ${session.loginuser.username} -->
				<tr>
				<tr>
					<td>전시회명</td>
					<td><input type="text" name="exhibitionTitle" id="exhibitionTitle" /></td>
				<tr>
				<tr>
					<td>작가명</td>
					<td><input type="text" name="author" id="author" /></td>
				<tr>
				<tr>
					<td style="vertical-align: top;">작가정보</td>
					<td>
						<textarea id="authorInfo" name="authorInfo" style="resize:none; border:solid 1px lightgray" rows="5" >
						</textarea>
					</td>
				<tr>
				<tr>
					<td style="vertical-align: top;">전시정보</td>
					<td>
						<textarea id="exhibitionInfo" name="exhibitionInfo" style="resize:none; border:solid 1px lightgray" rows="5" >
						</textarea>
					</td>
				<tr>
				<tr>
					<td>전시관</td>
					<td><input type="text" name="gallery" id="gallery" /></td>
				<tr>
				<tr>
					<td>일정</td>
					<td><input style="width:100px;" class="pickDate" type="text" name="startDate" id="startDate" />
						- 
						<input style="width:100px;" class="pickDate" type="text" name="endDate" id="endDate" />
					</td>
				<tr>
				<tr>
					<td>운영시간</td>
					<td><input style="width:100px;" type="text" name="openTime" id="openTime" />
						- 
						<input style="width:100px;" type="text" name="closeTime" id="closeTime" />
					</td>
				<tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" /></td>
				<tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="tel" id="tel" /></td>
				<tr>
				<tr>
					<td>입장료</td>
					<td>
						<img class="freeBtn" src="<%= ctxPath %>/resources/images/board/button_free.PNG" alt=""/>
						<img class="priceBtn" src="<%= ctxPath %>/resources/images/board/button_price.PNG" alt=""/>
						
						<div id="priceArea" style="display:none;">
							<input style="width:100px;" type="text" name="price" id="price" value="" placeholder="가격" />
						</div>
					</td>
				<tr>
			</table>
		</div>
		
		<div id="myPoster" align="center">
			<h2 style="font-weight:bold">포스터</h2>
			<div id="poster-wrap">
				<img id="poster" style="border: none;"/>
			</div>
			
			<div align="center" style="margin: 0 auto;">
				<input type="file" id="poster-input" name="poster-input" />
			</div>
		</div>
		
		<div id="myImages" align="center">
			<h2 style="font-weight:bold">작품전경</h2> 
			
			<!--  썸네일 아직 안배워서 일단 이렇게 처리 -->
			<div style="width:700px; height:200px; overflow:hidden;">
				<div class="thumbNail-wrap"><img class="thumbNail" src="" alt="" style="border:none;"/></div>
				<div class="thumbNail-wrap"><img class="thumbNail" src="" alt="" style="border:none;"/></div>
				<div class="thumbNail-wrap"><img class="thumbNail" src="" alt="" style="border:none;"/></div>
			</div>
			<div id="bigImage" align="center">
				<i class='fa fa-angle-left arrow' style='font-size:60px; font-weight:bold;'></i>
				
				<div id="image-wrap" style="display:inline-block; width:500px; height:450px;" align="center">
					<img id="bigImage"  width="400px" height="400px" style="border: none;"/>
				</div>
				
				<i class='fa fa-angle-right arrow' style='font-size:60px; font-weight:bold;'></i>
			</div>	
			
			<div align="center" style="margin: 0 auto;">
				<input type="file" class="image-input" name="image-input1" />
				<input type="file" class="image-input" name="image-input2" />
				<input type="file" class="image-input" name="image-input3" />
			</div>
		</div>
		
		<div id="extraInfo">
			<table id="extraInfoTable">
				<tr>
					<td>분야</td>
					<td><input type="text" name="category" id="category" /></td>
				<tr>
				<tr>
					<td>태그</td>
					<td>
						<span><input type="text" name="tag" class="tag" /></span>
					</td>
				<tr>
			</table>
			<div id="openBtn" align="center">
				<img id="openBtn" src="<%= ctxPath %>/resources/images/board/applyBtn.JPG" />
			</div>
		</div>
	
	</div>
	</form>
</body>
</html>