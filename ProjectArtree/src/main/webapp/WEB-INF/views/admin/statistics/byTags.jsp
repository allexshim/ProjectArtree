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
		height: 70vh;
		/* border: 2px solid red; */
		vertical-align: middle;
		padding-top : 20px;
	}
	
	#table-area {
		border: 2px solid navy;
		height: 50vh;
	}
	
/* 차트 관련 */
	#chartdiv {
	  width: 80%;
	  margin : 0 auto;
	  height: 600px;
	}

</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){ 
		
		$.ajax({ // 아래 url은 임시로 service controller에 저장합니다.
			url:"<%=request.getContextPath()%>/getChartDataByTags.at",
	          type:"GET",
	          dataType:"JSON",
	          success: function(json) { 
	        	  getChartByTag(json);
	          },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
		});
		
	});

</script>

<!-- Chart code -->
<script>
	//Create the chart
	Highcharts.chart('container', {
	    chart: {
	        type: 'pie'
	    },
	    title: {
	        text: 'Browser market shares. January, 2018'
	    },
	    subtitle: {
	        text: 'Click the slices to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
	    },
	
	    accessibility: {
	        announceNewData: {
	            enabled: true
	        },
	        point: {
	            valueSuffix: '%'
	        }
	    },
	
	    plotOptions: {
	        series: {
	            dataLabels: {
	                enabled: true,
	                format: '{point.name}: {point.y:.1f}%'
	            }
	        }
	    },
	
	    tooltip: {
	        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	    },
	
	    series: [
	        {
	            name: "Browsers",
	            colorByPoint: true,
	            data: [
	                {
	                    name: "Chrome",
	                    y: 62.74,
	                    drilldown: "Chrome"
	                },
	                {
	                    name: "Firefox",
	                    y: 10.57,
	                    drilldown: "Firefox"
	                },
	                {
	                    name: "Internet Explorer",
	                    y: 7.23,
	                    drilldown: "Internet Explorer"
	                },
	                {
	                    name: "Safari",
	                    y: 5.58,
	                    drilldown: "Safari"
	                },
	                {
	                    name: "Edge",
	                    y: 4.02,
	                    drilldown: "Edge"
	                },
	                {
	                    name: "Opera",
	                    y: 1.92,
	                    drilldown: "Opera"
	                },
	                {
	                    name: "Other",
	                    y: 7.62,
	                    drilldown: null
	                }
	            ]
	        }
	    ],
	    drilldown: {
	        series: [
	            {
	                name: "Chrome",
	                id: "Chrome",
	                data: [
	                    [
	                        "v65.0",
	                        0.1
	                    ],
	                    [
	                        "v64.0",
	                        1.3
	                    ],
	                    [
	                        "v63.0",
	                        53.02
	                    ],
	                    [
	                        "v62.0",
	                        1.4
	                    ],
	                    [
	                        "v61.0",
	                        0.88
	                    ],
	                    [
	                        "v60.0",
	                        0.56
	                    ],
	                    [
	                        "v59.0",
	                        0.45
	                    ],
	                    [
	                        "v58.0",
	                        0.49
	                    ],
	                    [
	                        "v57.0",
	                        0.32
	                    ],
	                    [
	                        "v56.0",
	                        0.29
	                    ],
	                    [
	                        "v55.0",
	                        0.79
	                    ],
	                    [
	                        "v54.0",
	                        0.18
	                    ],
	                    [
	                        "v51.0",
	                        0.13
	                    ],
	                    [
	                        "v49.0",
	                        2.16
	                    ],
	                    [
	                        "v48.0",
	                        0.13
	                    ],
	                    [
	                        "v47.0",
	                        0.11
	                    ],
	                    [
	                        "v43.0",
	                        0.17
	                    ],
	                    [
	                        "v29.0",
	                        0.26
	                    ]
	                ]
	            },
	            {
	                name: "Firefox",
	                id: "Firefox",
	                data: [
	                    [
	                        "v58.0",
	                        1.02
	                    ],
	                    [
	                        "v57.0",
	                        7.36
	                    ],
	                    [
	                        "v56.0",
	                        0.35
	                    ],
	                    [
	                        "v55.0",
	                        0.11
	                    ],
	                    [
	                        "v54.0",
	                        0.1
	                    ],
	                    [
	                        "v52.0",
	                        0.95
	                    ],
	                    [
	                        "v51.0",
	                        0.15
	                    ],
	                    [
	                        "v50.0",
	                        0.1
	                    ],
	                    [
	                        "v48.0",
	                        0.31
	                    ],
	                    [
	                        "v47.0",
	                        0.12
	                    ]
	                ]
	            },
	            {
	                name: "Internet Explorer",
	                id: "Internet Explorer",
	                data: [
	                    [
	                        "v11.0",
	                        6.2
	                    ],
	                    [
	                        "v10.0",
	                        0.29
	                    ],
	                    [
	                        "v9.0",
	                        0.27
	                    ],
	                    [
	                        "v8.0",
	                        0.47
	                    ]
	                ]
	            },
	            {
	                name: "Safari",
	                id: "Safari",
	                data: [
	                    [
	                        "v11.0",
	                        3.39
	                    ],
	                    [
	                        "v10.1",
	                        0.96
	                    ],
	                    [
	                        "v10.0",
	                        0.36
	                    ],
	                    [
	                        "v9.1",
	                        0.54
	                    ],
	                    [
	                        "v9.0",
	                        0.13
	                    ],
	                    [
	                        "v5.1",
	                        0.2
	                    ]
	                ]
	            },
	            {
	                name: "Edge",
	                id: "Edge",
	                data: [
	                    [
	                        "v16",
	                        2.6
	                    ],
	                    [
	                        "v15",
	                        0.92
	                    ],
	                    [
	                        "v14",
	                        0.4
	                    ],
	                    [
	                        "v13",
	                        0.1
	                    ]
	                ]
	            },
	            {
	                name: "Opera",
	                id: "Opera",
	                data: [
	                    [
	                        "v50.0",
	                        0.96
	                    ],
	                    [
	                        "v49.0",
	                        0.82
	                    ],
	                    [
	                        "v12.1",
	                        0.14
	                    ]
	                ]
	            }
	        ]
	    }
	});

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
				<figure class="highcharts-figure">
				   <div id="container"></div>  
				</figure>
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