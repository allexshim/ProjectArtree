<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		margin-top: 50px;
		width: 100%; 
		height: 600px; 
		border: solid 1px #e6e6e6;
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
		padding: 8% 5% 0 5%;
	}
	
	#container_gal_detail .specialArea {
		display: block; 
		margin: 20px 0 10px 0;
	}
	
	#container_gal_detail .specialArea .exhStatus {
		font-size: 13pt;
		border: none;
		background-color: #ff6666;
		padding: 5px 10px;
		color: white;
		border-radius: 5px;
		margin-right: 10px;
	}
	
	#container_gal_detail .info_title {
		display: block; 
		font-size: 30pt; 
		font-weight: bold;
	}
	
	#container_gal_detail .info_aboutGal {
		width: 100%;
		border-collapse: collapse;
		font-size: 15pt;
		text-align: left;
		margin-top: 40px;
	}
	
	#container_gal_detail .info_aboutGal tr {
		line-height: 300%;
		border-bottom: solid 1px #e6e6e6;
	}
	
	#container_gal_detail .info_aboutGal tr td {
		padding-left: 15px;
	}
	
	#container_gal_detail .info_aboutGal tr td:first-child {
		font-weight: bold;
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
		margin: 50px 0 30px 0;
	}
	
	#container_gal_detail .spanTitle {
		display: block;
		width: 30px;
		font-size: 17pt;
		font-weight: bold;
		text-align: left;
		border-right: solid 3px #000;
		margin-right: 30px;
		float: left;
	}
	
	#container_gal_detail .intro_content {
		font-size: 18px;
		text-align: left;
		display: block;
		float: left;
		width: 90%;
	}
	
	#container_gal_detail .curExh {
		float: left;
		width: 50%;
	}
	
	#container_gal_detail .comExh {
		float: right;
		width: 50%;
	}
	
	#container_gal_detail .curExhList {
		width: 30%;
		display: inline-block;
		margin: 0 10px 20px 0;
	}
	
	#container_gal_detail .curExhList a {
		text-decoration: none;
		color: #000;
		transition: opacity 1s ease;
	}
	
	#container_gal_detail .curExhList a:hover {
		opacity: 0.6;
	}
	
	#container_gal_detail .curExhList .ExhTitle {
		font-size: 10pt;
		font-weight: bold;
		display: block;
		margin-top: 10px;
	}
	
	#container_gal_detail .curExhList .ExhDate {
		font-size: 9pt;
		display: block;
	}
	
	#container_gal_detail .curExhList img {
		width: 100%;
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
	  padding: 18px;
	  border: none;
	  text-align: center;
	  font-size: 35px;
	  transition: 0.4s;
	  font-weight: bold;
	  outline: none;
	  height: 160px;
	}

	#container_gal_detail .accordion:hover {
		background-color: #e6e6e6;
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
		position: relative;
		max-width: 100%;
		margin-top: 100px;
	}
	
	#container_gal_detail .ExhList_Area a {
		text-decoration: none;
		color: #0d0d0d;
		cursor: pointer;
		display: inline-block;
		width: 21%;
		height: 500px;
		margin-right: 3.7%;
		margin-top: 20px;
		margin-bottom: 40px;
		border: solid 1px #e6e6e6;
	}
	
	#container_gal_detail .ExhList_Area a img {
		width: 100%;
		margin-bottom: 20px;
	}
	
	#container_gal_detail .ExhList_Area a .art_mainTitle {
		display: block;
		font-size: 18pt;
		font-weight: bold;
		margin: 3px 0 3px 0;
		padding-left: 10px;
	}
	
	#container_gal_detail .ExhList_Area a .InfoWhereWhen {
		display: block;
		font-size: 10pt;
		padding-left: 10px;
	}
	
	#container_gal_detail .ExhList_Area a span {
		text-align: left;
	}
	
</style>  

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=237be218cb7006c3cc000bc184bc1dc4&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
			
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
			geocoder.addressSearch('서울 마포구 연남동 566-55', function(result, status) {

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
				    '  <a href="https://map.kakao.com/link/search/서울 마포구 연남동 566-55" target="_blank">' +
				    '    <span class="title">챕터투</span>' +
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
	
</script>

<div id="container_gal_detail">

	<div class="main_top">
		<img class="main_img" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png">
		<div class="info_top">
			<span class="info_title">챕터투/서울</span>
			<div class="specialArea">
				<span class="exhStatus">전시중</span>
				<a href="" style="margin-right: 10px;"><img src="<%= ctxPath%>/resources/images/exhibition/ico/empty_heart.png"></a>
			</div>
			<table class="info_aboutGal">
				<tr>
					<td>주소</td>
					<td>서울 마포구 연남동 566-55</td>
				</tr>
				<tr>
					<td>휴관일</td>
					<td>일요일</td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>10:00 - 18:00</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>070-4895-1031.</td>
				</tr>
				<tr>
					<td>홈페이지</td>
					<td>http://chapterii.org</td>
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
				2448 문파인아츠(2448 MOON Fine Arts)는 1982년 그림과 공예전문점으로부터 시작하여,<br/>
				1989년에 판화 전문화랑인 문 갤러리(MOON Gallery)를 오픈하였습니다.<br/><br/>
				그림이라는 것이 특별한 사람들만 소장할 수 있는 예술품이 아닌,<br/>
				마음의 여유를 갖는다면 누구나 가능한 일이라는 생각을 가지고,<br/>
				국내외 작가들의 판화를 전시 기획하여 왔고,<br/>
				2006년 10월에는 새로워진 전시장과 2448 문파인아츠(2448 MOON Fine Arts)라는 새 이름으로 거듭나면서,<br/>
				풍요로운 삶을 위한 영혼의 양식인 예술이 우리의 일상에 항상 자리할 수 있도록<br/>
				현재 활발히 활동하고 있는 국내의 신진 및 중견작가들,<br/>
				그리고 아직 화단에 잘 알려지지 않은 좋은 작가 발굴에 힘쓰고 있습니다.
			</span>
		</div>
	</div>

	<div class="info_exhs divComCss">
		<div class="curExh">
			<span class="spanTitle">진행중 전시회</span>
			<!-- <div class="intro_content">진행중인 전시회가 없습니다.</div> -->
			<div class="intro_content">
				<div class="curExhList">
					<a href=""><%-- 타이틀 제목 길면 디비에서 읽어올때 짤라오기 ... --%>
						<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg">
						<span class="ExhTitle">많은 섬들의 나라, 우산타</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg">
						<span class="ExhTitle">많은 섬들의 나라, 우산타</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList" style="margin: 0 0 20px 0;">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg">
						<span class="ExhTitle">많은 섬들의 나라, 우산타</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<br/>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg">
						<span class="ExhTitle">많은 섬들의 나라, 우산타</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg">
						<span class="ExhTitle">많은 섬들의 나라, 우산타</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg">
						<span class="ExhTitle">많은 섬들의 나라, 우산타</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
			</div>
		</div>
		<div class="comExh">
			<span class="spanTitle">예정중 전시회</span>
			<!-- <div class="intro_content"> 예정중인 전시회가 없습니다.</div> -->
			<div class="intro_content">
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/exhPoster.jpg">
						<span class="ExhTitle">이주서사</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/exhPoster.jpg">
						<span class="ExhTitle">이주서사</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList" style="margin: 0 0 20px 0;">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/exhPoster.jpg">
						<span class="ExhTitle">이주서사</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<br/>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/exhPoster.jpg">
						<span class="ExhTitle">이주서사</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/exhPoster.jpg">
						<span class="ExhTitle">이주서사</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
				<div class="curExhList">
					<a href="">
						<img src="<%= ctxPath%>/resources/images/exhibition/exhPoster.jpg">
						<span class="ExhTitle">이주서사</span>
						<span class="ExhDate">2019.11.20 - 2020.13.20</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="lastExh divComCss">
		<span class="spanTitle">지난 전시회</span>
		<!-- <div class="intro_content">지난 전시회가 없습니다.</div> -->
		<div class="intro_content">
			<div class="forLastExhAcc">
				<button class="accordion" style="padding-top: 0;">
					2020
				</button>
				<div class="panel" style="width: 100%;">
					<div class="ExhList_Area" align="center">
						<a class="exh_one" onclick="exhDetail()">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<a class="exh_one" onclick="exhDetail()">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<a class="exh_one" onclick="exhDetail()">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<a class="exh_one" onclick="exhDetail()" style="margin-right: 0;">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<br/>
						<a class="exh_one" onclick="exhDetail()">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<a class="exh_one" onclick="exhDetail()">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<a class="exh_one" onclick="exhDetail()">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<a class="exh_one" onclick="exhDetail()" style="margin-right: 0;">
							<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
							<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
							<span class="art_mainTitle">그녀의 이름은</span>		
						</a>
						<br/>
					</div>
				</div>
	
				<button class="accordion">
					2019
				</button>
				<div class="panel" style="width: 100%;">
				</div>
				
				<button class="accordion">
					2018
				</button>
				<div class="panel" style="width: 100%;">
				</div>
				
				<button class="accordion">
					2017
				</button>
				<div class="panel" style="width: 100%;">
				</div>
			</div>
		</div>
	</div>
	
	<%-- -------------------------------------지도 영역 --%>
	<div id="map">ㄴㅇㄹㄴㅇㄹㄴㅇㄹ</div>
</div>
