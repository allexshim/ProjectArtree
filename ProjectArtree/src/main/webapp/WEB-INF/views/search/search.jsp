<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	#container_exhibition {
		font-family: 'Noto Sans Kr', sans-serif;
		margin: 100px auto;
		width: 70%;
	}
	
	#container_exhibition .Title_Area {
		width: 100%;
		display: inline-block; 
		text-align: center;
	}
	
	#container_exhibition .Title_Area:after {
		content: "";
	  	display: block;
		/* width : 80%; */		
		padding-top : 30px;
		border-bottom : solid 2px lightgray;
	}
	
	#container_exhibition .Title_Area .st {
		display: block;
		font-size: 15pt;
	}
	
	#container_exhibition .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
	}
	
	/* 전시회 정보 --------------------------------------------------------*/
	#exhibitionList {
		display : inline-block;
		width : 45%;
		height : 800px;
		border : solid 1px red;
		overflow:auto;
	}
	
	/* 스크롤 바 custom --------------------------------------------------*/
	/* width */
	#exhibitionList::-webkit-scrollbar {
	  width: 10px;
	}
	
	/* Track */
	#exhibitionList::-webkit-scrollbar-track {
	  background: #f1f1f1; 
	}
	 
	/* Handle */
	#exhibitionList::-webkit-scrollbar-thumb {
	  background: #888; 
	}
	
	/* Handle on hover */
	#exhibitionList::-webkit-scrollbar-thumb:hover {
	  background: #555; 
	}
	/* 스크롤 바 custom --------------------------------------------------*/
	
	#exhibitionList img {
		width : 200px;
		height : 250px;
		padding : 0;
	}
	
	.infoContainer {
		display:inline-block;
		padding-top : 10px;
		width : 200px;
		height : 250px;
	}
	
	/* 검색조건 선택 ------------------------------------------------------*/
	div#searchCondition {
		padding-top : 20px;
		padding-bottom : 50px;
	}
	
	div#searchCondition span {
		font-size : 18pt;
		font-weight: bold;
		padding : 20px;
		color : gray;
		cursor : pointer;
	}
	
	div#searchCondition .currentCondition {
		color : black;
	}
	
	/* 카카오 지도 */
	div#map {
		display : inline-block;
		float : right;
		width : 500px;
		height : 800px;
	}
	
</style>

<%-- EXHIBITION LIST SCRIPT START --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){

		
	}); // end of document.ready -----------------------------------------------
	
	<!--  나중에 exhDetail함수에 전시회 코드를 parameter로 넣습니다. -->
	function exhDetail(){ // .at?code=code 와 같이 전송해서 해당 이벤트의 전시회 상세페이지로 이동합니다.
		location.href="<%= ctxPath%>/exhDetail.at";
	}

</script>

<div id="container_exhibition">
	<div class="Title_Area">
		<span class="st">Membership</span>
		<span class="lt">SEARCH</span>
	</div>
	
	<div id="searchCondition" align="center">
		<span class="currentCondition">지역별</span>
		<span>날짜별</span>
		<span>테마별</span>
	</div>
	
	<div id="exhibitionList">
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存박기훈 초대전 : 공존 (共存)박기훈 초대전 : 공존 (共存</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
	</div>	
	
	<div id="map"></div>
</div>

<!-- 카카오 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9125653427d4cb8c3684192e44579a28"></script>
<script type="text/javascript">

	/* ----------------------- 카카오 지도 API -----------------------------*/
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);

  /*   // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("/download/web/data/chicken.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers); 
    });*/
	/* ----------------------- 카카오 지도 API -----------------------------*/
</script>
