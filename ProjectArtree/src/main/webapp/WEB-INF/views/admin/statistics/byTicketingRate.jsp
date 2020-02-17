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
		margin: 0 auto;
		width: 80%;
		padding: 0;
	}
	
	img#boardtop {
		position : absolute;
		width : 100vw;
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
		width : 80%;
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
		margin: 50px auto 0 auto;
	}
	
	#table-area {
/* 		border: 2px solid navy; */
		min-height: 500px;
		width: 100%;
		margin: 0 auto 50px auto;
	}
	
	#chartdiv {
		width: 100%;
		min-height: 500px;
	}
	
	#datatable {
		text-align: center;
		width: 100%;
	}
	
	#datatable th {
		text-align: center;
	}
	
	.exname {
		width: 60%;
	}
	
	.amount {
		width: 20% !important;
	}
	
	.rate {
		width: 20% !important;
	}
	
	thead, tfoot {
		font-size: 12pt;
	}
	
	tbody {
		font-size: 11pt;
	}
	
	tfoot {
		width: 100%;
		font-weight: bold;
		border-top: solid 1px lightgrey;
		text-align: right;
	}
	
	tfoot td {
		padding-right: 30px !important;
	}
	
	#btnExcel {
		background-color: white;
		font-weight: bold;
		height: 50px;
		border: 1px solid lightgrey;
		box-shadow: 2px 2px 2px 2px grey;
		border-radius: 5px;
	}
	
	#btnPrint {
		background-color: white;
		font-weight: bold;
		height: 50px;
		border: 1px solid lightgrey;
		box-shadow: 2px 2px 2px 2px grey;
		border-radius: 5px;
	}
	
	
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">

	$(document).ready(function(){ 
	
		chart();
		
	});
	
	function chart() {
	
		let resultArr = [];
	
		$.ajax({
			
				url: "<%= ctxPath %>/getChartByTicketingRate.at",
				type:"GET",
				dataType:"JSON",
				success: function(json) {
				
					let html = "";
					html += "<thead>";
					html += "<tr>";
					html += "<th class='exname'>전시회명</th>";
					html += "<th class='rate'>예매율( % )</th>";
					html += "<th class='amount'>예매량</th>";
					html += "</tr>";
					html += "</thead>";
					html += "<tbody>";
					
					$.each(json, function(index, item){
						
						html += "<tr>";
						html += "<td>" + item.name + "</td>";
						html += "<td style='width: 20% !important'>" + item.pct + "</td>";
						html += "<td style='width: 20% !important'>" + item.cnt + "</td>";
						html += "</tr>";
						
					});
					
					html += "</tbody>";
					html += "<tfoot><td colspan='3'>총 예매 수 : " + ${ totalCount } + "</td></tfoot>";
					
					$("#datatable").html(html);
					
					$("#btnExcel").click(function(){
						
						window.location.href = "downloadExcelFile.at";
						
					});
					
					am4core.ready(function() {
			
						// Themes begin
						am4core.useTheme(am4themes_animated);
						// Themes end
				
						// Create chart instance
						var chart = am4core.create("chartdiv", am4charts.XYChart3D);
				
						for(let i = 0; i < json.length; i++) {
							
							let obj = {name: json[i].name, cnt: Number(json[i].cnt)};
							
							resultArr.push(obj);
							
						}
					
						// Add data
						chart.data = resultArr;
						
						// Create axes
						let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
						categoryAxis.dataFields.category = "name";
						categoryAxis.renderer.labels.template.rotation = 270;
						categoryAxis.renderer.labels.template.hideOversized = false;
						categoryAxis.renderer.minGridDistance = 20;
						categoryAxis.renderer.labels.template.horizontalCenter = "right";
						categoryAxis.renderer.labels.template.verticalCenter = "middle";
						categoryAxis.tooltip.label.rotation = 270;
						categoryAxis.tooltip.label.horizontalCenter = "right";
						categoryAxis.tooltip.label.verticalCenter = "middle";
				
						let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
						valueAxis.title.text = "TICKETING RATES";
						valueAxis.title.fontWeight = "bold";
				
						// Create series
						var series = chart.series.push(new am4charts.ColumnSeries3D());
						series.dataFields.valueY = "cnt";
						series.dataFields.categoryX = "name";
						series.name = "Ticketing Rate";
						series.tooltipText = "{categoryX}: [bold]{valueY}[/]";
						series.columns.template.fillOpacity = .8;
				
						var columnTemplate = series.columns.template;
						columnTemplate.strokeWidth = 2;
						columnTemplate.strokeOpacity = 1;
						columnTemplate.stroke = am4core.color("#FFFFFF");
				
						columnTemplate.adapter.add("fill", function(fill, target) {
						  return chart.colors.getIndex(target.dataItem.index);
						})
				
						columnTemplate.adapter.add("stroke", function(stroke, target) {
						  return chart.colors.getIndex(target.dataItem.index);
						})
				
						chart.cursor = new am4charts.XYCursor();
						chart.cursor.lineX.strokeOpacity = 0;
						chart.cursor.lineY.strokeOpacity = 0;
						
					});
		
				},
				error: function(request, status, error){
			             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
				
		}); // end am4core.ready()
		
	}
	
</script>
</head>
<body>

	<div id="imgcontainer">	
	  	<img id="boardtop" src="<%= ctxPath %>/resources/images/admin/statistics.jpg" />
	</div>

	<div id="statisticsContainer" class="container">
		
		<div id="topText">
			<span>ADMIN ONLY</span>
			<h1 style="margin:0;">Statistics</h1>
		</div>
		
		<div id="eachStatus">
			<a class="displayStatus" href="/artree/bySales.at">매출</a>
			<a class="displayStatus currentStatus" href="/artree/byTicketingRate.at">예매율</a>
			<a class="displayStatus" href="/artree/byGender.at">성별 통계</a>
			<a class="displayStatus" href="/artree/byGenre.at">선호 장르</a>
			<a class="displayStatus" href="/artree/byTags.at">선호 태그</a>
		</div>

		<div id="contentContainer">
			
			<div id="statistics-area">
				<%-- 통계차트 여기다 넣으시면 됩니다 --%>
				<div id="chartdiv">
					
				</div>
				
			</div>
			
<!-- 			<hr style="border-top: 2px solid lightgrey; width: 100%;"> -->
			
			<div id="table-area" class="container">
				
				<%-- 차트에 대한 데이터 테이블은 이곳에 넣으세요 !! --%>
				
				<table class="table" id="datatable">
				</table>
				
				<div align="right" style="margin-top: 50px;">
					<button type="button" id="btnExcel">FILE DOWNLOAD</button>
				</div>
			</div>
			
		</div>

	</div>

</body>
</html>