<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	#statisticsContainer {
		margin: 0 0 20vh 0;
		width: 100%;
		padding: 0;
	}
	
	img#boardtop {
		position : absolute;
		width : 96vw;
		height : 540px;
	}
	
	div#topText {
		padding-top : 610px;
		width : 200px;
		padding-left : 60px;
	}
	
	div#topText span {
		font-size : 13pt;
		text-align : left;
		margin-left : 8px;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}

	/* == 전시 상태별 선택 부분 == */
	div#eachStatus {
		padding-top : 40px;
		padding-left : 60px;
		font-size: 16pt;
	}

	div#eachStatus .displayStatus {
		margin-right : 20px;
		color : gray;
		padding : 5px;
	}
	
	div#eachStatus .currentStatus {
		color : black !important;
		font-weight: bold !important;
	}
	
	.displayStatus:hover {
		cursor: pointer;
		text-decoration: none;
		box-shadow: 3px 3px 3px 3px grey;
		border-radius: 10px;
	}

	/* == 내용물 부분 == */
	#contentContainer {
		padding-top : 100px;
		width : 60%;
		margin : 0 auto;
	}
	
	div#contentContainer table thead td:first-child, div#contentContainer table tbody td:first-child {
		width : 10%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(2), div#contentContainer table tbody td:nth-child(2) {
		width : 50%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(3), div#contentContainer table tbody td:nth-child(3) {
		width : 15%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(4), div#contentContainer table tbody td:nth-child(4) {
		width : 20%;
		text-align: center;
	}

	div#contentContainer table tbody td:nth-child(2) {
		cursor : pointer;
	}

	div#contentContainer table thead td {
		padding-top : 10px;
		padding-bottom : 10px; 
	}
	
	/* == 통계 영역 == */
	#statistics-area {
		height: 60vh;
		border: 2px solid red;
	}
	
	#table-area {
		border: 2px solid navy;
		height: 50vh;
	}
	
</style>

<%-- chart --%>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		genreChart();
	});
	
	function genreChart() {
		
		$.ajax({
			url:"<%= request.getContextPath()%>/getAllGenreData.at",
			dataType:"json",
			type:"GET",
			success:function(json){
		
				am4core.useTheme(am4themes_animated);
		
				var chart = am4core.create("statistics-area", am4charts.RadarChart);
				chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
		
				var label = chart.createChild(am4core.Label);
		
				chart.data = [
				  {
				    category: "One",
				    value1: 8
				  },
				  {
				    category: "Two",
				    value1: 11
				  },
				  {
				    category: "Three",
				    value1: 7
				  },
				  {
				    category: "Four",
				    value1: 13
				  },
				  {
				    category: "Five",
				    value1: 12
				  },
				  {
				    category: "Six",
				    value1: 15
				  },
				  {
				    category: "Seven",
				    value1: 9
				  },
				  {
				    category: "Eight",
				    value1: 6
				  }
				];
				chart.radius = am4core.percent(95);
				chart.startAngle = 270 - 180;
				chart.endAngle = 270 + 180;
				chart.innerRadius = am4core.percent(60);
		
				var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
				categoryAxis.dataFields.category = "category";
				categoryAxis.renderer.labels.template.location = 0.5;
				categoryAxis.renderer.grid.template.strokeOpacity = 0.1;
				categoryAxis.renderer.axisFills.template.disabled = true;
				categoryAxis.mouseEnabled = false;
		
				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				valueAxis.tooltip.disabled = true;
				valueAxis.renderer.grid.template.strokeOpacity = 0.05;
				valueAxis.renderer.axisFills.template.disabled = true;
				valueAxis.renderer.axisAngle = 260;
				valueAxis.renderer.labels.template.horizontalCenter = "right";
				valueAxis.min = 0;
		
				var series1 = chart.series.push(new am4charts.RadarColumnSeries());
				series1.columns.template.radarColumn.strokeOpacity = 1;
				series1.name = "Series 1";
				series1.dataFields.categoryX = "category";
				series1.columns.template.tooltipText = "{name}: {valueY.value}";
				series1.dataFields.valueY = "value1";
				series1.stacked = true;
		
				var series2 = chart.series.push(new am4charts.RadarColumnSeries());
				series2.columns.template.radarColumn.strokeOpacity = 1;
				series2.columns.template.tooltipText = "{name}: {valueY.value}";
				series2.name = "Series 2";
				series2.dataFields.categoryX = "category";
				series2.dataFields.valueY = "value2";
				series2.stacked = true;
		
				var series3 = chart.series.push(new am4charts.RadarColumnSeries());
				series3.columns.template.radarColumn.strokeOpacity = 1;
				series3.columns.template.tooltipText = "{name}: {valueY.value}";  
				series3.name = "Series 3";
				series3.dataFields.categoryX = "category";
				series3.dataFields.valueY = "value3";
				series3.stacked = true;
		
				var series4 = chart.series.push(new am4charts.RadarColumnSeries());
				series4.columns.template.radarColumn.strokeOpacity = 1;
				series4.columns.template.tooltipText = "{name}: {valueY.value}";
				series4.name = "Series 4";
				series4.dataFields.categoryX = "category";
				series4.dataFields.valueY = "value4";
				series4.stacked = true;
		
				var series1 = chart.series.push(new am4charts.RadarColumnSeries());
				series1.columns.template.radarColumn.strokeOpacity = 1;
				series1.name = "Series 5";
				series1.dataFields.categoryX = "category";
				series1.columns.template.tooltipText = "{name}: {valueY.value}";
				series1.dataFields.valueY = "value5";
				series1.stacked = true;

				var series2 = chart.series.push(new am4charts.RadarColumnSeries());
				series2.columns.template.radarColumn.strokeOpacity = 1;
				series2.columns.template.tooltipText = "{name}: {valueY.value}";
				series2.name = "Series 6";
				series2.dataFields.categoryX = "category";
				series2.dataFields.valueY = "value6";
				series2.stacked = true;

				var series3 = chart.series.push(new am4charts.RadarColumnSeries());
				series3.columns.template.radarColumn.strokeOpacity = 1;
				series3.columns.template.tooltipText = "{name}: {valueY.value}";  
				series3.name = "Series 7";
				series3.dataFields.categoryX = "category";
				series3.dataFields.valueY = "value7";
				series3.stacked = true;

				var series4 = chart.series.push(new am4charts.RadarColumnSeries());
				series4.columns.template.radarColumn.strokeOpacity = 1;
				series4.columns.template.tooltipText = "{name}: {valueY.value}";
				series4.name = "Series 8";
				series4.dataFields.categoryX = "category";
				series4.dataFields.valueY = "value8";
				series4.stacked = true;
				
				chart.seriesContainer.zIndex = -1;
		
				var slider = chart.createChild(am4core.Slider);
				slider.start = 0.5;
				slider.exportable = false;
				slider.events.on("rangechanged", function() {
				  var start = slider.start;
		
				  chart.startAngle = 270 - start * 179 - 1;
				  chart.endAngle = 270 + start * 179 + 1;
		
				  valueAxis.renderer.axisAngle = chart.startAngle;
				});
			},
			  
		    error: function(request, status, error){
		 		alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
	}

</script>
</head>
<body>
	<div id="statisticsContainer" class="container">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/admin/statistics.jpg" />
		</div>

		<div id="topText">
			<span>ADMIN ONLY</span>
			<h1 style="margin:0;">Statistics</h1>
		</div>
		
		<div id="eachStatus">
			<a class="displayStatus" href="/artree/bySales.at">매출</a>
			<a class="displayStatus" href="/artree/byTicketingRate.at">예매율</a>
			<a class="displayStatus" href="/artree/byGender.at">성별 통계</a>
			<a class="displayStatus currentStatus" href="/artree/byGenre.at">선호 장르</a>
			<a class="displayStatus" href="/artree/byTags.at">선호 태그</a>
		</div>

		<div id="contentContainer">
			
			<div id="statistics-area">
				<%-- 통계차트 여기다 넣으시면 됩니다 --%>
			</div>
			
			<div id="table-area">
				
				<%-- 차트에 대한 데이터 테이블은 이곳에 넣으세요 !! --%>
				
				<table class="table">
					<thead>
					
					</thead>
					
					<tbody>
					
					</tbody>
				</table>
				
			</div>
			
		</div>
			
	</div>

</body>
</html>