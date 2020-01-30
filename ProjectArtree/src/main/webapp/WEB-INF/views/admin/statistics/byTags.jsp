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
		width : 80%;
		margin : 0 auto;
	}
	
	div#contentContainer table thead td:first-child, div#contentContainer table tbody td:first-child {
		width : 10%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(2), div#contentContainer table tbody td:nth-child(2) {
		width : 20%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(3), div#contentContainer table tbody td:nth-child(3) {
		width : 10%;
		text-align: center;
	}
	
	div#contentContainer table thead td:nth-child(4), div#contentContainer table tbody td:nth-child(4) {
		width : 10%;
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
		height: 80vh;
		/* border: 2px solid red; */
		/* vertical-align: middle; */
		/* padding-top : 20px; */
	}
	
	#table-area {
		border: 2px solid navy;
		height: 50vh;
	}
	
/* 차트 관련  ------------------------------------------------------ */
	#chartdiv {
	  width: 80%;
	  margin : 0 auto;
	  height: 600px;
	}
</style>


<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/dataviz.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	let tagArr = [];
	$(document).ready(function(){ 
		
		$.ajax({ // 아래 url은 임시로 service controller에 저장합니다.
			url:"<%=request.getContextPath()%>/getChartDataByTags.at",
	          type:"GET",
	          dataType:"JSON",
	          success: function(json) { 
	        	  $.each(json, function(index2, item2){
		        		$.ajax({ // 각 태그를 선택한 연령대를 가져오는 ajax
		        			url : "<%=request.getContextPath()%>/getAgeDataByTags.at",
		        			type : "GET",
		    	        	data : {'tag' : item2.tag},
		        			// 각각 태그마다 ajax를 실행
		        			dataType:"JSON",
		    	        	success:function(json2) {
		    	        		let subArr = []; // data : [{}, {}, {}]... 부분에 해당하는 배열
		    	        		
		    	        		$.each(json2, function(index3, item3){
		    	        			// agegroup, agecnt, tag
		    	        			subArr.push({
		    	        				"agegroup":item3.agegroup+"대",
		    	        				"agecnt":Number(item3.agecnt),
		    	        			}); 

		    	        		}); // end of $.each(json2, function(index3, item3) --------------------------
		    	        		
		    	        		// 이중 객체 배열 사용 -- [{id:tag, value : agecnt}]
		    	        		 tagArr.push( { // 객체 배열에 직접 push한다.
		    	        			  "tag": item2.tag,
		    	        			  "cnt":  Math.round((Number(item2.cnt)/${totalcnt} )*100),
		    	        			  "subData": subArr    
					             });
		    	        	/////////////////////////////////////////////////////////////////////////////////////////////////	
		    	        	},error: function(request, status, error){
		    		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    		        }
		        		});
	        		}); // end of $.each(json, function(index2, item2)--------------------------------------------
					///////////////////////////// 데이터 가져오기 끝 /////////////////////////////////////////////////////////////
					 window.setTimeout(function(){
						getChartByChart(tagArr);

		        		/////// 데이터 테이블 만들기 //////////////////////////////////////////////////////////////////////////
		        		let html = "<table><thead>"+
					   			  "<tr><td>태그</td><td>선호하는 회원 수</td>"+
					   			  "<td>20대</td><td>30대</td><td>40대</td>"+
					   			  "<td>50대</td><td>60대 이상</td></tr></thead>"
					   			  "<tbody>";
					   			  //console.log(tagArr.length);
			   			for(let i=0; i<tagArr.length; i++) {	
			   				  let totalRatio = Math.round((tagArr[i].cnt/${totalcnt} )*100);
			   				
							  html += "<tr><td>"+tagArr[i].tag+"</td>";
							  html += "<td>"+totalRatio+"%</td></tr>";
							/*   html += "<td>"+tagArr[i].subData[0].agecnt+"</td>";
							  html += "<td>"+tagArr[i].subData[1].agecnt+"</td>";
							  html += "<td>"+tagArr[i].subData[2].agecnt+"</td>";
							  html += "<td>"+tagArr[i].subData[3].agecnt+"</td>"; */
							 // html += "<td>"+tagArr[i].subData[4].agecnt+"</td></tr>";
						}		  
						html += "</tbody></table>";
						$("#table-area").html(html);	
		        		//////////////////////////////////////////////////////////////////////////////////////////
					}, 500);
				},
	            error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            } 
	         }); // end of ajax-------------
	         
	}); // end of document.ready ----------------------------------------------     

	function getChartByChart(tagArr){
		
		am4core.ready(function() {
			
			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end
			
			var container = am4core.create("chartdiv", am4core.Container);
			container.width = am4core.percent(100);
			container.height = am4core.percent(100);
			container.layout = "horizontal";
				
			var chart = container.createChild(am4charts.PieChart);
			
			var label = chart.createChild(am4core.Label);

			// Add data
			chart.data = tagArr;
			
			// Add and configure Series
			var pieSeries = chart.series.push(new am4charts.PieSeries());
			pieSeries.dataFields.value = "cnt";
			pieSeries.dataFields.category = "tag";
			pieSeries.slices.template.states.getKey("active").properties.shiftRadius = 0;
			//pieSeries.labels.template.text = "{category}\n{value.percent.formatNumber('#.#')}%";
			//pieSeries.labels.template.radius = -10;
			
			pieSeries.fontSize = 18;
			pieSeries.tooltip.fontSize = 15;
			
			pieSeries.slices.template.events.on("hit", function(event) {
			  selectSlice(event.target.dataItem);
			})
		
			var chart2 = container.createChild(am4charts.PieChart);
			chart2.width = am4core.percent(30);
			chart2.radius = am4core.percent(80);
		
			// Add and configure Series
			var pieSeries2 = chart2.series.push(new am4charts.PieSeries());
			pieSeries2.dataFields.value = "agecnt";
			pieSeries2.dataFields.category = "agegroup";
			pieSeries2.slices.template.states.getKey("active").properties.shiftRadius = 0;	

			pieSeries2.fontSize = 18;
			pieSeries2.tooltip.fontSize = 15;
			// pieSeries2.labels.template.radius = -20;
			//pieSeries2.labels.template.inside = true;
			//pieSeries2.labels.template.fill = am4core.color("#ffffff");
			pieSeries2.labels.template.disabled = true;
			pieSeries2.ticks.template.disabled = true;
			pieSeries2.alignLabels = false;
			pieSeries2.events.on("positionchanged", updateLines);
		
			var interfaceColors = new am4core.InterfaceColorSet();
		
			var line1 = container.createChild(am4core.Line);
			line1.strokeDasharray = "2,2";
			line1.strokeOpacity = 0.5;
			line1.stroke = interfaceColors.getFor("alternativeBackground");
			line1.isMeasured = false;
		
			var line2 = container.createChild(am4core.Line);
			line2.strokeDasharray = "2,2";
			line2.strokeOpacity = 0.5;
			line2.stroke = interfaceColors.getFor("alternativeBackground");
			line2.isMeasured = false;
		
			var selectedSlice;
		
			function selectSlice(dataItem) {
		
			  selectedSlice = dataItem.slice;
		
			  var fill = selectedSlice.fill;
		
			  var count = dataItem.dataContext.subData.length;
			  pieSeries2.colors.list = [];
			  for (var i = 0; i < count; i++) {
			    pieSeries2.colors.list.push(fill.brighten(i * 2 / count));
			  }
		
			  chart2.data = dataItem.dataContext.subData;
			  pieSeries2.appear();
		
			  var middleAngle = selectedSlice.middleAngle;
			  var firstAngle = pieSeries.slices.getIndex(0).startAngle;
			  var animation = pieSeries.animate([{ property: "startAngle", to: firstAngle - middleAngle }, { property: "endAngle", to: firstAngle - middleAngle + 360 }], 600, am4core.ease.sinOut);
			  animation.events.on("animationprogress", updateLines);
		
			  selectedSlice.events.on("transformed", updateLines);
		
			//  var animation = chart2.animate({property:"dx", from:-container.pixelWidth / 2, to:0}, 2000, am4core.ease.elasticOut)
			//  animation.events.on("animationprogress", updateLines)
			}
		
		
			function updateLines() {
			  if (selectedSlice) {
			    var p11 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle) };
			    var p12 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle + selectedSlice.arc), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle + selectedSlice.arc) };
		
			    p11 = am4core.utils.spritePointToSvg(p11, selectedSlice);
			    p12 = am4core.utils.spritePointToSvg(p12, selectedSlice);
		
			    var p21 = { x: 0, y: -pieSeries2.pixelRadius };
			    var p22 = { x: 0, y: pieSeries2.pixelRadius };
		
			    p21 = am4core.utils.spritePointToSvg(p21, pieSeries2);
			    p22 = am4core.utils.spritePointToSvg(p22, pieSeries2);
		
			    line1.x1 = p11.x;
			    line1.x2 = p21.x;
			    line1.y1 = p11.y;
			    line1.y2 = p21.y;
		
			    line2.x1 = p12.x;
			    line2.x2 = p22.x;
			    line2.y1 = p12.y;
			    line2.y2 = p22.y;
			  }
			}
		
			chart.events.on("datavalidated", function() {
			  setTimeout(function() {
			    selectSlice(pieSeries.dataItems.getIndex(0));
			  }, 1000);
			});
	
		}); // end am4core.ready()	
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
			<a class="displayStatus" href="/artree/byGenre.at">선호 장르</a>
			<a class="displayStatus currentStatus" href="/artree/byTags.at">선호 태그</a>
		</div>

		<div id="contentContainer">
			
			<div id="statistics-area">
				<div id="chartdiv"></div>
			</div>
			
			<div id="table-area"></div>
			
		</div>
			
	</div>

</body>
</html>