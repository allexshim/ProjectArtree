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
	
	#detailContainer {	
		margin: 100px 0 50px 0;
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
	
	input {
		padding: 4px 10px;
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
		width : 160px;
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
		/* box-shadow: 5px 5px 5px grey; */
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
	
	div#myImages div#bigImage .arrow {
		cursor : pointer;
		font-size:60px; 
		font-weight:bold; 
		color : black;
		text-decoration: none;
		padding : 0 20px;
	}
	
	div#myImages div#bigImage a {
		vertical-align: middle;
	}
	
	table#extraInfoTable tr td:first-child {
		width : 170px;
		font-weight: bold;
	}
	
	
	div#openBtn {
		padding-top : 20px;
		padding-bottom : 20px;
		overflow : hidden;
	}
	
	img#openBtn {
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
	
	#posterInput:hover {
		cursor: pointer;
	}
	
	#posterInput {
		text-align: center;
		width : 200px !important;
		border : none !important;
	}
	
	#image-wrap {
		display:inline-block; 
		width:400px; 
		height:400px; 
		border:solid 1px lightgray; 
		border-radius: 15px; 
		overflow:hidden; 
		vertical-align: middle;	
		box-shadow: 5px 5px 5px grey;
	} 
	
	div#bigImage {
		padding-bottom : 30px;
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
	
	#image-wrap > div.item.active > img {
		height : 100%;
		width : 100%;
	}
	
	#image-wrap > div.item.active {
		height : 100%;
		width : 100%;
	}
	
	/* 관련 정보 부분 */
	.extraInfo {
		width : 100%;
	}
	
	/* 태그 등록 부분 */
	div#selectTag {
		display : none;
		width : 80%;
		margin : 0 auto;
		border-collapse: collapse;
		margin-left : 200px;
		border : solid 1px gray;
		border-top : solid 3px black;
		text-align: center;
		border-radius: 5px;
	}
	
	div#selectTag > div {
		display : inline-block;
		/* border : solid 1px black; */
		padding : 0;
		margin-left: 20px;
		border-collapse: collapse;
		width : 20%;
		padding-bottom : 20px;
	}
	
	div#selectTag > div > span {
		font-size : 10pt;
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
		$("#posterInput").on("change", handleImgFileSelect);
		
		// 하단 작품 전경
		$(".image-input").on("change", handleSubImgFileSelect);

		$("#myCarousel").carousel({interval: false});
			
		// Enable Carousel Controls
		$(".left").click(function(){
		    $("#myCarousel").carousel("prev");
		});
		
		$(".right").click(function(){
		    $("#myCarousel").carousel("next");
		});	
	
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
				$("#price").val("0");
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
		
		
		/* 태그 input에 focus했을때 태그 선택 div 보이게 함*/
		$("input#tag").focus(function(){
			$("div#selectTag").css('display','inline-block');
		});
		
		// 각 태그 키워드 클릭
		$("div#selectTag > div > span").click(function(){
			var val = $("input#tag").val();
			
			var str = (val=="")?"":",";
			
			$("input#tag").val(val+str+$(this).text());
			$(this).css({'border':'solid 1px black', 'border-radius':'10px'})
		});

		/* --------- 유효성 검사 ---------------------------------------- */
		$("img#openBtn").click(function(){
			
			if($("#applierName").val().trim()==""){
				alert("신청자 이름을 입력하세요.");
				$(this).focus();
			} 
			else if($("#exhibitionTitle").val().trim()==""){
				alert("전시회 이름을 입력하세요.");
				$(this).focus();
			} 
			else if($("#author").val().trim()==""){
				alert("작가 이름을 입력하세요.");
				$(this).focus();
			}
			else if($("#authorInfo").val().trim()==""){
				alert("작가 정보를 입력하세요.");
				$(this).focus();
			}
			else if($("#gallery").val().trim()==""){
				alert("전시관 정보를 입력하세요.");
				$(this).focus();
			}
			else if($("#startDate").val().trim()==""){
				alert("시작 날짜를 입력하세요.");
				$(this).focus();
			}
			else if($("#endDate").val().trim()==""){
				alert("종료 날짜를 입력하세요.");
				$(this).focus();
			}
			else if($("#openTime").val().trim()==""){
				alert("운영 시간을 입력하세요.");
				$(this).focus();
			}
			else if($("#closeTime").val().trim()==""){
				alert("운영 시간을 입력하세요.");
				$(this).focus();
			}
			else if($("#email").val().trim()==""){
				alert("이메일 주소를 입력하세요.");
				$(this).focus();
			}
			else if($("#tel").val().trim()==""){
				alert("연락처를 입력하세요.");
				$(this).focus();
			}
			else if($("#price").val().trim()==""){
				alert("가격 정보를 입력하세요.");
				$(this).focus();
			}
			else if($("#posterInput").val()==""){
				alert("대표 포스터를 입력하세요.");
				$(this).focus();
			}
			else if($("#imageInput1").val()==""){
				alert("첫번째 이미지를 입력하세요.");
				$(this).focus();
			}
			else if($("#imageInput2").val()==""){
				alert("두번째 이미지를 입력하세요.");
				$(this).focus();
			}
			else if($("#imageInput3").val()==""){
				alert("세번째 이미지를 입력하세요.");
				$(this).focus();
			}
			else if($("#imageInput3").val()==""){
				alert("세번째 이미지를 입력하세요.");
				$(this).focus();
			}
			else if($("#category").val()==""){
				alert("분야를 입력하세요.");
				$(this).focus();
			}
			else if($("#tag").val()==""){
				alert("태그를 입력하세요.");
				$(this).focus();
			}
			else {
				let frm = document.addExhibitionFrm;
				frm.method = "POST";
				frm.action = "*.at";
				frm.submit();
			}
			
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
				let src = $("#image-wrap > div.item.active > img").attr("src");
				
				$("#image-wrap > div.item > img").each(function(){
					if($(this).attr('src') == ""){
						$(this).attr('src',src);
						return false;
					}
				});
				
				$("#image-wrap > div.item.active > img").attr("src", e.target.result);
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
			$("#myImages > div:nth-child(2) > div:nth-child(3) > img").attr("src",img);
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
					<td><input type="text" name="applierName" id="applierName" value="심예은" /></td> <!-- ${session.loginuser.username} -->
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
							<input style="width:100px; text-align:center;" type="text" name="price" id="price" value="" placeholder="가격" />
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
				<input type="file" id="posterInput" name="posterInput" />
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
			<div id="myCarousel" class="carousel slide"  style="display:inline-block; overflow:hidden;">
				<div id="bigImage" align="center" style="display:inline-block; vertical-align: middle;">
					<a class="left" style="display:inline-block;">
						<i class='fa fa-angle-left arrow'></i>
					</a>
					
					<div id="image-wrap" class="carousel-inner" role="listbox" align="center">
					    <div class="item active">
					      <img src="" alt="">
					    </div>
					    <div class="item">
					      <img src="" alt="">
					    </div>
					    <div class="item">
					      <img src="" alt="">
					    </div>
				 	</div>

					<a class="right" style="display:inline-block;">
						<i class='fa fa-angle-right arrow'></i>
					</a>
				</div>
			</div>
		</div>	
			
			<div align="center" style="margin: 0 auto;">
				<input type="file" class="image-input" name="imageInput1" id="imageInput1" />
				<input type="file" class="image-input" name="imageInput2" id="imageInput2" />
				<input type="file" class="image-input" name="imageInput3" id="imageInput3" />
			</div>
		</div>
		
		<div id="extraInfo">
			<table id="extraInfoTable">
				<tr>
					<td>이미지 1 타이틀</td>
					<td><input type="text" class="extraInfo" name="image1title" id="image1title" /></td>
				</tr>
				<tr>
					<td>이미지 1 설명</td>
					<td><input type="text" class="extraInfo" name="image1info" id="image1info" /></td>
				</tr>
				<tr>
					<td>이미지 2 타이틀</td>
					<td><input type="text" class="extraInfo" name="image2title" id="image2title" /></td>
				</tr>
				<tr>
					<td>이미지 2 설명</td>
					<td><input type="text" class="extraInfo" name="image2info" id="image2info" /></td>
				</tr>
				<tr>
					<td>이미지 3 타이틀</td>
					<td><input type="text" class="extraInfo" name="image3title" id="image3title" /></td>
				</tr>
				<tr>
					<td>이미지 3 설명</td>
					<td><input type="text" class="extraInfo" name="image3info" id="image3info" /></td>
				</tr>
				<tr>
					<td>식음료 반입 가능 여부</td>
					<td><input type="text" class="extraInfo" name="foodorDrink" id="foodorDrink" /></td>
				</tr>
				<tr>
					<td>촬영 가능 여부</td>
					<td><input type="text" class="extraInfo" name="photo" id="photo" /></td>
				</tr>
				<tr>
					<td>기타 관람 제한 사항</td>
					<td><input type="text" class="extraInfo" name="extraRestriction" id="extraRestriction" /></td>
				</tr>
				<tr>
					<td>분야</td>
					<td>
						<select id="category" name="category" style="width:100%;">
							<option value=""></option>
							<option value="media">미디어</option>
							<option value="design">디자인</option>
							<option value="drawing">회화</option>
							<option value="picture">사진</option>
							<option value="sculpture">조각</option>
							<option value="installation">설치미술</option>
							<option value="crafts">공예</option>
						</select>
					</td>
				<tr>
				<tr>
					<td>태그</td>
					<td>
						<span><input type="text" id="tag" name="tag" class="tag" style="width:100%" /></span>
					</td>
				<tr>
			</table>
			
			<div id="selectTag">
				<div id="byExpression">
					<h4>#표현별</h4>
				<%-- 	<c:forEach test="{}"> --%>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
				<%-- 	</c:forEach> --%>
				</div>
				<div id="byGenre">
					<h4>#장르별</h4>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
				</div>
				<div id="byAdjective">
					<h4>#형용별</h4>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
				</div>
				<div id="byColor">
					<h4>#색상별</h4>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>거친</span>&nbsp;<span>자연의</span><br/>
					<span>사실적인</span>&nbsp;<span>거친</span>&nbsp;<span>자연의</span><br/>
				</div>
			</div>
			
			<div id="openBtn" align="center">
				<img id="openBtn" src="<%= ctxPath %>/resources/images/board/applyBtn.JPG" />
			</div>
		</div>
	
	</div>
	</form>
</body>
</html>