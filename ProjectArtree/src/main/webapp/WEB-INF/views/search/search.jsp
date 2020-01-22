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
		color : black !important;
	}
	
	.singleExhibition {
		vertical-align: middle;
	}
	
	.singleExhibition .title {
		font-size : 12pt;
		font-weight : bold;
	}
	
	.singleExhibition:hover {
		opacity : 0.8;
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
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			/* altField: '#calendar-date',
			dateFormat: 'yy-mm-dd', */
			minDate: 0,
			onChangeMonthYear: function (year, month, inst) {
				// 년 또는 월이 변경시 이벤트 발생
				getListByMonth(year,month);
			} ,
			onSelect: function (dateText, inst) {
    			// 일자 선택된 후 이벤트 발생
				getListByDate(dateText);
            }
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
			getListByDateAll();
		});
	
		// 테마별 검색 클릭
		$(".byTheme").click(function(){
			$(".condition").each(function(){
				$(this).removeClass("currentCondition");
			});
			$(this).addClass("currentCondition");
			getListByAllTheme();
		});
		
	}); // end of document.ready -----------------------------------------------

	// 날짜별로 리스트를 가져오는 함수 ---------------------------------------------------------
	function getListByDateAll(){
		$("#map").css('display','none');
		$("#theme").css('display','none');
		$("#date").css('display','inline-block');
		
		// 각 월별 전시회 목록을 불러오는 ajax를 함수로 빼서 사용 (초기값 2020년 1월로)
		getListByMonth("2020","1");
	} //----------------------------------------------------------------------------
	
	function getListByMonth(year,month){ // 해당 달에 열리는 전시회목록을 가져온다.------------
		$.ajax({ 
	    	  url:"<%=request.getContextPath()%>/monthSearch.at",
	          type:"GET",
	          data : {"year":year,"month":month},
	          dataType:"JSON",
	          success: function(json) { 
	        	  listofExhibition(json);
	          },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
	       });
	} // end of getListByMonth ------------------------------------------------
	
	// 선택한 날짜에 열리는 전시회 목록을 가져온다.------------------------------------------
	function getListByDate(dateText){
		
		$.ajax({ 
	    	  url:"<%=request.getContextPath()%>/dateSearch.at",
	          type:"GET",
	          data : {"date":dateText},
	          dataType:"JSON",
	          success: function(json) { 
	        	  listofExhibition(json);
	          },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
	       });
	} // end of getListByDate ----------------------------------------------------
	
	// 받아온 json 데이터를 view단에 뿌리는 함수----------------------------------------
	function listofExhibition(json){
		var html = "";
		 $("#exhibitionList").empty();
		 $.each(json, function(index, item) { // 링크 해결하세요
				 html += "<a href='/artree/exhDetail.at?exhibitionno="+item.exhibitionno+"'><div class='singleExhibition'>";
				 html += "<img src='"+item.mainposter+"' />";
				 html += "<span class='infoContainer'>";
				 html += "<span class='title' style='font-size:13pt;'>"+item.exhibitionname+"</span><br/><br/>";
				 html += "<span class='gallery'>"+item.galleryname+"/"+item.location+"</span><br/>";
				 html += "<span class='period'>"+item.startdate+" - "+item.enddate+"</span><br/>";			
				 html += "</span></div></a>";		
			 $("#exhibitionList").append(html);
			 html = "";
		});

		if($("#exhibitionList").html()==""){
			 html += "<div class='singleExhibition'>"+
				     "<span style='font-size:20px; text-align:middle;'>해당 기간에 열리는 전시회가 없습니다.</span></div>"; 
			 $("#exhibitionList").append(html);
		}
		
	} // end of listofExhibition -----------------------------------------------
	  
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
	
	<!-- 전시회 정보가 들어가는 곳 -->
	<div id="exhibitionList">	
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
		
		/* ----------------------- 카카오 지도 API -----------------------------*/	
		 var map = new kakao.maps.Map(document.getElementById('map'), { 
			 // 지도를 표시할 div
	       center : new kakao.maps.LatLng(36.2683, 127.6358), 
	       	 // 지도의 중심좌표 
	       level : 13 // 지도의 확대 레벨 
	   });
	   
		var clusterer = new kakao.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
		        minLevel: 10, // 클러스터 할 최소 지도 레벨
		        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});
		
	   /*  var markers = []; */
	   // 데이터를 가져오기 위해 jQuery를 사용합니다
	   // ajax로 데이터를 가져옵니다.
	   var coordsArr = new Array();
	    $.ajax({ 
	    	  url:"<%=request.getContextPath()%>/locationSearch.at",
	          type:"GET",
	          /* async:false, */
	          dataType:"JSON",
	          success: function(json) {
	        	// 주소-좌표 변환 객체를 생성합니다
        	   	 var geocoder = new kakao.maps.services.Geocoder();
        			 
        	   	  $.each(json, function(index, item) {
	       	   		  // console.log(item.detailAddress);
	       	   		  
	       	   		  // 주소로 좌표를 검색합니다
	       	       	  geocoder.addressSearch(item.detailAddress, function(result, status) {
	       	   	      // 정상적으로 검색이 완료됐으면 
	       	   	       if (status === kakao.maps.services.Status.OK) {
	
	       	   	    	   var coord = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	       	   	           // 결과값으로 받은 위치를 마커로 표시합니다
	       	   	           var marker = new kakao.maps.Marker({
	       	   	               map: map,
	       	   	               position: coord
	       	   	           });
	       	   	  
	       	   	          var coords = new Object();
	       	       	      coords.lat = coord.Ha;
	       	       	      coords.lng = coord.Ga; // {"lat":na.Ga, "lng":na.Ha}
	
	       	   	          coordsArr.push(coords);
	       	   	          }
        	       	  }); 		        	
        	   	  }); // end of $.each --------------------------------------  
        	   	  
	        	   	window.setTimeout(function(){
	        	   		console.log("~~~~ 원하는것. coordsArr.length => " + coordsArr.length);
	        	   		
	        	     	var data = {"coordsArr":JSON.stringify(coordsArr)};
	        				
	        				$.ajaxSettings.traditional = true;
	        	     		$.ajax({ 
	        	 	    	  url:"<%=request.getContextPath()%>/locationJSON.at",
	        	 	          type:"GET",
	        	 	          data : data,
	        	 	          dataType:"json",
	        	 	          success: function(data) {
	        	 	        	  /* console.log(data); */
	        	 	        	  // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        	 	              // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        	 	              var markers = $(data.positions).map(function(i, position) {
	        	 	                  return new kakao.maps.Marker({
	        	 	                      position : new kakao.maps.LatLng(position.lat, position.lng)
	        	 	                  });
	        	 	              });
	        						 /*  console.log(markers); */
	        	 	              // 클러스터러에 마커들을 추가합니다
	        	 	              clusterer.addMarkers(markers);
	        	 	          },
	        	 	          error: function(request, status, error){
	        		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        		          }
	        	     	  }); 
	        	   	}, 5000);
	         	 },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	           }
	       });	

	    
	}; //----------------------------------------end of searchbyLocation

   	
	/* ----------------------- 카카오 지도 API -----------------------------*/

	/* ----------- 테마별 word chart --------------------------------------------*/
			
		// 테마별로 리스트를 가져오는 함수-------------------------------------------------------
		function getListByAllTheme(){ 
		// 가장 처음, 모든 전시회의 태그를 String으로 연결해서 가져오고, 모든 전시회 정보를 가져온다.
			$("#map").css('display','none');
			$("#date").css('display','none');
			$("#theme").css('display','inline-block');
			$.ajax({
				  url:"<%=request.getContextPath()%>/allThemeSearch.at",
		          type:"GET",
		          dataType:"JSON",
		          success: function(json) { 
		        	  // 차트 만들기
		        	  getThemeChart("${allTag}");
		        	  
		        	  // 모든 전시회 정보 뿌리기
		        	  listofExhibition(json);
		          },
		          error: function(request, status, error){
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		          }
			});
		} //------------------------------------------------------------------------------
	
		// 선택한 테마에 해당하는 전시회만 보여주기
		function getListBySelectTheme(tag){
			$.ajax({
				  url:"<%=request.getContextPath()%>/selectThemeSearch.at",
		          type:"GET",
		          data : {"tag":tag },
		          dataType:"JSON",
		          success: function(json) { 
		        	  // 선택해온 전시회 정보 뿌리기
		        	  listofExhibition(json);
		          },
		          error: function(request, status, error){
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		          }
			});
		}
		
		function getThemeChart(text){
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
			        name: 'Occurrences',
			        cursor: 'pointer',
			        events: {
		                click: function (event) {
		                	getListBySelectTheme(event.target.textContent);
		                }
		            }
			    }],
			    title: {
			        text: ''
			    }
			});
		}
		/* ------------------------------------------------------------------------ */

		
</script>
