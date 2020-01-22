<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	#container_gal_detail {
		font-family: 'Noto Sans Kr', sans-serif;
		margin: 0 auto;
		width: 70%;
	}
	
	#container_gal_detail .main_top {
		display: inline-block;
		width: 100%; 
		height: 500px; 
		border: solid 1px #e6e6e6;
		margin-bottom: 50px;
	}
	
	#container_gal_detail .main_img {
		float: left; 
		width: 50%; 
		height: 100%;
	}

	#container_gal_detail .info_top {
		float: right; 
		width: 50%; 
		text-align: center; 
		padding: 5%;
		height: 100%;
		position: relative;
	}
	
	#container_gal_detail .specialArea {
		display: block; 
		margin: 20px 0 10px 0;
	}
	
	#container_gal_detail .specialArea .exhStatus {
		font-size: 12pt;
		border: none;
		background-color: #ff6666;
		padding: 4px 9px;
		color: white;
		border-radius: 5px;
		margin-right: 10px;
	}
	
	#container_gal_detail .ico1 { width: 30px; height: 30px; margin-bottom: 5px;}
	#container_gal_detail .ico2 { width: 20px; height: 20px; margin-bottom: 5px;}
	
	#container_gal_detail .info_title {
		display: block; 
		font-size: 22pt; 
		font-weight: bold;
	}
	
	#container_gal_detail .info_aboutGal {
		border-collapse: collapse;
		font-size: 13pt;
		text-align: left;
		margin-top: 40px;
		color: #000;
		bottom: 25px; 
		left: 15%; 
		position: absolute;
		width: 400px;
	}
	
	#container_gal_detail .info_aboutGal tr {
		line-height: 200%;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#container_gal_detail .info_aboutGal tr td {
		display: inline-table;
    	line-height: 2.5;
	}
	
	#container_gal_detail .info_aboutGal tr td:first-child { 
		font-weight: bold;
		width: 80px; 
	}
	
	<%-- 지도  --%>
	#container_gal_detail .customoverlay {
		position:relative;
		bottom:85px;
		border-radius:6px;
		border: 1px solid #ccc;
		border-bottom:2px solid #ddd;
		float:left;
	}
	
	#container_gal_detail .customoverlay:nth-of-type(n) {
		border:0; 
		box-shadow:0px 1px 2px #888;
	}
	
	#container_gal_detail .customoverlay a {
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
	
	#container_gal_detail .customoverlay .title {
		display:block;
		text-align:center;
		background:#fff;
		margin-right:35px;
		padding:10px 15px;
		font-size:14px;
		font-weight:bold;
	}
	
	#container_gal_detail .customoverlay:after {
		content:'';
		position:absolute;
		margin-left:-12px;
		left:50%;
		bottom:-12px;
		width:22px;
		height:12px;
		background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
	}
	<%-- 지도  --%>
	
	#container_gal_detail .divComCss {
		display: inline-block;
		width: 100%;
		margin: 60px 0 80px 0;
	}
	
	#container_gal_detail .spanTitle {
		display: block;
		width: 30px;
		font-size: 17pt;
		font-weight: bold;
		text-align: left;
		border-right: solid 3px #000;
		margin-right: 20px;
		float: left;
		color: #000;
	}
	
	#container_gal_detail .intro_content {
		font-size: 18px;
		text-align: left;
		display: block;
		float: left;
		width: 87%;
	}
	
	#container_gal_detail .curExh {
		float: left;
		width: 50%;
	}
	
	#container_gal_detail .comExh {
		float: right;
		width: 50%;
	}
	
	#container_gal_detail .ExhList {
		width: 30%;
		display: inline-block;
		margin: 0 10px 20px 0;
	}
	
	#container_gal_detail .ExhList a {
		text-decoration: none;
		color: #000;
		transition: opacity 0.5s ease;
	}
	
	#container_gal_detail .ExhList a:hover {
		opacity: 0.6;
	}
	
	#container_gal_detail .ExhList .ExhTitle { 
		font-size: 10pt;
		font-weight: bold;
		display: block;
		margin-top: 10px;
	}
	
	#container_gal_detail .ExhList .ExhDate {
		font-size: 9pt;
		display: block;
	}
	
	#container_gal_detail .ExhList img {
		width: 100%;
		height: 193px;
	}
	
	#container_gal_detail #map {
		width: 100%;
		height: 500px;
		margin: 40px 0 70px 0;
	}
	
	<%-- accordian start --%> 
	#container_gal_detail .accordion {
	  background-color: white;
	  color: #222;
	  width: 100%; 
	  cursor: pointer;
	  border: none;
	  text-align: center;
	  font-size: 35px;
	  transition: 0.4s;
	  font-weight: bold;
	  outline: none;
	  height: 160px; 
	}

	#container_gal_detail .accordion:hover {
		background-color: #f2f2f2;
	}
	
	#container_gal_detail .active {
		background-color: white;
	}
	
	#container_gal_detail .panel {
	  padding: 0 18px;
	  background-color: white;
	  max-height: 0;
	  overflow: hidden;
	  transition: max-height 0.3s ease-out;
	  margin-bottom: 0;
	  border: none;
	  box-shadow: none;
	}
	
	#container_gal_detail .accordion:after {
	  content: '\002B';
	  color: #000;
	  margin-left: 5px;
	}
	
	#container_gal_detail .active:after {
 	 content: '\2212';
	}
	
	<%-- accordian end --%>
	
	#container_gal_detail .ExhList_Area {
		width: 100%;
		margin-top: 50px;
		margin-bottom: 50px;
	}

	#container_gal_detail .ExhList_Area .exh_one {
		text-decoration: none;
		color: #0d0d0d;
		cursor: pointer;
		display: inline-block;
		width: 21%;
		height: 500px;
		margin-bottom: 40px;
		margin-right: 3.7%; 
		border: solid 1px #e6e6e6;
		position: relative;
	}
	
	#container_gal_detail .ExhList_Area .exh_one img {
		width: 100%;
		height: 300px;
		margin-bottom: 10px;
	}
	
	#container_gal_detail .ExhList_Area .exh_one .art_mainTitle {
		font-size: 13pt;
		font-weight: bold;
		padding: 10px;
		text-align: left;
		display: table-cell;
		position: relative;
	}
	
	#container_gal_detail .Title_Area {
		width: 100%;
		display: inline-block; 
		text-align: center;
		margin: 100px 0 100px 0;
	}
	
	#container_gal_detail .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
		color: #000;
	}

	#container_gal_detail .noDecoA {
		text-decoration: none;
		color: #000;
	}

</style>  

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=237be218cb7006c3cc000bc184bc1dc4&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		goGetIngExhs('${galDetailMap.GALLERYNO}'); // 진행중 전시회 
		goGetComExhs('${galDetailMap.GALLERYNO}'); // 예정 전시회
		goGetEndExhs('${galDetailMap.GALLERYNO}'); // 지난 전시회

		$(document).on("mouseover", ".exh_one", function(){
			$(this).find(".art_mainTitle").stop().animate({top:'5px'}, 180);
		});
		
		$(document).on("mouseout", ".exh_one", function(){
			$(this).find(".art_mainTitle").stop().animate({top:'0px'}, 180);
		});
		
		 $('[data-toggle="tooltip"]').tooltip();   
			
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
			geocoder.addressSearch('${galDetailMap.DETAILADDRESS}', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        var imageSrc = '<%= ctxPath%>/resources/images/exhibition/ico/map_point.png',
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
				    '  <a href="https://map.kakao.com/link/search/${galDetailMap.DETAILADDRESS}" target="_blank">' +
				    '    <span class="title">${galDetailMap.GALLERYNAME}</span>' +
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
	});
	
	///////////// 진행중 전시회 불러오기 
	function goGetIngExhs(gno){
		
		$.ajax({
			
			url: "<%=ctxPath%>/ingExhList.at",
			data: {"gno":gno},
			dataType: "JSON",
			success:function(json){
				
				var html = "";
				
				if(json.length == 0){
					// 각 영역에 준비중 띄우기
				}
				else {
					
					$.each(json, function(index, item){
						
						if((index+1)%3 != 0){
							html += '<div class="ExhList">'
								 + '<a href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
								 + '<img src="'+item.MAINPOSTER+'">'
								 + '<span class="ExhTitle">'+item.EXHIBITIONNAME+'</span>'
								 + '<span class="ExhDate">'+item.SCHEDULE+'</span>'
								 + '</a></div>';
						}
						else {
							html += '<div class="ExhList">'
								 + '<a href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
								 + '<img src="'+item.MAINPOSTER+'">'
								 + '<span class="ExhTitle">'+item.EXHIBITIONNAME+'</span>'
								 + '<span class="ExhDate">'+item.SCHEDULE+'</span>'
								 + '</a></div><br/>';
						}
						
						$(".ingExh").append(html);
					
					});
					
				} // end of json if ~ else ------------------
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	} // end of goGetIngExhs -------------------
	
	///////////////////// 예정 전시회 불러오기 
	function goGetComExhs(gno){
		
		$.ajax({

			url: "<%=ctxPath%>/comExhList.at",
			data: {"gno":gno},
			dataType: "JSON",
			success:function(json){
				
				var html = "";
				
				if(json.length == 0){
					// 각 영역에 준비중 띄우기
				}
				else {
					
					$.each(json, function(index, item){
						
						if((index+1)%3 != 0){
							html += '<div class="ExhList">'
								 + '<a href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
								 + '<img src="'+item.MAINPOSTER+'">'
								 + '<span class="ExhTitle">'+item.EXHIBITIONNAME+'</span>'
								 + '<span class="ExhDate">'+item.SCHEDULE+'</span>'
								 + '</a></div>';
						}
						else {
							html += '<div class="ExhList">'
								 + '<a href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
								 + '<img src="'+item.MAINPOSTER+'">'
								 + '<span class="ExhTitle">'+item.EXHIBITIONNAME+'</span>'
								 + '<span class="ExhDate">'+item.SCHEDULE+'</span>'
								 + '</a></div><br/>';
						}
						
						$(".comExh").append(html);
						
					});
					
				} // end of json if ~ else ------------------
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}// end of goGetIngExhs --------------------
	
	///////////////////// 지난 전시회 불러오기
	function goGetEndExhs(gno){
		
		$.ajax({

			url: "<%=ctxPath%>/endExhList.at",
			data: {"gno":gno},
			dataType: "JSON",
			success:function(json){
				
				if(json.length == 0){
					// 각 영역에 준비중 띄우기
				}
				else {
					
					var tthtml = ''; var ttCnt = 0;
					var nthtml = ''; var ntCnt = 0;
					var ethtml = ''; var etCnt = 0;
					var sthtml = ''; var stCnt = 0;
					
					$.each(json, function(index, item){
						
						var year = item.SCHEDULE.substr(0,4);
						
						if(year == '2020'){ ttCnt++;
							
							if(ttCnt%4 != 0){
								tthtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
									 	+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
										+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a>';
							}
							else {
								tthtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'" style="margin-right: 0;">'
										+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
										+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a><br/>';
							}
							
						}
						else if(year == '2019'){ ntCnt++;
							
							if(ntCnt%4 != 0){
								nthtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
									 	+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
									 	+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a>';
							}
							else {
								nthtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'" style="margin-right: 0;">'
								 		+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
								 		+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a><br/>';
							}
							
						}
						else if(year == '2018'){ etCnt++;
							
							if(etCnt%4 != 0){
								ethtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
									 	+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
									 	+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a>';
							}
							else {
								ethtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'" style="margin-right: 0;">'
							 		    + '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
							 		    + '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a><br/>';
							}
							
						}
						else if(year == '2017'){ stCnt++;
							
							if(stCnt%4 != 0){
								sthtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'">'
									 	+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
									 	+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a>';
							}
							else {
								sthtml += '<a class="exh_one" href="<%=ctxPath%>/exhDetail.at?eno='+item.EXHIBITIONNO+'" style="margin-right: 0;">'
								 		+ '<img class="exh_poster" src="'+item.MAINPOSTER+'"/>'
								 		+ '<span class="art_mainTitle">'+item.EXHIBITIONNAME+'</span></a><br/>';
							}
							
						} // end of 2020 ~ 2017 if else -------------
						
					});
					
					$(".2020").append(tthtml);
					$(".2019").append(nthtml);
					$(".2018").append(ethtml);
					$(".2017").append(sthtml);
					
				} // end of json if ~ else ------------------
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	} // end of goGetEndExhs --------------------

</script>

<div id="container_gal_detail">

	<div class="Title_Area">
		<span class="lt">GALLERY</span>
	</div>
	
	<c:if test="${not empty galDetailMap}">
	<div class="main_top">
		<img class="main_img" src="${galDetailMap.MAINPICTURE}">
		<div class="info_top">
			<span class="info_title">${galDetailMap.GALLERYNAME} | ${galDetailMap.LOCATION}</span>
			<div class="specialArea">
				<c:if test="${galDetailMap.STATUS == 1}"><span class="exhStatus">전시중</span></c:if>
				<c:if test="${galDetailMap.STATUS == 0}"><span class="exhStatus">전시완료</span></c:if>
				<a href="" data-toggle="tooltip" title="갤러리 관심 지정 !" data-placement="right"  style="margin-right: 10px;">
					<img class="ico1"src="<%= ctxPath%>/resources/images/exhibition/ico/select.png">
				</a>
			</div>
			<table class="info_aboutGal">
				<tr>
					<td>주소</td>
					<td>${galDetailMap.DETAILADDRESS}</td>
				</tr>
				<tr>
					<td>휴관일</td>
					<td>${galDetailMap.HOLIDAY}</td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>${galDetailMap.OPENINGHOUR}</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${galDetailMap.TEL}</td>
				</tr>
				<tr>
					<td>홈페이지</td>
					<td>
						<c:if test="${galDetailMap.WEBSITE != null}">
							<a class="noDecoA" href="${galDetailMap.WEBSITE}">${galDetailMap.WEBSITE}&nbsp;
							<img class="ico2" src="<%=ctxPath%>/resources/images/exhibition/ico/input.png">
							</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>	
	</div>
	
	<div class="divComCss">
		<div class="">
			<span class="spanTitle">갤러리소개</span>
		</div>
		<div class="">
			<span class="intro_content">
				${galDetailMap.INTRODUCTION}
			</span>
		</div>
	</div>

	<div class="info_exhs divComCss">
		<div class="curExh">
			<span class="spanTitle">진행중 전시회</span>
			<div class="intro_content ingExh">
			</div>
		</div>
		<div class="comExh">
			<span class="spanTitle">예정중 전시회</span>
			<div class="intro_content comExh">
			</div>
		</div>
	</div>
	<div class="lastExh divComCss">
		<span class="spanTitle">지난 전시회</span>
		<div class="intro_content">
			<div class="forLastExhAcc">
				<button class="accordion" style="padding-top: 0;">
					2020
				</button>
				<div class="panel" style="width: 100%;">
					<div class="ExhList_Area 2020">
					</div>
				</div>
	
				<button class="accordion">
					2019
				</button>
				<div class="panel" style="width: 100%;">
					<div class="ExhList_Area 2019">
					</div>
				</div>
				
				<button class="accordion">
					2018
				</button>
				<div class="panel" style="width: 100%;">
					<div class="ExhList_Area 2018">
					</div>
				</div>
				
				<button class="accordion">
					2017
				</button>
				<div class="panel" style="width: 100%;">
					<div class="ExhList_Area 2017">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- -------------------------------------지도 영역 --%>
	<div id="map"></div>
	</c:if>
</div>
