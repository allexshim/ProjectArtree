<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	#container_exhibition .Title_Area .st {
		display: block;
		font-size: 15pt;
		color: #000;
	}
	
	#container_exhibition .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
		color: #000;
	}
	
	#container_exhibition .ExhCategory_Area {
		display: inline-block;
		width: 100%;
		margin: 150px 0 50px 0;
		text-align: center;
	}
	
	#container_exhibition .ExhCategory_Area a {
		text-decoration: none;
		color: #bfbfbf;
		margin-left: 20px;
		font-weight: bold;
	}
	
	#container_exhibition .ExhCategory_Area a:hover {
		color: #0d0d0d;
		font-weight: bold;
	}
	
	#container_exhibition .ExhCategory_Area .cate_exh {
		display: inline-block;
		padding-bottom: 15px;
		border-bottom: solid 1px #e6e6e6;
		width: 70%;
		font-size: 15pt;
	}
	
	#container_exhibition .ExhCategory_Area .cate_map { 
		font-size: 13.5pt;
		padding-top: 15px;
	}

	#container_exhibition .ExhList_Area {
		position: relative;
		max-width: 100%;
		margin-top: 100px;
	}
	
	#container_exhibition .ExhList_Area a {
		text-decoration: none;
		color: #0d0d0d;
		cursor: pointer;
		display: inline-block;
		width: 22%;
		height: 550px;
		margin-right: 3.7%;
		margin-top: 40px;
		border: solid 1px #e6e6e6;
	}
	
	#container_exhibition .ExhList_Area a img {
		width: 100%;
		margin-bottom: 20px;
	}
	
	#container_exhibition .ExhList_Area a .art_mainTitle {
		display: block;
		font-size: 18pt;
		font-weight: bold;
		margin: 3px 0 3px 0;
		padding-left: 10px;
	}
	
	#container_exhibition .ExhList_Area a .InfoWhereWhen {
		display: block;
		font-size: 10pt;
		padding-left: 10px;
	}
	
	#container_exhibition .ExhList_Area a .art_info_aboutTime {
		position: relative;
	}
	
</style>

<%-- EXHIBITION LIST SCRIPT START --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".exh_one").hover(function(){
			$(this).children(".art_info_aboutTime").stop().animate({top:'7px'}, 180);

		}, function(){
			$(this).children(".art_info_aboutTime").stop().animate({top:'0px'}, 180);
		});
		
	}); // end of document ready --------------------------
	
	/////////////// 스크롤 페이징
	var lenExh = 16;
	var page = 1;
	getExhList(page);
    page++;
    ///////////////
	
	// 스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	$(window).scroll(function(){   
	     if($(window).scrollTop() >= $(document).height() - $(window).height()){
	    	 getExhList(page);
	           page++;   
	     } 
	});

	
	
	////////////////// 전시회 목록 불러오기 /////////////////////
	function getExhList(page){
		console.log(page);
		console.log(lenExh);
		$.ajax({
			url: "<%= ctxPath%>/exhList.at",  
	        dataType : "JSON", 
	        data : {"page" : page, "len" : lenExh},
	        success : function(json) {
	        	
	        	var html = "";
	        	
	        	if(json.length == 0){
					
					html += "실패";

					$(".ExhList_Area").html(html);

				}
				else {

					$.each(json, function(index, item){
					
						if( (index+1)%4 != 0){				
							html += "<a class='exh_one' onclick='exhDetail("+item.EXHIBITIONNO+")'>"
								 + "<img class='exh_poster' src='"+item.MAINPOSTER+"'/>"
								 + "<span class='art_info_aboutLoca InfoWhereWhen'>"+item.GALLERYNAME+" | "+item.LOCATION+"</span>"
								 + "<span class='art_mainTitle'>"+item.EXHIBITIONNAME+"</span>";
								
							if(item.PRICE != null && item.PRICE == 0){
								html += "<span class='art_info_aboutTime InfoWhereWhen'>"+item.EXHIBITIONNAME+" | FREE</span>";
							}
							else {
								html += "<span class='art_info_aboutTime InfoWhereWhen'>"+item.EXHIBITIONNAME+" | BOOK NOW</span>";
							}
							
							html += "</a>";
						}
						else {
							html += "<a class='exh_one' onclick='"+item.EXHIBITIONNO+"' style='margin-right: 0;'>"
								 + "<img class='exh_poster' src='"+item.MAINPOSTER+"'/>"
								 + "<span class='art_info_aboutLoca InfoWhereWhen'>"+item.GALLERYNAME+" | "+item.LOCATION+"</span>"
								 + "<span class='art_mainTitle'>"+item.EXHIBITIONNAME+"</span>";	
							
							if(item.PRICE != null && item.PRICE == 0){
								html += "<span class='art_info_aboutTime InfoWhereWhen'>"+item.EXHIBITIONNAME+" | FREE</span>";
							}
							else {
								html += "<span class='art_info_aboutTime InfoWhereWhen'>"+item.EXHIBITIONNAME+" | BOOK NOW</span>";
							}
					
							html += "</a>";
							html += "<br/>";
						}
					
					});
					
					$(".ExhList_Area").append(html);
					
/* 					$("#count").text( parseInt($("#count").text())+json.length ); // 초기치 0
					
					if( $("#count").text() == $("#totalCount").text() ){
						// 총 페이지를 다 본 경우
					} */
				}
	       }, 
	        error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
	    });
		
	}
	
	function exhDetail(eno){
		location.href="<%= ctxPath%>/exhDetail.at?eno=";
	}

</script>
<%-- EXHIBITION LIST SCRIPT END --%>


<div id="container_exhibition">
	<div class="Title_Area">
		<span class="st">WHAT'S ON</span>
		<span class="lt">EXHIBITIONS</span>
	</div>
	
	<div class="ExhCategory_Area">
		<div class="cate_exh categoryList">
			<a href="?" class="exh_cate_option on">전체</a>
			<a href="?type=ing&area=" class="exh_cate_option">진행중인 전시회</a>
			<a href="?type=exp&area=" class="exh_cate_option">예정전시</a>
			<a href="?type=end&area=" class="exh_cate_option">지난전시</a>
		</div>
		
		<div class="cate_map categoryList">
			<a href="?type=" class="exh_cate_option on">지역 전체</a>
			<a href="?type=&area=0" class="exh_cate_option"></a>
			<a href="?type=&area=1" class="exh_cate_option">서울</a>
			<a href="?type=&area=2" class="exh_cate_option">경기 인천</a>
			<a href="?type=&area=3" class="exh_cate_option">부산 울산 경남</a>
			<a href="?type=&area=4" class="exh_cate_option">대구 경북</a>
			<a href="?type=&area=5" class="exh_cate_option">광주 전라</a>
			<a href="?type=&area=6" class="exh_cate_option">대전 충청 세종</a>
			<a href="?type=&area=7" class="exh_cate_option">제주 강원</a>
		</div>
	</div>
	
	<div class="ExhList_Area">
	</div>
</div>
