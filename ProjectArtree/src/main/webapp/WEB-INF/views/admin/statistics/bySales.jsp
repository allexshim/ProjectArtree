<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	.tooltip {
		position: sticky !important;
	}
	
	.tooltip.top {
		margin-top: 2% !important;
	}

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
	.table th {
		text-align: center;
	}
	
/* drilldown */
.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 400px;
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
/* drilldown end*/	
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<!-- drilldown -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<!-- drilldown end -->

<script type="text/javascript">
	$(document).ready(function(){ 					
		$('[data-toggle="checktip"]').tooltip('show');
		drilldown();			
		MonthGraph();
		$(document).on("click",".month",function(event){			
			var reserdate = $(this).find("input[name=reserdate]").val();			
			DayGraph(reserdate);
		});		
	});
	
	function DayGraph(reserdate) {		
		$.ajax({
			url:"<%=ctxPath%>/dailySales.at",
			dataType:"JSON",
			data:{"reserdate":reserdate},
			success:function(json2) {
				html2 = "";
				
				html2 += "<table class=\"table table-hover\">";
				$.each(json2,function(index2,item2){
					html2 += "<tr>";
					html2 += "<th>"+item2.reserdate+"일</th>";
					html2 += "<td>"+item2.dailySales+"만원</td>";
					html2 += "</tr>";
					html2 += "";						
				});				
				html2 += "</table>";
				$("#daily").html(html2);
			}					
		});
	}
	
	function MonthGraph() {
		$.ajax({
			url:"<%=ctxPath%>/monthlySales.at",
			dataType:"JSON",
			success:function(json) {
				html = "";	
				
				html += "<table class=\"table table-hover\">";																	
				$.each(json,function(index,item){					
					html += "<tr class=\"month\">";
					html += "<th>"+item.reserdate+"월</th>";
					html += "<td>"+item.monthlySales+"만원</td>";
					html += "<td style=\"padding: 0px !important; width: 0% !important;\"><input type=\"text\" hidden=\"hidden\" value=\""+item.reserdate+"\" name=\"reserdate\"></td>";					
					html += "</tr>";																
					html += "";				
				});
				html += "</table>";				
				$("#monthly").html(html);							
			}
		});
	}
	
	function drilldown() {
		$.ajax({
			url:"<%=ctxPath%>/monthlySales.at",
			dataType:"JSON",
			success:function(json) {
			$("#container").empty();				
			var resultArr = [];	
			var drillArr = [];
			for(var i=0; i<json.length; i++) {
				var obj = {name:json[i].reserdate+"월",y:Number(json[i].monthlySales),drilldown:json[i].reserdate+"월"};																		
				resultArr.push(obj);
			}			
			$.each(json, function(index2, item2){
				$.ajax({
					url:"<%=ctxPath%>/dailySales.at",
					data:{reserdate : item2.reserdate},					
					dataType:"JSON",
					success:function(json2) {	
						var subArr = [];							
						$.each(json2, function(index3, item3){																	
							subArr.push([
										item3.reserdate+"일",
										Number(item3.dailySales)
							]);								
						});																		
						drillArr.push({
							name:item2.reserdate+"월",
							id:item2.reserdate+"월",
							data:subArr
						});
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}	
				}); // json2
			});//each
			
			// Create the chart
			Highcharts.chart('container', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: 'Artree 매출'
			    },
			    subtitle: {
			        text: '클릭하면 일별 매출이 나옵니다.'
			    },
			    accessibility: {
			        announceNewData: {
			            enabled: true
			        }
			    },
			    xAxis: {
			        type: 'category'
			    },
			    yAxis: {
			        title: {
			            text: ''
			        }

			    },
			    legend: {
			        enabled: false
			    },
			    
			    plotOptions: {
			        series: {
			            borderWidth: 0,
			            dataLabels: {
			                enabled: true,			                
			                format: '{point.y:.0f}만원'			                	
			            }
			        }
			    },

			    tooltip: {
			        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
			        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}만원</b><br/>'
			    },

			    series: [
			        {
			            name: "월별 매출",
			            colorByPoint: true,
			            data: resultArr
			        }
			    ],
			    drilldown: {
			        series: drillArr
			    }
			});
			
		    },
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}				
		});
				
	} // drill
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
			<a class="displayStatus currentStatus" href="/artree/bySales.at">매출</a>
			<a class="displayStatus" href="/artree/byTicketingRate.at">예매율</a>
			<a class="displayStatus" href="/artree/byGender.at">성별 통계</a>
			<a class="displayStatus" href="/artree/byGenre.at">선호 장르</a>
			<a class="displayStatus" href="/artree/byTags.at">선호 태그</a>
		</div>

		<div id="contentContainer" align="center">
			
			<div id="statistics-area">
				<%-- 통계차트 여기다 넣으시면 됩니다 --%>
				<figure class="highcharts-figure">
    				<div id="container"></div>   
				</figure>					
			</div>
			
			<div id="table-area" style="overflow: hidden;">				
				<%-- 차트에 대한 데이터 테이블은 이곳에 넣으세요 !! --%>
				<div style="float: left; width: 40%; text-align: center;">
					<div style="font-size: 18px; padding: 3%;"><span data-placement="top" data-toggle="checktip" title="클릭하여 확인해보세요!">월별매출</span></div>					
					<div id="monthly"></div>						
				</div>	
			
				<div style="float: right; width: 40%;">
					<div style="font-size: 18px; padding: 3%;">일별매출</div>
					<div id="daily"></div>
				</div>					
			</div>
			
		</div>

	</div>

</body>
</html>