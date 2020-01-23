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

<%-- spinner 사용을 위한 라이브러리 --%>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/jquery-ui-1.11.4.custom/jquery-ui.css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
  

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	#galleryModal {
		height: 70vh;
		overflow: scroll;
		margin: 10vh auto;
		
	}
	
	table#galleryListTable > tbody > tr:hover {
		background-color: #f1f1f1;
		cursor: pointer;
	}
	
	table#galleryListTable > tbody > tr td:first-child {
		font-weight: normal !important;
	}
	
	table#galleryListTable > td:first-child {
		width: 60px !important;
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
	
	input, select {
		padding: 4px 10px;
		border-radius: 5px;
	}
	
	table#detailTable, table#extraInfoTable {
		width : 95%;
		margin : 0 auto;
	}
	
	table#detailTable tr td, table#extraInfoTable tr td {
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
		margin: 0 10px;
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
	
	/* spinner color */
	
	.ui-widget-content {
		background : white !important; 
	}
	
	.ui-spinner-button {
		background : #fce373 !important;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function() { 

		// datePicker
	//	$("#startDate").datepicker();
	//	$("#endDate").datepicker();
		$("#startDate").datepicker({
			dateFormat: "yy.mm.dd"
		});
		
		$("#endDate").datepicker({
			dateFormat: "yy.mm.dd"
		});
		
		$("#authorInfo").text("");
		$("#exhibitionInfo").text("");
		
	//	$(".ui-datepicker").css('background','#ffe680');
		$(".ui-datepicker").css('border','none');
		$(".ui-state-active").css('background','#ccb3ff');
		
		if( ${ paraMap != null } ) {
			$("#galleryLocation").val("${ paraMap.galleryLocation }");
			$("#searchWord").val("${ paraMap.searchWord }");
		}
		
		$("#gallery").click(function(){
			
			$("#myModal").modal('show');
			
			$("searchWord").focus();
			
		});
		
		$("#searchWord").keydown(function(){
			
			if(event.keyCode==13) {
				event.preventDefault();
				searchGallery();
			}
			
		});
		
		let gallerylocation = sessionStorage.getItem("gallerylocation");
		let galleryname = sessionStorage.getItem("galleryname");
		
		// 문서가 로딩된 후 sessionStorage 에 남아있는 저장된 데이터 삭제
		if( gallerylocation != null && galleryname != null && galleryno != null) {
			sessionStorage.removeItem("gallerylocation");
			sessionStorage.removeItem("galleryname");
			sessionStorage.removeItem("galleryno");
		}		
		
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
		
		// ------------------ 작품전경, 썸네일, 파일첨부, 타이틀과 설명 인풋 spinner ------------------ //
		
		$("#spinnerOqty").spinner({
			spin: function( event, ui ) {
				if( ui.value > 3 ) {
					$( this ).spinner( "value", 0 ); 
					return false;
				} 
				else if ( ui.value < 0 ) {
					$( this ).spinner( "value", 3 );
					return false;
				}
			}
		});
		
		$("#spinnerOqty").bind("spinstop", function(){
			
			let thumbnail = "";
			let carousel = "";
			let file = "";
			let table = "";
			
			let spinnerOqtyVal = $("#spinnerOqty").val();
			
			if(spinnerOqtyVal == "0") {
				
				$("#imgInfoTable").empty();
				$("#thumbNail-container").empty();
				$("#image-wrap").empty();
				$("#imageInput-container").empty();
				
			} else {
				
				for(let i=0; i<parseInt(spinnerOqtyVal); i++) {
					thumbnail += "<div class='thumbNail-wrap' style='margin: 0 10px;'>";
					thumbnail += "<img class='thumbNail' src='' alt='' style='border:none;' /></div>";
					
					file += "<input type='file' class='image-input' name='imageInput' id='imageInput" + (i + 1) + "' />";
					table += "<tr><td style='width : 170px; font-weight: bold; padding-top : 4px; padding-bottom :4px; font-size : 12pt;'>이미지 " + (i + 1) + " 설명</td>";
					table += "<td style='padding-top : 4px; padding-bottom :4px; font-size : 12pt;'>";
					table += "<input type='text' class='extraInfo' name='imageinfo' id='image" + (i + 1) + "info' /></td></tr>";
					
					if(i == 0) {
						carousel += "<div class='item active'><img src='' alt=''></div>";
					} else {
						carousel += "<div class='item'><img src='' alt=''></div>";
					}
					
				}
				
				$("#imgInfoTable").empty();
				$("#thumbNail-container").empty();
				$("#image-wrap").empty();
				$("#imageInput-container").empty();
				
				$("#imgInfoTable").append(table);
				$("#thumbNail-container").append(thumbnail);
				$("#image-wrap").append(carousel);
				$("#imageInput-container").append(file);
				
			}
			
		});
		
		// ------------------------------------ spinner 끝 ---------------------------------- //
		
		// 상단 대표 포스터
		$("#posterInput").on("change", handleImgFileSelect);
		
		// 하단 작품 전경
	//	$(".image-input").on("change", handleSubImgFileSelect);
		$(document).on("change", ".image-input", function(e){
			handleSubImgFileSelect(e);
		});
		

		$("#myCarousel").carousel({interval: false});
			
		// Enable Carousel Controls
		$(".left").click(function(){
		    $("#myCarousel").carousel("prev");
		});
		
		$(".right").click(function(){
		    $("#myCarousel").carousel("next");
		});	
	
		
		/* 태그 input에 focus했을때 태그 선택 div 보이게 함*/
		$("input#tag").focus(function(){
			$("div#selectTag").css('display','inline-block');
		});
		
		// 각 태그 키워드 클릭
		$("div#selectTag > div > span").click(function(){
			let val = $("input#tag").val();
			
			let str = (val=="")?"":",";
			
			$("input#tag").val(val+str+$(this).text());
			$(this).css({'border':'solid 1px black', 'border-radius':'10px'})
		});

		/* --------- 유효성 검사 ---------------------------------------- */
		$("img#openBtn").click(function(){
			
			if($("#applier").val().trim()==""){
				alert("신청자 이름을 입력하세요.");
				$(this).focus();
			} 
			else if($("#exhibitionName").val().trim()==""){
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
			else if($("#genre").val()==""){
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
				frm.action = "/artree/addEndExhibition.at";
				frm.submit();
			}
			
		});
		/* --------- 유효성 검사 끝--------------------------------------- */
				
	}); // $(document).ready --------------------------------------------------------------
	
	
	function searchGallery() {
		
		let wordLength = $("#searchWord").val().length;
		
		$.ajax({
			
			url: "<%= ctxPath %>/wordSearchShow.at",
			type: "GET",
			data: { "galleryLocation":$("#galleryLocation").val()
				   ,"searchWord":$("#searchWord").val() },
			dataType: "JSON",
			success: function(json){
				
			//	console.log(json);
			
				$("#galleryListTable").empty();				
				
				let html ="";
				
				html += "<thead>";
				html += "<tr>";
				html += "<th>지역</th>";
				html += "<th>갤러리명</th>";
				html += "<th>주소</th>";
				html += "<th>전화번호</th>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				
				if(json.length == 0) {
					html += "<tr class='' style='cursor: pointer;'>";
					html += "<td colspan='4'>";
					html += "조회된 갤러리가 없습니다.";
					html += "</td>";
					html += "</tr>";
				}
				
				else {
					
					$.each(json, function(index, item) {
						
						if(item.location == "-") {
							return;
						}
							
						html += "<tr style='cursor: pointer;' onclick='selectedGallery()' class='selectedGallery'>";
						html += "<td style='width: 60px !important; display: none;' class='galleryno'>" + item.galleryno + "</td>";
						html += "<td style='width: 60px !important' class='gallerylocation'>" + item.location + "</td>";
						html += "<td class='galleryname'>" + item.galleryname + "</td>";
						html += "<td>" + item.detailaddress + "</td>";
						html += "<td style='width: 130px !important'>" + item.tel + "</td>";
						html += "</tr>";
					
					});					
				}
				
				html += "</tbody>";
				
				$("#galleryListTable").html(html);
			
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}
	
	function selectedGallery() {
		
		$(document).on("click", ".selectedGallery", function() {
			
			
			let gallerylocation = $(this).find(".gallerylocation").text();
			let galleryname = $(this).find(".galleryname").text();
			let galleryno = $(this).find(".galleryno").text();
			
		//	console.log(gallerylocation + " / " + galleryname);
			
			// sessionStorage 에 gallerylocation 과 galleryname 데이터 저장
			sessionStorage.setItem("gallerylocation", gallerylocation);
			sessionStorage.setItem("galleryname", galleryname);
			sessionStorage.setItem("galleryno", galleryno);
			
			$("#myModal").modal('hide');
		//	$("#galleryListTable").empty();
			writeGallery();
			
		});
		
	}
	
	function writeGallery() {
		
		let gallerylocation = sessionStorage.getItem("gallerylocation");
		let galleryname = sessionStorage.getItem("galleryname");
		let galleryno = sessionStorage.getItem("galleryno");
		
		if( (gallerylocation != null && galleryname != null ) && 
			(gallerylocation != "" && galleryname != "") ) {
			let gallery = gallerylocation+" ) "+ galleryname;
		    $("#gallery").val(gallery);
		    
		    let gallerynoText = galleryno;
		    $("#galleryno").val(gallerynoText);
		}
		
	}
	
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
	<form name="addExhibitionFrm" enctype="multipart/form-data">
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Exhibition</span>
			<span class="lt">Registration</span>
			<span class="titleDetail">Artree 는 작가 여러분이 개최하시는 전시회를 <br/> 홈페이지, 공식 SNS 에 홍보합니다.</span>
			<span class="titleContact"><br/>* 자료가 많은 경우 아래 메일로 보내주세요.<br/><br/></span>
			
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
					<td><input type="text" name="applier" id="applier" /></td> <!-- ${session.loginuser.username} -->
				<tr>
				<tr>
					<td>전시회명</td>
					<td><input type="text" name="exhibitionName" id="exhibitionName" /></td>
				<tr>
				<tr>
					<td>작가명</td>
					<td><input type="text" name="author" id="author" /></td>
				<tr>
				<tr>
					<td style="vertical-align: top;">작가정보</td>
					<td>
						<textarea id="authorInfo" name="authorInfo" style="resize:none; border:solid 1px lightgray; padding:10px;" rows="5">
						</textarea>
					</td>
				<tr>
				<tr>
					<td style="vertical-align: top;">전시정보</td>
					<td>
						<textarea id="exhibitionInfo" name="exhibitionInfo" style="resize:none; border:solid 1px lightgray; padding:10px;" rows="5">
						</textarea>
					</td>
				<tr>
				<tr>
					<td>전시관</td>
					<td>
						<input type="text" name="gallery" id="gallery" />
						<input type="hidden" name="galleryno" id="galleryno"/>
					</td>
				<tr>
				<tr>
					<td>일정</td>
					<td><input style="width:130px;" class="pickDate" type="text" name="startDate" id="startDate" autocomplete="off" />
						- 
						<input style="width:130px;" class="pickDate" type="text" name="endDate" id="endDate" autocomplete="off" />
					</td>
				<tr>
				<tr>
					<td>운영시간</td>
					<td><input style="width:130px;" type="text" name="openTime" id="openTime" />
						- 
						<input style="width:130px;" type="text" name="closeTime" id="closeTime" />
					</td>
				<tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email" autocomplete="off" /></td>
				<tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="tel" id="tel" autocomplete="off" /></td>
				<tr>
				<tr>
					<td>입장료</td>
					<td>
						<img class="freeBtn" src="<%= ctxPath %>/resources/images/board/button_free.PNG" alt=""/>
						<img class="priceBtn" src="<%= ctxPath %>/resources/images/board/button_price.PNG" alt=""/>
						
						<div id="priceArea" style="display:none;">
							<input style="width:100px; text-align:center;" type="text" name="price" id="price" placeholder="가격" autocomplete="off" />
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
			
			<div style="margin: 20px;">
				<label for="spinnerOqty">파일갯수 : </label>
				<input id="spinnerOqty" value="0" style="width: 30px; height: 20px;">
			</div>
			
			<!--  썸네일 아직 안배워서 일단 이렇게 처리 -->
			<div id="thumbNail-container" style="width:700px; height:200px; overflow:hidden;">
				<div class="thumbNail-wrap"><img class="thumbNail" src="" alt="" style="border:none;" /></div>
<!-- 				<div class="thumbNail-wrap"><img class="thumbNail" src="" alt="" style="border:none;" /></div>
				<div class="thumbNail-wrap"><img class="thumbNail" src="" alt="" style="border:none;" /></div>
			 --></div>
			<div id="myCarousel" class="carousel slide"  style="display:inline-block; overflow:hidden;">
				<div id="bigImage" align="center" style="display:inline-block; vertical-align: middle;">
					<a class="left" style="display:inline-block;">
						<i class='fa fa-angle-left arrow'></i>
					</a>
					
					<div id="image-wrap" class="carousel-inner" role="listbox" align="center">
 					    <div class="item active">
					      <img src="" alt="">
					    </div>
					    <!--
 					    <div class="item">
					      <img src="" alt="">
					    </div>
					    <div class="item">
					      <img src="" alt="">
					    </div> -->
				 	</div>

					<a class="right" style="display:inline-block;">
						<i class='fa fa-angle-right arrow'></i>
					</a>
				</div>
			</div>
		</div>	
			
			<div id="imageInput-container" align="center" style="margin: 0 auto;">
<!-- 				<input type="file" class="image-input" name="imageInput1" id="imageInput1" />
 				<input type="file" class="image-input" name="imageInput2" id="imageInput2" />
				<input type="file" class="image-input" name="imageInput3" id="imageInput3" /> -->
			</div>
		
		<div id="extraInfo">
			<table id="imgInfoTable" style="width: 95%; margin: 0 auto;">
<!-- 				<tr>
					<td>이미지 설명</td>
					<td><input type="text" class="extraInfo" name="imageInfo" id="imageInfo" /></td>
				</tr> -->
			</table>
			<table id="extraInfoTable">	
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
						<select id="genre" name="genre" style="width:100%;">
							<option value="">:: 선택하세요 ::</option>
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
						<span><input type="text" id="tag" name="tag" class="tag" style="width:100%" autocomplete="off" /></span>
					</td>
				<tr>
			</table>
			
			<div class="container" id="modalContainer">
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
					    
						<!-- Modal content-->
						<div class="modal-content" id="galleryModal">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">갤러리 검색</h4>
							</div>
							<div class="modal-body">
							
								<div id="searchArea" align="center" style="margin-top: 3vh">
									<select id="galleryLocation" name="galleryLocation">
										<option value="" >지역선택</option>
										<c:forEach items="${ galleryLocationList }" var="locations">
											<option>${ locations }</option>
										</c:forEach>
									</select>
									<input type="text" name="searchWord" id="searchWord" style="width: 40%; margin-left: 10px;" autocomplete="off" placeholder="갤러리명으로 검색" />
								</div>
								
								<div id="listArea" style="margin-top: 5vh">
									<table id="galleryListTable" class="table">
										<thead style="font-weight: bold">
											<tr>
												<td style="display: none">no</td>
												<td>지역</td>
												<td>갤러리명</td>
												<td>주소</td>
												<td>전화번호</td>
											</tr>
										</thead>
										
										<tbody>
											<c:if test="${ not empty galleryList  }">
											<c:forEach var="gallery" items="${ galleryList }" varStatus="status">
												<tr onclick='selectedGallery()' class="selectedGallery">
													<td style='width: 60px !important; display: none;' class='galleryno'>${ gallery.galleryno }</td>
													<td style="width: 60px !important" class="gallerylocation">${ gallery.location }</td> 
													<td class="galleryname">${ gallery.galleryname }</td>
													<td>${ gallery.detailaddress }</td>
													<td style="width: 130px !important">${ gallery.tel }</td>
												</tr>
												
											</c:forEach>
											</c:if>
											<c:if test="${ empty galleryList }">
												<tr><td>결과가 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					      
					</div>
				</div>
			</div>
			
			<div id="selectTag">
				<div id="byExpression">
					<h4>#표현별</h4>
					<c:forEach items="${ expression }" var="expression">
						<span>${ expression }</span>&nbsp;
					</c:forEach>
				</div>
				<div id="byGenre">
					<h4>#장르별</h4>
					<c:forEach items="${ genre }" var="genre">
						<span>${ genre }</span>&nbsp;
					</c:forEach>
				</div>
				<div id="byAdjective">
					<h4>#형용별</h4>
					<c:forEach items="${ adjective }" var="adjective">
						<span>${ adjective }</span>&nbsp;
					</c:forEach>
				</div>
				<div id="byColor">
					<h4>#색상별</h4>
					<c:forEach items="${ color }" var="color">
						<span>${ color }</span>&nbsp;
					</c:forEach>
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
