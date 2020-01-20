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
		padding : 13px;
		padding-top:10px;
		vertical-align: top;
	}
	
	.infoContainer {
		display:inline-block;
		padding-top : 10px;
		width : 200px;
		height : 250px;
	}
	
	.singleExhibition {
		vertical-align: middle;
	}
	
	.singleExhibition .title {
		font-size : 12pt;
		font-weight : bold;
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
	
	/* 달력 ------------------------------------------------*/
	div#date {
		display : none;
		padding-left : 30px;
		padding-top : 100px;
		margin : 0 auto;
		vertical-align: top;
	}
	
	#testDatepicker > div {
		width : 500px;
		height : 550px;
	}
	
	#testDatepicker tr {
		font-size : 16pt;
		padding-top : 10px;
		padding-bottom : 10px;
	}

	#testDatepicker .ui-datepicker-title {
		font-size : 18pt;
	}
	
	/* 달력 끝 ------------------------------------------------*/
	
	/* 테마 차트 ------------------------------------------------ */
	div#theme {
		display : none;
		vertical-align: top;
		margin : 0 auto;
		padding-left : 30px;
	}
	
	div#theme > themeContainer {
		display : inline-block;
	}
	
	.highcharts-figure, .highcharts-data-table table {
	    min-width: 320px; 
	    max-width: 800px;
	    margin: 1em auto;
	}

	.highcharts-data-table table {
		font-family: Verdana, sans-serif;
		border-collapse: collapse;
		border: 1px solid #EBEBEB;
		margin: 10px auto;
		text-align: center;
		width: 100%;
		max-width: 500px;
	}
	
	.highcharts-data-table caption {
	    padding: 1em 0;
	    font-size: 1.2em;
	    color: #555;
	}
	
	.highcharts-data-table th {
		font-weight: 600;
	    padding: 0.5em;
	}
	
	.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
	    padding: 0.5em;
	}
	
	.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
	    background: #f8f8f8;
	}
	
	.highcharts-data-table tr:hover {
	    background: #f1f7ff;
	}
	
/* --------------- 테마 차트 ------------------------------------------------- */

</style>

<%-- EXHIBITION LIST SCRIPT START --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- word cloud chart 관련 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/wordcloud.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#testDatepicker").datepicker({			
			dayNamesMin : ['월','화','수','목','금','토','일'],			
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});	
		
		// 화면이 로딩되면 지역별로 전시회 리스트를 가져오는 ajax function을 실행시킨다.
		getListByLocation();
		
		// 지역별별 검색 클릭
		$(".byLocation").click(function(){
			$(".condition").each(function(){
				$(this).removeClass("currentCondition");
			});
			$(this).addClass("currentCondition");
			getListByLocation();
		});
		
		// 날짜별 검색 클릭
		$(".byDate").click(function(){
			$(".condition").each(function(){
				$(this).removeClass("currentCondition");
			});
			$(this).addClass("currentCondition");
			getListByDate();
		});
		
		// 테마별 검색 클릭
		$(".byTheme").click(function(){
			$(".condition").each(function(){
				$(this).removeClass("currentCondition");
			});
			$(this).addClass("currentCondition");
			getListByTheme();
		});
		
	}); // end of document.ready -----------------------------------------------
	
	// 날짜별로 리스트를 가져오는 함수
	function getListByDate(){
		$("#map").css('display','none');
		$("#theme").css('display','none');
		$("#date").css('display','inline-block');
		
		// 각 월별 전시회 목록을 불러오는 ajax를 함수로 빼서 사용 (초기값 2020년 2월로)
		getListByMonth(1);
		
		// ajax....
	} //----------------------------------------
	
	function getListByMonth(month){ // 해당 달에 열리는 전시회목록을 가져온다.
		$.ajax({ 
	    	  url:"<%=request.getContextPath()%>/monthSearch.at",
	          type:"GET",
	          data : {"month":month},
	          dataType:"JSON",
	          success: function(json) { 
	        	  
	          },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
	       });
	} // end of getListByMonth ------------------------------------------------
	
	// 테마별로 리스트를 가져오는 함수
	function getListByTheme(){
		$("#map").css('display','none');
		$("#date").css('display','none');
		$("#theme").css('display','inline-block');
		// ajax ........
	} //----------------------------------------
	
	// 나중에 exhDetail함수에 전시회 코드를 parameter로 넣습니다.
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
		<span class="condition byLocation currentCondition">지역별</span>
		<span class="condition byDate">날짜별</span>
		<span class="condition byTheme">테마별</span>
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
				<span class="title">박기훈 초대전 : 공존 (共存)</span><br/><br/>
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
				<span class="title">박기훈 초대전 : 공존 (共存)</span><br/><br/>
				<span class="gallery">갤러리화이트원/서울</span><br/><br/>
				<span class="period">2020.01.15 - 2020.02.12</span><br/>
			</span>
		</div>
		<div class="singleExhibition">
			<img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" />
			<span class="infoContainer">
				<span class="title">박기훈 초대전 : 공존 (共存)</span><br/><br/>
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
	<div id="date">
		<div id="testDatepicker"></div>									
	</div>
	<div id="theme">
		<div id="themeContainer"></div>
	</div>
		
</div>

<!-- 카카오 지도 API -->
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9125653427d4cb8c3684192e44579a28&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	//지역별로 리스트를 가져오는 함수
	function getListByLocation(){
		$("#date").css('display','none');
		$("#theme").css('display','none');
		$("#map").css('display','inline-block');
		// ajax.........
	
	/* ----------------------- 카카오 지도 API -----------------------------*/	
	////////////////////////////////////////////////////////////////////////////////
		 var map = new kakao.maps.Map(document.getElementById('map'), { 
			 // 지도를 표시할 div
	       center : new kakao.maps.LatLng(36.2683, 127.6358), 
	       	 // 지도의 중심좌표 
	       level : 13 // 지도의 확대 레벨 
	   });
	   
	   // 마커 클러스터러를 생성합니다 
	   var clusterer = new kakao.maps.MarkerClusterer({
	       map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	       averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	       minLevel: 10 // 클러스터 할 최소 지도 레벨 
	   });
	   
	   var coordsArr = {"positions":[]};
	   // 데이터를 가져오기 위해 jQuery를 사용합니다
	   // ajax로 데이터를 가져옵니다.
	    $.ajax({ 
	    	  url:"<%=request.getContextPath()%>/locationSearch.at",
	          type:"GET",
	          dataType:"JSON",
	          success: function(json) {
	        	 // 주소-좌표 변환 객체를 생성합니다
	        	 var geocoder = new kakao.maps.services.Geocoder();
				 
	        	  $.each(json, function(index, item){
	        		  // console.log(item.detailAddress);
	        		  
	        		  // 주소로 좌표를 검색합니다
		        	  geocoder.addressSearch(item.detailAddress, function(result, status) {
		        	      // 정상적으로 검색이 완료됐으면 
		        	       if (status === kakao.maps.services.Status.OK) {

		        	          var na = new kakao.maps.LatLng(result[0].y, result[0].x);
		        	          //console.log(na); // na {Ga: 128.6063345323323, Ha: 35.85594989300081}
		        	       	  var coords = new Object();
			        	      coords.lat = na.Ga;
			        	      coords.lng = na.Ha;
			        	      
			        	      // 결과값으로 받은 위치를 마커로 표시합니다 (나중에 클러스터러 완성하면 삭제할 부분)
			        	        var marker = new kakao.maps.Marker({
			        	            map: map,
			        	            position: na
			        	        });
			        	      
		        	         //coordsArr.positions.push({"lat":na.Ga, "lng":na.Ha});   
		        	          // console.log(coords);
		        	          /* {"lat": 37.27943075229118,"lng": 127.01763998406159} */
		        	          }
			        	  }); 
		        	  });  
	        	   // 여기서 변환하고 json으로 출력하는 부분, 그리고 목록과 연동하는 부분 미완성
	        	  	console.log(coordsArr);
	        	  	var coordsJson = JSON.stringify(coordsArr);
	    			//console.log(coordsJson); //--> 카카오 api에서 클러스터러를 사용하기 위해 요구하는 데이터 type
	        	    
		        	$.get(coordsJson, function(data) {
		  	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
		  	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		  	        var markers = $(data.positions).map(function(i, position) {
		  	            return new kakao.maps.Marker({
		  	                position : new kakao.maps.LatLng(position.lat, position.lng)
		  	            });
		  	        });
		  	
	  		        // 클러스터러에 마커들을 추가합니다
	  		        clusterer.addMarkers(markers);
	  		 	 	});
		        	
	        	  },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	       });
	   
	    	
	}; //----------------------------------------end of searchbyLocation
		
		/* ----------------------- 카카오 지도 API -----------------------------*/

///////////////////////////////////////////////////////////////////////////////////////	
		/* ----------- 테마별 word chart --------------------------------------------*/
		
		// 아래 text는 샘플 텍스트이므로 추후 수정
		var text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean bibendum erat ac justo sollicitudin, quis lacinia ligula fringilla. Pellentesque hendrerit, nisi vitae posuere condimentum, lectus urna accumsan libero, rutrum commodo mi lacus pretium erat. Phasellus pretium ultrices mi sed semper. Praesent ut tristique magna. Donec nisl tellus, sagittis ut tempus sit amet, consectetur eget erat. Sed ornare gravida lacinia. Curabitur iaculis metus purus, eget pretium est laoreet ut. Quisque tristique augue ac eros malesuada, vitae facilisis mauris sollicitudin. Mauris ac molestie nulla, vitae facilisis quam. Curabitur placerat ornare sem, in mattis purus posuere eget. Praesent non condimentum odio. Nunc aliquet, odio nec auctor congue, sapien justo dictum massa, nec fermentum massa sapien non tellus. Praesent luctus eros et nunc pretium hendrerit. In consequat et eros nec interdum. Ut neque dui, maximus id elit ac, consequat pretium tellus. Nullam vel accumsan lorem.';
		var lines = text.split(/[,\. ]+/g),
		    data = Highcharts.reduce(lines, function (arr, word) {
		        var obj = Highcharts.find(arr, function (obj) {
		            return obj.name === word;
		        });
		        if (obj) {
		            obj.weight += 1;
		        } else {
		            obj = {
		                name: word,
		                weight: 1
		            };
		            arr.push(obj);
		        }
		        return arr;
		    }, []);
		
		/*
		data ~ 예시 배열 : 아래같은 데이터 배열을 ajax로 들고와서 아래 data에 넣어주면 될듯!
		0: {name: "Lorem", weight: 1}
		1: {name: "ipsum", weight: 1}
		*/
		
		Highcharts.chart('themeContainer', {
		    accessibility: {
		        screenReaderSection: {
		            beforeChartFormat: ''
		        }
		    },
		    chart: {
		        type: 'String',
		        width: 500,
		        height: 800,
		    },
		    series: [{
		        type: 'wordcloud',
		        data: data,
		        name: 'Occurrences'
		    }],
		    title: {
		        text: ''
		    }
		});
		
		/* ------------------------------------------------------------------------ */
</script>
