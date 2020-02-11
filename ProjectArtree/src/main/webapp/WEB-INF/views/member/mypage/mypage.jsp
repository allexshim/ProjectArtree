<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	/* 기본  */
	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	div.myPage_wrap {
		width: 1250px;
		margin: 0 auto;
		margin-top: 100px;
		margin-bottom: 50px;
	}
	
	ul {
		padding: 0;
		list-style: none;
	}

	/* header ~ nav */
	h1.header_name {
		font-size: 25px;
	}
	
	nav.myPage_tabs {
		margin: 30px 0 0 0;
	}
	
	a.tab {
		display: inline-block;
		padding: 15px;
		font-size: 14px;
		color: #000;
		width: 10%;
		text-decoration: none;
		text-align: center;
		float: left;
		border-bottom: 2px solid #e5e5e5;
	}
	
	div.tab_last {
		display: inline-block;
		width: 70%;
		height: 52px;
		float: left;
		border-bottom: 2px solid #e5e5e5;
	}
	
	.on {
		border-bottom: 2px solid #666 !important;
	}
	
	.onNav {
		border-bottom: 3px solid #666 !important;
	}
	
	/* 기본 틀 */
	div.conts {
		display: inline-block;
		width: 100%;
		border-bottom: 1px solid #e2e2e2;
		padding-bottom: 30px;
		margin-top: 20px;
	}
	
	div.conts h2 {
		margin: 20px 0;
		font-size: 25px;
		font-weight: normal;
	}
	
	/* 취향 분석 */
	div.favor_genre {
		width: 50%;
		float: left;
		text-align: center;
	}
	
	div.favor_tag {
		width: 50%;
		float: right;
		text-align: center;
	}
	
	div.favor_chart span {
		font-size: 18px;
	}
	
	div.chart_cont {
		padding: 50px;
	}
	
	/* 작품 컬렉션 */
	ul.collect_list li {
		display: inline-block;
	}
	
	div.list_div img {
		width: 249px;
	}

	/* 전시 클립 */
	div.tab_nav {
		width: 50%;
		float: left;
		border-bottom: 3px solid #DBDBDB;
		text-align: center;
		cursor: pointer;
		padding: 11px 0 20px 0;
	}
	
	table.tab_tbl {
		width: 100%;
	}
	
	div.tbl_div span {
		display: block;
	}
	
	div.tbl_div img {
		width: 160px;
		height: 160px;
		margin: 15px;
	}
	
	
	/* 선호 작가 */
	div.artist_list {
		width: 390px;
		margin-bottom: 20px;
		margin-right: 40px;
		float: left;
		cursor: pointer;
		text-align: center;
	}
	
	div.artist_list img {
		margin-bottom: 20px;
		width: 390px;
		height: 279px;
	}
	
	div.favor_artist ul :nth-child(3n) div {
        margin-right: 0px;
    }

	
	/* 선호 전시회 */
	
	div.favor_place ul :nth-child(2n) div {
        margin-right: 0px;
    }
	
	div.place_list {
		width: 590px;
		height: 483px;
		margin-right: 70px;
		float: left;
		display: inline-block;
	}
	
	div.img_wrap img { 
		width: 590px; 
		height: 414px; 
		display: block;
	}
	
	div.place_desc {
		float: left;
		width: 60%;
		margin-top: 20px;
	}
	
	div.place_desc span {
		display: block;
	}
	
	div.btn {
		float: right;
		margin-top: 10px;
		border: 1px solid #111;
		border-radius: 0;
		width: 163px;
		text-align: center;
		
	}
	
	div.btn a {
		height: 12px;
		padding: 20px 0px;
		text-decoration: none;
		color: #363636;
		font-size: 16px;
	}

	/* word chart */
	div.wordchart_cont {
		width: 500px;
		height: 300px;
		margin-top: 30px;
	}
	
	/* 선호 장르 차트 */
	div#chart_cont {
		width: 500px;
		height: 300px;
		padding-right: 0;
		padding-left: 120px;
		margin-right: 0;
		text-align: center;
	}
	
</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<!-- word chart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/wordcloud.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<!-- 선호 장르 차트 -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">

	$(function() {
		$(".tab").mouseover(function(){
			$(this).addClass("on");
		});
		
		$(".tab").mouseout(function(){
			$(this).removeClass("on");
			$("#myArtmap").addClass("on");
		});
		
		$("#wantCnt").html(${wantCnt});
		$("#goCnt").html(${goCnt});
		
		// word chart
		var text = "${text}";
		
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
		
		Highcharts.chart('wordchart_cont', {
		    accessibility: {
		        screenReaderSection: {
		            beforeChartFormat: ''
		        }
		    },
		    series: [{
		        type: 'wordcloud',
		        data: data
		    }],
		    title: {
		        text: ''
		    }
		}); 
	
		
		// 선호 장르 차트
		$.ajax({
			url:"<%= request.getContextPath()%>/getGenreData.at",
			dataType:"json",
			type:"GET",
			success:function(json){
			
				am4core.useTheme(am4themes_animated);
				
				var chart = am4core.create("chart_cont", am4charts.PieChart);
				
				chart.data = json;
				
				// Set inner radius
				chart.innerRadius = am4core.percent(50);

				// Add and configure Series
				var pieSeries = chart.series.push(new am4charts.PieSeries());
				pieSeries.dataFields.value = "cnt";
				pieSeries.dataFields.category = "genre";
				pieSeries.slices.template.stroke = am4core.color("#fff");
				pieSeries.slices.template.strokeWidth = 2;
				pieSeries.slices.template.strokeOpacity = 1;

				// This creates initial animation
				pieSeries.hiddenState.properties.opacity = 1;
				pieSeries.hiddenState.properties.endAngle = -90;
				pieSeries.hiddenState.properties.startAngle = -90;
			},
			  
		    error: function(request, status, error){
		 		alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
		
		
	});
	
	// 가고싶어요 다녀왔어요 변경
	function tab_nav(n){
		$(".tab_nav").removeClass("onNav");
		$(".tbl_div").css("display", "none");
		$("#tab_nav"+n).addClass("onNav");
		$("#tab_wrap"+n).css("display", "");
	}
	
	
</script>

<body>
	<div class="myPage_wrap">
	<div class="myPage_header">
		<h1 class="header_name">${loginuser.name}</h1>
		<nav class="myPage_tabs">
			<a href="/artree/mypage.at" class="tab on" id="myArtmap">My Artmap</a>
			<a href="/artree/mypage_order.at" class="tab">주문내역</a>
			<a href="/artree/mypage_set.at" class="tab">설정</a>
			<div class="tab_last"></div>
		</nav>
	</div>
	<div class="myPage_content">
		<div class="conts">
			<div class="favor_chart">
				<h2>취향분석</h2>
				<div class="favor_genre">
					<div class="genre_header">
						<span>선호장르</span>
					</div>
					<div class="chart_cont" id="chart_cont">
					</div>
				</div>
				<div class="favor_tag">
					<div class="tag_header">
						<span>선호태그</span>
					</div>
					<div class="wordchart_cont" id="wordchart_cont">
					</div>
				</div>
			</div>
		</div>
		
		<div class="conts" style="padding: 0px;">
			<div class="clip">
				<h2>전시클립</h2>
				<div class="tab_nav onNav" onClick="tab_nav('1')" id="tab_nav1">가고싶어요 (<span id="wantCnt"></span>)</div>
				<!-- select count -->
				<div class="tab_nav" onClick="tab_nav('2')" id="tab_nav2">다녀왔어요 (<span id="goCnt"></span>)</div>
				<div class="tbl_div" id="tab_wrap1">
					<table class="tab_tbl">
						<colgroup>
							<col style="width: 10%"/>
							<col style="width: 65%"/>
							<col style="width: 25%"/>
						</colgroup>
						<c:forEach items="${wantList}" var="want">
						<tr>
							<td>
							<c:if test="${want.mainposter.contains('http://')}">
								<img src="${want.mainposter}" onclick="javascript:location.href='/artree/exhDetail.at?eno=${want.exhibitionno}'" style="cursor: pointer;"/>
							</c:if>
							<c:if test="${!want.mainposter.contains('http://')}">
								<img src="<%= ctxPath%>/resources/files/${want.mainposter}"/>
							</c:if>
							</td>
							<td onclick="javascript:location.href='/artree/exhDetail.at?eno=${want.exhibitionno}'" style="cursor: pointer;">
								<span>${want.exhibitionname}</span>
								<span>${want.galleryname}</span>
								<span>${want.startdate} - ${want.enddate}</span>
							</td>
							<td>
								<span>${want.status}</span>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="tbl_div" id="tab_wrap2" style="display: none;">
					<table class="tab_tbl">
						<colgroup>
							<col style="width: 10%"/>
							<col style="width: 65%"/>
							<col style="width: 25%"/>
						</colgroup>
						<c:forEach items="${goList}" var="go">
						<tr>
							<td>
								<img src="${go.mainposter}" onclick="javascript:location.href='/artree/exhDetail.at?eno=${go.exhibitionno}'" style="cursor: pointer;"/>
							</td>
							<td onclick="javascript:location.href='/artree/exhDetail.at?eno=${go.exhibitionno}'" style="cursor: pointer;">
								<span>${go.exhibitionname}</span>
								<span>${go.galleryname}</span>
								<span>${go.startdate} - ${go.enddate}</span>
							</td>
							<td>
								<span>${go.status}</span>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		
		<div class="conts">
			<h2>선호작가</h2>
			<div class="favor_artist">
				<ul>
				<c:forEach items="${favorAuthor}" var="author">
					<li>
						<div class="artist_list" onclick="javascript:location.href='/artree/exhDetail.at?eno=${author.exhibitionno}'">
						<c:if test="${author.image1.contains('http://')}">
							<img src="${author.image1}"/>
						</c:if>
						<c:if test="${!author.image1.contains('http://')}">
							<img src="<%= ctxPath%>/resources/files/${author.image1}"/>
						</c:if>
							<span>${author.author}</span>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="conts" style="border-bottom: 0;">
			<h2>선호전시관</h2>
			<div class="favor_place">
				<ul>
					<c:forEach items="${favorGal}" var="gal">
					<li>
						<div class="place_list">
							<div class="img_wrap">
								<img src="${gal.mainpicture}" />
							</div>
							<div class="place_desc">
								<span>${gal.galleryname}</span>
								<span>${gal.detailaddress}</span>
							</div>
							<div class="btn">
								<a href="/artree/galDetail.at?gno=${gal.galleryno}">자세히 보러가기</a>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	</div>
</body>

