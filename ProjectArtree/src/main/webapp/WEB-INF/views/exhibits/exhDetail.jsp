<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	#container_exh_detail {
		font-family: 'Noto Sans Kr', sans-serif;
		margin: 0 auto;
		margin-top: 100px;
		width: 70%;
	}
	
	#container_exh_detail .main_top {
		margin: 0 auto;
		margin-top: 100px;
		width: 90%; 
		display: block;
		height: 550px; 
		border: solid 1px #e6e6e6;
	}
	
	#container_exh_detail .main_img {
		float: left; 
		width: 50%; 
		height: 100%;
	}

	#container_exh_detail .info_top {
		float: right; 
		width: 50%; 
		text-align: center; 
		padding: 5%;
		height: 100%;
	}
	
	#container_exh_detail .bigSpan {
		display: block; 
		font-size: 25pt; 
		font-weight: bold;
	}
	 
	#container_exh_detail .info_artist {
		display: block; 
		font-size: 20pt; 
		font-weight: bold; 
		margin: 20px 0 60px 0;
	} 
	
	#container_exh_detail .main_btm {
		margin: 30px 0 30px 0; 
		min-height: 600px;
		display: block;
		overflow: hidden;
	}
	
	#container_exh_detail .btmInfo_left {
		width: 50%; 
		float: left; 
		padding-top: 5%;
	}
	
	#container_exh_detail .btmInfo_where {
		display: block; 
		font-size: 15pt;
		margin-bottom: 20px;
		font-weight: bold;
		color: #000;
	}
	
	#container_exh_detail .btmInfo_where:hover {
		text-decoration: none;
	}
	
	#container_exh_detail .btmInfo_date {
		display: block; 
		font-size: 20pt; 
		font-weight: bold; 
		margin-bottom: 30px;
	}
	
	#container_exh_detail .span1 {
		display: block; 
		font-size: 13pt;
	}
	
	#container_exh_detail .btmInfo_right {
		width: 50%; 
		float: right; 
		padding: 5%; 
		font-size: 13pt;
	}
	
	#container_exh_detail .btn1 {
		display: inline-block; 
		font-weight: bold;
		background-color: #f2f2f2;
		border: none;
		border-radius: 2px;
		padding: 5px 10px 0 27px;
	}

	#container_exh_detail .buyBtn {
		margin-bottom: 10px;
		font-size: 20pt;
		bottom: -80px; position: relative;
	}
	
	#container_exh_detail .checkBtn {
		display: inline-block; 
		margin-bottom: 50px;
		font-size: 12pt;
		font-weight: bold;
		background-color: white;
		border: none;
		padding: 5px 25px 0px 25px;
		bottom: -130px; left: -49%; position: relative;
	}
	
	#container_exh_detail .ico1 {
		width: 22px; 
		height: 22px; 
		padding-bottom: 2px;
		position:relative;
	}
	
	#container_exh_detail .addBtn {
		font-size: 15pt;
	}
	
	<%-- select works slider start --%>
	
	#container_exh_detail .selectWorks_area .s1 {
		font-size: 30pt;
		font-weight: bold;
		margin-top: 200px;
		display: block;
		
	}
	
	#container_exh_detail .selectWorks_area .slideshow {
	  width: 1000px;
	  height: 600px;
	  position: relative;
	  margin: auto;
	}
	
	#container_exh_detail .selectWorks_area .mySlides {
	  display: none;
	}
	
	#container_exh_detail .selectWorks_area .prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  margin-top: -22px;
	  padding: 16px;
	  color: black;
	  font-weight: bold;
	  font-size: 25px;
	}
	
	#container_exh_detail .selectWorks_area .next {
	  right: 0;
	}
	
	#container_exh_detail .selectWorks_area .text {
	  display: block;
	  color: black;
	  font-size: 15px;
	  padding: 8px 12px;
	  top: 550px;
	  width: 100%;
	  text-align: center;
	  position: relative;
	}
	
	#container_exh_detail .selectWorks_area .dot {
	  cursor: pointer;
	  height: 10px;
	  width: 10px;
	  margin: 20px 10px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}
	
	#container_exh_detail .selectWorks_area .active1 {
		background-color: black;
	}
	
	#container_exh_detail .selectWorks_area .slideshow a {
		text-decoration: none;
	}
	
	#container_exh_detail .selectWorks_area .slideshow .slideView {
		display: block;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%,-50%);
	    width: auto;
	    height: auto;
	    max-width: 748px; 
	    max-height: 60vh;
	}

	<%-- select works slider end --%>

	<%-- review board start --%>
	#container_exh_detail .paginate {
		margin-top: 40px;
		text-align: center;
	}
	
	#container_exh_detail .paginate ul {
		display: inline-block;
	  	margin: 0 17px 0 17px;
	    padding: 0; 
	}
	
	#container_exh_detail .paginate li {
		display: inline-block;
	}
	
	#container_exh_detail .paginate li span , #container_exh_detail .paginate li a  {
		display: block;
	    width: 31px;
	    padding: 7px 0 6px;
	    box-sizing: border-box;
	    font-size: 16px;
	    color: #000;
	    font-weight: bold;
	    line-height: 14px;
	    text-decoration: none;
	    cursor: pointer;
	}
	
	#container_exh_detail .paginate .this {
		border: 2px solid #000000;
	}
	
	#container_exh_detail .basic_table {
		border-collapse: collapse;
		width: 100%;
		margin-bottom: 10px;
	}
	
	#container_exh_detail .basic_table th {
		font-size: 12pt;
		border-bottom: solid 3px #000000;
	}
	
	#container_exh_detail .basic_table th, td {
		height: 50px;
	    padding: 14px 5px;
	    line-height: 1.2;
	    vertical-align: middle;
	    text-align: center;
	}
	
	#container_exh_detail .basic_table td {
		color: #000000;
	}
	
	#container_exh_detail .basic_table a {
		text-align: left;
		text-decoration: none;
		color: #000000;
	}
	
	#container_exh_detail .basic_table a:hover {
		text-decoration: underline;
	}
	
	#container_exh_detail .basic_table button {
		 border: solid 1px #d9d9d9; 
		 padding: 5px 8px 5px 8px;  
		 background-color: white;
		 margin-right: 5px;
	}
	<%-- review board end --%>
	
	<%-- accordian start --%> 
	#container_exh_detail .detailInfo_area {
		width: 100%;
		min-height: 600px;
		margin-top: 80px; 
		margin-bottom: 50px;
		display: inline-block; 
		width: 100%;
	}
	
	#container_exh_detail .accordion {
	  background-color: white;
	  color: #222;
	  width: 100%;
	  cursor: pointer;
	  padding: 18px;
	  border: none;
	  border-bottom: solid 1px #333;
	  text-align: left;
	  font-size: 25px;
	  transition: 0.4s;
	  font-weight: bold;
	  outline: none;
	  transition: 0.4s;
	}
	
	#container_exh_detail .active, #container_exh_detail .accordion:hover {
		background-color: white;
	}
	
	#container_exh_detail .accordion:active {
	}
	
	#container_exh_detail .panel {
	  padding: 0 18px;
	  background-color: white;
	  max-height: 0;
	  overflow: hidden;
	  transition: max-height 0.3s ease;
	  margin-bottom: 0;
	  border: none;
	  box-shadow: none;
	}
	
	#container_exh_detail .accordion:after {
	  content: '\002B';
	  color: #000;
	  font-weight: bold;
	  float: right;
	  margin-left: 5px;
	}
	
	#container_exh_detail .active:after {
 	 content: '\2212';
	}

	<%-- accordian end --%>
	
	#container_exh_detail .detailInfo_area .acc_title {
		font-size: 30pt; 
		font-weight: bold; 
		color: #222; 
		display: inline-block; 
		margin-bottom: 20px;
	}

	#container_exh_detail .panel .defaultL {
		float: left; 
		padding: 20px; 
		line-height: 200%; 
		width: 50%;
	}
	
	#container_exh_detail .panel .defaultR {
		float: right; 
		padding: 20px; 
		line-height: 200%; 
		font-size: 12pt; 
		width: 50%;
	}
	
	#container_exh_detail .price_area table {
		width: 100%;
		margin: 30px 0 50px 0;
		font-size: 13pt;
	}
	
	#container_exh_detail .price_area table th, td {
		padding: 10px 0 10px 0;
		width: 25%;
	}
	
	#container_exh_detail .price_area table td:first-child {
		border-right: solid 1px #e6e6e6;
	}
	
	#container_exh_detail .price_area table th {
		text-align: center;
		font-weight: bold;
		font-size: 15pt;
		border-top: solid 1px #e6e6e6;
		border-bottom: solid 1px #e6e6e6; 
	}

	#container_exh_detail .price_area .price_notice ul {
		font-size: 12pt;
		line-height: 200%;
		margin-bottom: 20px;
	}
	
	#container_exh_detail .check_area table {
		width: 100%;
		margin: 20px 0 50px 0;
	}
	
	#container_exh_detail .check_area table tr td:first-child {
		font-weight: bold;
		font-size: 14pt;
	}
	
	#container_exh_detail .check_area table td {
		width: 50%;
		font-size: 13pt;
		border-bottom: solid 1px #e6e6e6;
	} 
	
	#container_exh_detail .place_area #map {
		width: 100%;
		height: 500px;
		margin: 20px 0 50px 0;
	}
	
	#container_exh_detail .customoverlay {
		position:relative;
		bottom:85px;
		border-radius:6px;
		border: 1px solid #ccc;
		border-bottom:2px solid #ddd;
		float:left;
	}
	
	#container_exh_detail .customoverlay:nth-of-type(n) {
		border:0; 
		box-shadow:0px 1px 2px #888;
	}
	
	#container_exh_detail .customoverlay a {
		display:block;
		text-decoration:none;
		color:#000;
		text-align:center;
		border-radius:6px;
		font-size:14px;
		font-weight:bold;
		overflow:hidden;
		background: #000000;
		background: #000000 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
	}
	
	#container_exh_detail .customoverlay .title {
		display:block;
		text-align:center;
		background:#fff;
		margin-right:35px;
		padding:10px 15px;
		font-size:14px;
		font-weight:bold;
	}
	
	#container_exh_detail .customoverlay:after {
		content:'';
		position:absolute;
		margin-left:-12px;
		left:50%;
		bottom:-12px;
		width:22px;
		height:12px;
		background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
	}
	
	#container_exh_detail #genderChart {
		width: 100%;
		height: 300px;
		margin: 30px 0 50px 0;
		padding-top: 20px;
		border-top: solid 2px #e6e6e6;
	}
	 
	#container_exh_detail #ageChart {
		width: 100%;
		height: 500px;
		margin: 50px 0 30px 0;
	} 
	
	#container_exh_detail .forMoving {
		padding-bottom: 5px; 
		position:relative;
	} 
	
	#container_exh_detail .tableTitle {
		font-size: 30pt; 
		font-weight: bold; 
		color: #333333;
	}
	
	#container_exh_detail .ico2 {
		width: 35px; 
		height: 35px; 
		padding-bottom: 5px; 
		margin-right: 10px;
	}
	
	#container_exh_detail .shareImg {
		display: inline-block;
		cursor: pointer;
		width: 50px;
		height: 50px;		
		margin: 20px 20px 10px 0;
	}
	
	#container_exh_detail .snsShare_title {
		text-align: center;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#container_exh_detail .shareArea {
		display: block;
	}

	#container_exh_detail .shareArea span {
		display: inline-block;
		width: 70px;
		font-weight: bold;
		font-size: 10pt;
	}
	
	#container_exh_detail #myModal {
        top: 50%;
  		margin-top: -50px;
	} 
	
	#container_exh_detail .special_area img {
		width: 30px;
		height: 30px;
	}
	
	#container_exh_detail .Title_Area {
		width: 100%;
		display: inline-block; 
		text-align: center;
		margin: 100px 0 100px 0;
	}
	
	#container_exh_detail .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
		color: #000;
	}
	
	#container_exh_detail .empty { 
		font-size: 11pt;
		text-align: center;
		margin: 50px 20px auto;
		border: solid 1px #e6e6e6;
		padding: 100px 30px;
		
	}
	
	#container_exh_detail .bkBtns {
		background-color: #000;
		color: white;
		padding: 5px 8px;
		margin-right: 15px;
		font-size: 11pt;
	}
	
	#container_exh_detail .board_btn_area a:hover {
		text-decoration: none;
	}
</style>  



<%-- EXHIBITION LIST SCRIPT START --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=237be218cb7006c3cc000bc184bc1dc4&libraries=services"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		goCheckLikeExh('${exhDetailMap.EXHIBITIONNO}');
		goCheckLikeGal('${exhDetailMap.FK_GALLERYNO}');
		getGenderChart('${exhDetailMap.EXHIBITIONNO}');
		getAgeChart('${exhDetailMap.EXHIBITIONNO}');
		
		getReview('${exhDetailMap.EXHIBITIONNO}', '1');
		getPreview('${exhDetailMap.EXHIBITIONNO}', '1');
		
		$(".forIco").hover(function(){
			$(this).children(".forMoving").stop().animate({left:'5px'}, 'fast');
	
		}, function(){
			$(this).children(".forMoving").stop().animate({left:'0px'}, 'fast');
		});
		
		$(".moving").click(function(){
			var start = $(".price_area").offset();
			$('html, body').animate({scrollTop:start.top}, 1000);
			$('[data-toggle="checktip"]').tooltip('show');
			$(".accordion").click(function(){
				$('[data-toggle="checktip"]').tooltip('hide');
			});
		});

			
		<%-- http://apis.map.kakao.com/web/guide/ 카카오 지도 스크립트 --%>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			  mapOption = { 
			        center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${exhDetailMap.DETAILADDRESS}', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        var imageSrc = '<%= ctxPath%>/resources/images/exhibition/ico/map_point.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = coords; // 마커가 표시될 위치입니다

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				  position: markerPosition,
				  image: markerImage // 마커이미지 설정 
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);  
				
				var strCoords = coords.toString();
				
				var target1 = strCoords.indexOf(",");
				var target2 = strCoords.lastIndexOf(",");
				
				var mapID = strCoords.substr(1, target1-1)+","+strCoords.substring(target1+2, strCoords.length-1);
				

				// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				var content = '<div class="customoverlay">' +
				    '  <a href="https://map.kakao.com/link/search/${exhDetailMap.DETAILADDRESS}" target="_blank">' +
				    '    <span class="title">${exhDetailMap.GALLERYNAME}</span>' +
				    '  </a>' +
				    '</div>';


				// 커스텀 오버레이가 표시될 위치입니다 
				var position = coords;

				// 커스텀 오버레이를 생성합니다
				var customOverlay = new kakao.maps.CustomOverlay({
				    map: map,
				    position: position,
				    content: content,
				    yAnchor: 1 
				});
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
			    } 
			});    

			
		<%-- http://apis.map.kakao.com/web/guide/ 카카오 지도 스크립트 --%>
		
	 	$(document).on("click", ".preview_paginate li", function(event){
			
			$(".preview_paginate").find(".this").removeClass("this").addClass("other");
			$(event.target).removeClass("other").addClass("this");
			
			var page = $(event.target).text();
			
			getPreview('${exhDetailMap.EXHIBITIONNO}', page);
			
		});
		
		$(document).on("click", ".review_paginate li", function(event){
			
			$(".review_paginate").find("this").removeClass("this").addClass("other");
			$(event.target).removeClass("other").addClass("this");
			
			var page = $(event.target).text();
			
			getReview('${exhDetailMap.EXHIBITIONNO}', page);
			
		}); 
		
		$(document).on("click", ".prevReview", function(){
			var page = $(".review_paginate").find(".this").text();
			getReview('${exhDetailMap.EXHIBITIONNO}', parseInt(page)-1); 
		}); 
		
		$(document).on("click", ".nextReview", function(){
			var page = $(".review_paginate ul li:first-child").text();
			getReview('${exhDetailMap.EXHIBITIONNO}', parseInt(page)+5); 
		}); 
		
		$(document).on("click", ".prevPreview", function(){
			var page = $(".preview_paginate ul li:first-child").text();
			getPreview('${exhDetailMap.EXHIBITIONNO}', parseInt(page)-5);
		}); 
		
		$(document).on("click", ".nextPreview", function(){
			var page = $(".preview_paginate ul li:first-child").text();
			getPreview('${exhDetailMap.EXHIBITIONNO}', parseInt(page)+5); 
		}); 
		
		
	}); // end of document ready ---------------------------------
	
	////////////////////////// 전시회 좋아요 체크 유무 확인 /////////////////////
	function goCheckLikeExh(eno){
		
		$.ajax({
			
			url: "<%=ctxPath%>/checkExhLike.at",
			data: {"eno":eno},
			dataType: "JSON",
			success: function(json){

				var html = "";
			
				if(json.ckExhLike == 1){
					html += "<img data-toggle='tooltip' title='전시회 관심 지정 !' data-placement='bottom' src='<%= ctxPath%>/resources/images/exhibition/ico/fav_heart.png'>";
				}
				else {
					html += "<img data-toggle='tooltip' title='전시회 관심 지정 !' data-placement='bottom' src='<%= ctxPath%>/resources/images/exhibition/ico/empty_heart.png'>";
				}
				
				$('[data-toggle="tooltip"]').tooltip();
				$(".A_heart").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
	///////////////////////// 갤러리 좋아요 체크 유무 확인 //////////////////////
	function goCheckLikeGal(gno){
		
		$.ajax({
			
			url: "<%=ctxPath%>/checkGalLike.at",
			data: {"gno":gno},
			dataType: "JSON",
			success: function(json){
				
				var html = "";
				
				if(json.ckGalLike == 1){
					html += "<img data-toggle='tooltip' title='갤러리 관심 지정 !' data-placement='bottom' src='<%= ctxPath%>/resources/images/exhibition/ico/selected.png'>";
				}
				else {
					html += "<img data-toggle='tooltip' title='갤러리 관심 지정 !' data-placement='bottom' src='<%= ctxPath%>/resources/images/exhibition/ico/select.png'>";
				}
				
				$(".A_select").html(html);
				$('[data-toggle="tooltip"]').tooltip();
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
	////////////////////////// 전시회 좋아요 지정 및 해제 ////////////////////////
	function exhLike(eno, gno, tag, gen){
		
		if(${sessionScope.loginuser == null}){ 
			alert("먼저 로그인을 진행해주세요 !");
			location.href="javascript:layer_open('layer')";
			return;
		}
		else {
			$.ajax({
				
				url: "<%=ctxPath%>/ExhLike.at",
				type: 'POST',
				async:false,
				data: {"eno":eno, "gno":gno, "tag":tag, "gen":gen},
				dataType: "JSON",
				success: function(json){
					if(json.CkEcnt == 1){
						goCheckLikeExh(eno);
					}
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		}
	}
	
	////////////////////////// 갤러리 좋아요 지정 및 해제 ////////////////////////
	function galLike(gno){
		
		if(${sessionScope.loginuser == null}){
			alert("먼저 로그인을 진행해주세요 !");
			location.href="javascript:layer_open('layer')";
			return;
		}
		else {
			$.ajax({
				
				url: "<%=ctxPath%>/GalLike.at",
				type: 'POST',
				data: {"gno":gno},
				dataType: "JSON",
				success: function(json){
					if(json.CkGcnt == 1){
						goCheckLikeGal(gno);
					}
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		}
	}
	
	
	///////////////////////////// SNS 공유하기 ////////////////////////////
	function share(sns, eno){
		
		var title = "${exhDetailMap.EXHIBITIONNAME} - ARTREE";	
		var URL = window.location.href;
		
		if(sns == 'mail'){
			window.open('mailto:?subject='+title+'&body='+URL);
		}
		else if(sns == 'kakao'){
			window.open('https://story.kakao.com/share?url='+URL); 
		}
		else if(sns == 'twitter'){
			window.open('https://twitter.com/intent/tweet?text='+title+'&url='+URL);			
		}
		else if(sns == 'facebook'){
			window.open('http://www.facebook.com/sharer/sharer.php?u='+URL);
		}
		else if(sns == 'url'){
			var IE=(document.all)?true:false;
			if (IE) {
			if(confirm("주소를 복사하시겠습니까?"))
				window.clipboardData.setData("Text", URL);
			} else {
				temp = prompt("Ctrl+C를 눌러 클립보드로 복사하세요", URL);
			}
		}
	} // end of share --------------------

	////////////////////////////////////////////// buy a ticket
	function goCtrl(eno){
		location.href="<%= ctxPath%>/ticketsbin.at?eno="+eno;
	}// end of goCtrl -----------------------------
	
	////////////////////////////////////////////// getGenderChart
	function getGenderChart(eno){
		
		$.ajax({
			url: "<%= ctxPath%>/genderChart.at?eno="+eno,
			data: {"eno":eno},
			dataType: "JSON",
			success: function(json){
				
				var resultArr = [];
				var html = "";
				
				if(json.length == 0){
					
					html += "<div class='empty' style='font-size:15pt; font-weight: bold;'> 데이터가 존재하지 않습니다. </div><br/><br/>";
					$(".chart_area").html(html);
					

				}
				else {
					for(var i=0; i<json.length; i++) {
						var obj = {name: json[i].GENDER,
								   value: json[i].CNT};
						resultArr.push(obj); // 배열속에 객체를 넣기
					}
				
				
					<%-- 차트 영역 --%>
					// 성별 차트
					am4core.ready(function() {
	
						// Themes begin
						am4core.useTheme(am4themes_kelly);
						am4core.useTheme(am4themes_animated);
						// Themes end
		
						var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"
		
						var chart = am4core.create("genderChart", am4charts.SlicedChart);
						chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
					
						chart.data = resultArr;
		
						var series = chart.series.push(new am4charts.PictorialStackedSeries());
						series.dataFields.value = "value";
						series.dataFields.category = "name";
						series.alignLabels = true;
		
						series.maskSprite.path = iconPath;
						series.ticks.template.locationX = 1;
						series.ticks.template.locationY = 0.5;
		
						series.labelsContainer.width = 200;
		
						chart.legend = new am4charts.Legend();
						chart.legend.position = "left";
						chart.legend.valign = "bottom";
					});
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
		
	}
	
	////////////////////////////////////////////// getAgeChart
	function getAgeChart(eno){
		
		$.ajax({
			url: "<%= ctxPath%>/ageChart.at?eno="+eno,
			data: {"eno":eno},
			dataType: "JSON",
			success: function(json){
				
				var resultArr = [];
				var html = "";
				
				if(json.length == 0){
					html += "<div class='empty' style='font-size:15pt; font-weight: bold;'> 데이터가 존재하지 않습니다. </div><br/><br/>";
					$(".chart_area").html(html);
					
				}
				else {
					for(var i=0; i<json.length; i++){
						var obj = { age: json[i].AGEGROUP+"대",
								    value: json[i].CNT };
						resultArr.push(obj);
					}
				
				
				// 연령대 차트
				am4core.ready(function() {

					// Themes begin
					am4core.useTheme(am4themes_kelly);
					am4core.useTheme(am4themes_animated);
					// Themes end

					var chart = am4core.create("ageChart", am4charts.PieChart);
					chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

					chart.data = resultArr;
					
					chart.radius = am4core.percent(70);
					chart.innerRadius = am4core.percent(40);
					chart.startAngle = 180;
					chart.endAngle = 360;  

					var series = chart.series.push(new am4charts.PieSeries());
					series.dataFields.value = "value";
					series.dataFields.category = "age";

					series.slices.template.cornerRadius = 10;
					series.slices.template.innerCornerRadius = 7;
					series.slices.template.draggable = true;
					series.slices.template.inert = true;
					series.alignLabels = false;

					series.hiddenState.properties.startAngle = 90;
					series.hiddenState.properties.endAngle = 90;

					chart.legend = new am4charts.Legend();

					}); // end am4core.ready()
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}
	
	////////////////////////////////// 리뷰 게시판 불러오기
	function getReview(eno, page){
	 	
		$.ajax({
			url:"<%=ctxPath%>/miniReviewList.at",
			data: {"eno":eno, "page":page},
			dataType: "JSON",
			success:function(json){
				
				$(".reviewArea").html("");

				var html = "";
				var pageBar = "";
				var prevArrow = "";
				var nextArrow = "";
				var total = 0;
				var blockSize = 5;
				var pageNo = ( Math.floor((page - 1)/blockSize) )*blockSize + 1;   

				if(json.length == 0){
					html += "<td colspan=3 class='empty' style='border: none; padding: 40px 30px;'> 등록된 게시물이 없습니다. </td>";
					$(".reviewArea").html(html);
				}
				else {

					$.each(json, function(index, item){

						html += "<tr>"
							 + "<td>"+(item.startIdx-index)+"</td>"
							 + "<td><a href='<%=ctxPath%>/reviewDetail.at?revno="+item.REVNO+"'>"+item.REVTITLE+"</a></td>"
							 + "<td>"+item.FK_NAME+"</td>"
							 + "<td style='display: none;'></td>"
							 + "</tr>";
							 
						total = item.totalPage;
						
					});

					// ***** [이전] 만들기 *****
					if( pageNo != 1 ) {
						prevArrow += "<a href='javascript:void(0)' class='prevReview'><img src='<%=ctxPath%>/resources/images/exhibition/ico/left_arrow.png'></a>";
					}
					
					pageBar += "<ul>";
					var loop = 1;

					while(!(loop > blockSize || pageNo > total)) {

						if(pageNo == page) {
							pageBar +="<li><span class='this'>"+pageNo+"</span></li>";
						} 
						else {	
							pageBar +="<li><a style='display: inline-block;' class='other'>"+pageNo+"</a><li>";
						}
						
							pageNo++; // 1 2 3 4 5 6 7 8 9 10
							loop++;	  // 1 2 3 4 5 6 7 8 9 10
							
					}// end of while --------------------
					
					pageBar += "</ul>";
					
					// *** [다음] 만들기 *** //
					if( total > blockSize ) {
						nextArrow += "<a style='display: inline-block;' href='javascript:void(0)' class='nextReview'><img src='<%=ctxPath%>/resources/images/exhibition/ico/right_arrow.png'></a>"; 
					}
 
					$(".reviewArea").append(html);
					$(".review_paginate").html(pageBar);
					$(".review_paginate").prepend(prevArrow);
					$(".review_paginate").append(nextArrow);

				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}) // end of ajax ---- 
	}
	
	///////////////////////////////// 기대평 게시판 불러오기 
	function getPreview(eno, page){
						
		$.ajax({
			url:"<%=ctxPath%>/miniPreviewList.at",
			data: {"eno":eno, "page":page},
			dataType: "JSON",
			success:function(json){
				
				$(".previewArea").html("");
				
				var html = "";
				var pageBar = "";
				var prevArrow = "";
				var nextArrow = "";
				var total = 0;
				var blockSize = 5;
				var pageNo = ( Math.floor((page - 1)/blockSize) )*blockSize + 1;   

				
				if(json.length == 0){
					html += "<td colspan=3 class='empty' style='border: none; padding: 40px 30px;'> 등록된 게시물이 없습니다. </td>";
					$(".previewArea").html(html);
				}
				else {
					
					$.each(json, function(index, item){
						
						html += "<tr>"
							 + "<td>"+(item.startIdx-index)+"</td>"
							 + "<td><a href='<%=ctxPath%>/previewDetail.at?bno="+item.SEQ+"'>"+item.TITLE+"</a></td>"
							 + "<td>"+item.NAME+"</td>"
							 + "<td style='display: none;'></td>"
							 + "</tr>";
		
						total = item.totalPage;
						
					});
					
					// ***** [이전] 만들기 *****
					if( pageNo != 1 ) {
						prevArrow += "<a href='javascript:void(0)' class='prevPreview'><img src='<%=ctxPath%>/resources/images/exhibition/ico/left_arrow.png'></a>";
					}
					
					pageBar += "<ul>";
					var loop = 1;

					while(!(loop > blockSize || pageNo > total)) {

						if(pageNo == page) {
							pageBar +="<li><span class='this'>"+pageNo+"</span></li>";
						} 
						else {	
							pageBar +="<li><a style='display: inline-block;' class='other'>"+pageNo+"</a><li>";
						}
						
							pageNo++; // 1 2 3 4 5 6 7 8 9 10
							loop++;	  // 1 2 3 4 5 6 7 8 9 10
							
					}// end of while --------------------
					
					pageBar += "</ul>";
					
					// *** [다음] 만들기 *** //
					if( !(pageNo > total) ) {
						nextArrow += "<a style='display: inline-block;' href='javascript:void(0)' class='nextPreview'><img src='<%=ctxPath%>/resources/images/exhibition/ico/right_arrow.png'></a>"; 
					}
					
					$(".previewArea").append(html);
					$(".preview_paginate").html(pageBar);
					$(".preview_paginate").prepend(prevArrow);
					$(".preview_paginate").append(nextArrow);
					
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		}) // end of ajax ---- 
		
	}
	
	function warnLogin(key){
		
		var loginuser = '${sessionScope.loginuser}'
		
		if(loginuser == null){
			alert("먼저 로그인을 진행해주세요 !");
			location.href="javascript:layer_open('layer')";
			return;
		}
		else if(loginuser != null && key == 'r'){
			window.location.href="/artree/addReview.at";	
		}
		else if(loginuser != null && key == 'p'){
			window.location.href="/artree/addPreview.at?eno="+${exhDetailMap.EXHIBITIONNO};	
		}
	}
</script>
<%-- EXHIBITION LIST SCRIPT END --%>


<div id="container_exh_detail">

	<div class="Title_Area">
		<span class="lt">EXHIBITION</span>
	</div>
	
	<c:if test="${not empty exhDetailMap}">
		<div class="main_top">
		
			<c:if test="${exhDetailMap.MAINPOSTER.contains('http://')}">
				<img class="main_img" src="${exhDetailMap.MAINPOSTER}"/>
			</c:if>
			<c:if test="${!exhDetailMap.MAINPOSTER.contains('http://')}">
				<img class="main_img" src="<%= ctxPath%>/resources/files/${exhDetailMap.MAINPOSTER}"/>
			</c:if>
			
			<div class="info_top">
				<span class="bigSpan">${exhDetailMap.EXHIBITIONNAME}</span>
				<span class="info_artist">${exhDetailMap.AUTHOR}</span>
				
				<c:if test="${exhDetailMap.PRICE ne 0}">
					<div class="top_btn_area" align="center" style="top: 720px; left: 58%; position: absolute;">
						<button type="button" class="buyBtn btn1 forIco" onclick="goCtrl('${exhDetailMap.EXHIBITIONNO}')">
							BUY TICKETS
							<img class="forMoving" src="<%= ctxPath%>/resources/images/exhibition/ico/right_arrow.png">
						</button>
						<button type="button" class="checkBtn forIco moving" >
							CHECK THIS PRICE
							<img class="ico1 forMoving" src="<%= ctxPath%>/resources/images/exhibition/ico/mouse.png">
						</button>
					</div>
				</c:if>
				
				<c:if test="${exhDetailMap.PRICE eq 0}">
					<div style="display: block;" align="center">
						<span class="bigSpan" style="top: 780px; left: 63.3%; position: absolute;"> FREE </span>
					</div>
				</c:if>

				<div class="special_area" style="margin-top: 30px; top: 920px; left: 62.5%; position: absolute;">
					<a href="javascript:void(0)" class="A_heart" onclick="exhLike('${exhDetailMap.EXHIBITIONNO}','${exhDetailMap.FK_GALLERYNO}','${exhDetailMap.TAG}','${exhDetailMap.GENRE}')" style="margin-right: 10px;">
					</a>
					<a href="javascript:void(0)" class="A_select" onclick="galLike('${exhDetailMap.FK_GALLERYNO}')" style="margin-right: 10px;">
					</a>
					<a href="" data-toggle="modal" data-target="#myModal">
						<img src="<%= ctxPath%>/resources/images/exhibition/ico/ico_share.png">
					</a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
				  <div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-body">
				      	<span class="snsShare_title">공유하기</span>
				      	<div class="shareArea">
							<img class="shareImg" src="<%= ctxPath%>/resources/images/exhibition/ico/email.png" onclick="share('mail','${exhDetailMap.EXHIBITIONNO}')">
							<img class="shareImg" src="<%= ctxPath%>/resources/images/exhibition/ico/kakao.png" onclick="share('kakao','${exhDetailMap.EXHIBITIONNO}')">
							<img class="shareImg" src="<%= ctxPath%>/resources/images/exhibition/ico/twitter.png" onclick="share('twitter','${exhDetailMap.EXHIBITIONNO}')">
							<img class="shareImg" src="<%= ctxPath%>/resources/images/exhibition/ico/facebook.png" onclick="share('facebook','${exhDetailMap.EXHIBITIONNO}')">
							<img class="shareImg" src="<%= ctxPath%>/resources/images/exhibition/ico/url.png" onclick="share('url','${exhDetailMap.EXHIBITIONNO}')" style="margin-right: 0px;">
						</div>
						<div class="shareArea">
							<span>MAIL</span>
							<span>KAKAO</span>
							<span>TWITTER</span>
							<span>FACEBOOK</span>
							<span>URL 복사</span>
						</div>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Modal -->
			</div>
		</div>
		
		<div class="main_btm" align="center">
			<div class="btmInfo_left">
			<a href="<%= ctxPath%>/galDetail.at?gno=${exhDetailMap.FK_GALLERYNO}" class="btmInfo_where forIco">${exhDetailMap.GALLERYNAME} | ${exhDetailMap.LOCATION}
				<img class="ico1 forMoving" src="<%= ctxPath%>/resources/images/exhibition/ico/mouse.png">
			</a>
			<span class="btmInfo_date">${exhDetailMap.SCHEDULE}</span>
			<span class="btmInfo_time1 span1">관람가능시간 | ${exhDetailMap.OPENCLOSETIME}</span>
			</div>
			<div class="btmInfo_right">
				<span class="aboutExh">
					${exhDetailMap.EXHIBITIONINFO}
				</span>
			</div>
		</div>
	
		<%-- -------------------------------------슬라이드쇼 영역 --%>
		<div class="selectWorks_area" style="margin-bottom: 300px; display: block;">
			<div class="s1" style="text-align: center;"><span class="slideshow_title">SELECT WORKS</span></div>
			<div class="slideshow">
			  <div class="mySlides">
			    <div class="numbertext" style="display: none;">1 / 3</div>
					<c:if test="${exhDetailMap.IMAGE1.contains('http://')}">
						<img class="slideView" src="${exhDetailMap.IMAGE1}"/>
					</c:if>
					<c:if test="${!exhDetailMap.IMAGE1.contains('http://')}">
						<img class="slideView" src="<%= ctxPath%>/resources/files/${exhDetailMap.IMAGE1}"/>
					</c:if>
			    <div class="text">${exhDetailMap.IMAGE1INFO}</div>
			  </div>
			  
			  <c:if test="${not empty exhDetailMap.IMAGE2}">
				  <div class="mySlides">
				    <div class="numbertext" style="display: none;">2 / 3</div>
				    	<c:if test="${exhDetailMap.IMAGE2.contains('http://')}">
							<img class="slideView" src="${exhDetailMap.IMAGE2}"/>
						</c:if>
						<c:if test="${!exhDetailMap.IMAGE2.contains('http://')}">
							<img class="slideView" src="<%= ctxPath%>/resources/files/${exhDetailMap.IMAGE2}"/>
						</c:if>
				    <div class="text">${exhDetailMap.IMAGE2INFO}</div>
				  </div>
			  </c:if>
			  
			  <c:if test="${not empty exhDetailMap.IMAGE3}">
				  <div class="mySlides">
				    <div class="numbertext" style="display: none;">3 / 3</div>
				    	<c:if test="${exhDetailMap.IMAGE3.contains('http://')}">
							<img class="slideView" src="${exhDetailMap.IMAGE3}"/>
						</c:if>
						<c:if test="${!exhDetailMap.IMAGE3.contains('http://')}">
							<img class="slideView" src="<%= ctxPath%>/resources/files/${exhDetailMap.IMAGE3}"/>
						</c:if>
				    <div class="text">${exhDetailMap.IMAGE3INFO}</div>
				  </div>
			  </c:if>
			
			  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			  <a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>
			
			<div style="text-align:center;">
			  <span class="dot" onclick="currentSlide(1)"></span>
			  <c:if test="${not empty exhDetailMap.IMAGE2}">
			  	<span class="dot" onclick="currentSlide(2)"></span>
			  </c:if>
			  <c:if test="${not empty exhDetailMap.IMAGE3}">
			  	<span class="dot" onclick="currentSlide(3)"></span>
			  </c:if>
			</div>
		</div>
		
		<%-- ------------------------------------------------리뷰 영역 --%>
		<div class="review_area">
			<table class="basic_table">
			<caption class="tableTitle">REVIEW</caption>
				<thead>
					<tr>
						<th style="width: 20%;">NO</th>
						<th>TITLE</th>
						<th style="width: 20%;">NAME</th>
					</tr>
				</thead>
				<tbody class="reviewArea" style="font-weight: bold;">
				</tbody>
			</table>
		</div>
		<div class="review_bottom" style="margin-top: 30px; width: 100%; text-align: right;">
			<div class="board_btn_area"> 
			<a href="javascript:void(0);" onclick="warnLogin('r')">
				<span class="bkBtns">작성하기</span>
			</a> 
			<a href="<%=ctxPath%>/reviewList.at">
				<span class="bkBtns">모두보기</span>
			</a>
			</div>
		</div>
		<div class="rev_prev"></div>
		<div class="review_paginate paginate"></div>
		<div class="rev_next"></div>
		
		<%-- ------------------------------------------기대평 영역 --%>
		<div class="preview_area" style="margin-top: 100px;">
			<table class="basic_table">
			<caption class="tableTitle">PREVIEW</caption>
				<thead>
					<tr >
						<th style="width: 20%;">NO</th>
						<th>TITLE</th>
						<th style="width: 20%;">NAME</th>
					</tr>
				</thead>
				<tbody class="previewArea" style="font-weight: bold;">
				</tbody>
			</table>
		</div>
		<div class="review_bottom" style="margin-top: 30px; width: 100%; text-align: right;">
			<div class="board_btn_area"> 
			<a href="javascript:void(0);" onclick="warnLogin('p')">
				<span class="bkBtns">작성하기</span>
			</a> 
			<a href="<%=ctxPath%>/previewList.at">
				<span class="bkBtns">모두보기</span>
			</a>
			</div>
		</div>
		<div class="prev_prev" style="display: inline-block;"></div>
		<div class="preview_paginate paginate"></div>
		<div class="prev_next" style="display: inline-block;"></div>
		
		
		<%-- -------------------------------------------아코디언 영역 --%>
		<div class="detailInfo_area">
			<span class="acc_title">INFORMATION</span>
		
			<button class="accordion">
				<img class="ico2" src="<%= ctxPath%>/resources/images/exhibition/ico/chart.png">
				WHO'S PICK?
			</button>
			<div class="panel chart_area" style="width: 100%;">
	   		  <div id="ageChart"></div>
	   		  <div id="genderChart"></div>
			</div>
			
			<button class="accordion">
				<img class="ico2" src="<%= ctxPath%>/resources/images/exhibition/ico/checklist.png">
				CHECK LIST
			</button>
			<div class="panel check_area">
			  <table>
			  	<tr>
			  		<td>입장시간</td>
			  		<td>관람종료 30분전까지</td>
			  	</tr>
			  	<tr>
			  		<td>식음료</td>
			  		<td>${exhDetailMap.FOODORDRINK}</td>
			  	</tr>
			  	<tr>
			  		<td>DSLR 카메라 및 휴대폰 촬영</td>
			  		<td>${exhDetailMap.PHOTO}</td>
			  	</tr>
			  	<tr>
			  		<td>기타관람제한사항</td>
			  		<td>${exhDetailMap.EXTRARESTRICTION}</td>
			  	</tr>
			  </table>
			</div>
			
			<c:if test="${exhDetailMap.PRICE ne 0}">
				<button class="accordion">
					<img class="ico2" data-toggle="checktip" title="클릭하여 확인해보세요 !" src="<%= ctxPath%>/resources/images/exhibition/ico/ico_ticket.png">
					TICKET PRICE
				</button>
				<div class="panel price_area">
				    <table>
					  	<tr>
					  		<th>연령</th>
					  		<th>일반</th>
					  		<th>Artree 회원가 10%</th>
					  		<th>단체 10인 이상 30%</th>
					  	</tr>
					  	<tr>
					  		<td>성인 | 만 19세 이상</td>
					  		<td>
					  			<fmt:formatNumber value="${exhDetailMap.PRICE}" type="number"/>원
					  		</td>
					  		<td>
					  			<fmt:formatNumber value="${exhDetailMap.PRICE*0.9}" type="number"/>원
					  		</td>
					  		<td>
					  			<fmt:formatNumber value="${exhDetailMap.PRICE*0.7}" type="number"/>원
					  		</td>
					  	</tr>
					  	<tr>
					  		<td>청소년 | 만 13 ~ 18세</td>
					  		<td>
					  			<fmt:formatNumber value="${exhDetailMap.PRICE*0.8}" type="number"/>원
					  		</td>
					  		<td>
					  			<fmt:formatNumber value="${(exhDetailMap.PRICE*0.8)*0.9}" type="number"/>원
					  		</td>
					  		<td>
					  			<fmt:formatNumber value="${(exhDetailMap.PRICE*0.8)*0.7}" type="number"/>원
					  		</td>
					  	</tr>
					  	<tr>
					  		<td>어린이 | 만 4 ~ 12세</td>
					  		<td>
					  			<fmt:formatNumber value="${exhDetailMap.PRICE*0.5}" type="number"/>원
					  		</td>
					  		<td>
					  			<fmt:formatNumber value="${(exhDetailMap.PRICE*0.5)*0.9}" type="number"/>원
					  		</td>
					  		<td>
					  			<fmt:formatNumber value="${(exhDetailMap.PRICE*0.5)*0.7}" type="number"/>원
					  		</td>
					  	</tr>
					  	<tr>
					  		<td>만 4세 미만</td>
					  		<td colspan="3">무료</td>
					  	</tr>
				    </table>
				  <div class="price_notice" style="width: 100%;">
				  	<ul>
				  		<li>모든 할인의 중복 적용은 불가하며 가장 높은 할인율의 가격을 기준으로 주문 및 결제됩니다.</li>
				  		<li>할인 및 무료 입장시 증빙서류(주소 기재된 신분증, 유공자증, 복지카드 등)는 현장에서 확인 가능해야 하며 미지참시 차액 결제 후 관람 가능합니다.</li>
				  		<li>청소년 또는 우대 할인 혜택은 현장 발권시 적용되며, 본인확인(신분증/복지카드 등)이 필요합니다.</li>
				  		<li>티켓 배송은 불가하며 해당 전시회의 전시 기간 중 전시장 방문시 현장수령 가능합니다.</li>
				  		<li>단체(10인 이상) 예약은 고객센터(02-6929-4460)로 문의 바랍니다.</li>
				  		<li>예매 취소는 My티켓 > 예매/취소내역에서 직접 취소 또는 고객센터 (1544-1555)를 통해서 취소할 수 있습니다.</li>
				  	</ul>
				  </div>
				</div>
			</c:if>
			
			<button class="accordion">
				<img class="ico2" src="<%= ctxPath%>/resources/images/exhibition/ico/map.png">
				PLACE
			</button>
			<div class="panel place_area" style="width: 100%;">
			  <div id="map"></div>
			</div>
			
			<button class="accordion">
				<img class="ico2" src="<%= ctxPath%>/resources/images/exhibition/ico/contact.png">
				CONTACT US
			</button>
			<div class="panel contact_area" style="text-align: left;">
			  <div class="cont_left defaultL" style="font-size: 13pt; font-weight: bold;">
			  	<ul style="list-style: none;">
			  		<li>ARTREE</li>
			  		<li>000 - 123 - 4567</li>
			  		<li>artree0213@gmail.com</li>
			  	</ul>
			  </div>
			  <div class="cont_right defaultR">
			  	<ul style="list-style: none;">
			  		<li>고객센터 휴무 - 주말 및 공휴일</li>
			  		<li>문의가능 시간 - 13 : 30 ~ 19 : 00</li>
			  		<li>고객센터 휴식시간 - 11 : 30 ~ 12 : 30</li>
			  	</ul>
			  </div>
			</div>
		  </div>
		</c:if>
</div>


<script type="text/javascript">
	
	<%-- select works slider start --%>
	var slideIndex = 1;
	showSlides(slideIndex);
	
	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active1", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active1";
	}
	<%-- select works slider end --%>
	
	<%-- accordian start --%>
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
	<%-- accordian end --%>

</script>