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
		width: 100%;
		margin-top: 100px;
	}
	
	#container_exhibition .ExhList_Area a {
		text-decoration: none;
		color: #0d0d0d;
		cursor: pointer;
		display: inline-block;
		width: 22%;
		height: 600px;
		margin-right: 3.7%;
		margin-top: 40px;
		border: solid 1px #e6e6e6;
		position: relative;
	}
	
	#container_exhibition .ExhList_Area a img {
		width: 100%;
		height: 350px;
		margin-bottom: 20px;
	}
	
	#container_exhibition .ExhList_Area .artInfoArea {
		padding: 0px 10px 0 10px;
		width: 100%;
		height: 250px;
		display: table-cell;
	}
	
	#container_exhibition .ExhList_Area a .art_mainTitle {
		display: inline-block;
		font-size: 16pt;
		font-weight: bold;
		margin: 3px 0 3px 0;
	}
	
	#container_exhibition .ExhList_Area a .InfoWhereWhen {
		display: block;
		font-size: 10pt;
	} 
	
	#container_exhibition .ExhList_Area a .forMoving {
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
		
		$("#count").show();
		$("#tc").show();
		
		var type="";
		var loca="";
		
		/////////////// 스크롤 페이징
		var page = 1;
		getExhList(page);
	    ///////////////
	    
	    // 스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		$(window).scroll(function(){   
		    if($(window).scrollTop() >= $(document).height() - $(window).height()){
		    	 page++; 
		    	 getExhList(page);
		    } 
		});
	    
		$(document).on("mouseover", ".exh_one", function(){
			$(this).find(".forMoving").stop().animate({top:'10px'}, 180);
		});
		
		$(document).on("mouseout", ".exh_one", function(){
			$(this).find(".forMoving").stop().animate({top:'0px'}, 180);
		});
		
	}); // end of document ready -------------------------

	var len = 16;
	
	////////////////// 전시회 목록 불러오기 /////////////////////
	function getExhList(page){

		$.ajax({
			url: "<%=ctxPath%>/exhList.at",
			data: {"page":page, "len":len},
			dataType: "JSON",
			success:function(json){
				
				var html = "";
				
				if(json.length == 0){
					
					html += "<span style='text-align:center;'>준비중입니다 :></span>";
					
					$(".ExhList_Area").html(html);

				}
				else {

					$.each(json, function(index, item){
					
						if( (index+1)%4 != 0){				
							
							html += "<a class='exh_one' onclick='exhDetail("+item.EXHIBITIONNO+")'>"
								 + "<img class='exh_poster' src='"+item.MAINPOSTER+"'/>"
								 + "<div class='artInfoArea'>"
								 + "<span class='art_info_aboutLoca InfoWhereWhen'>"+item.GALLERYNAME+" | "+item.LOCATION+"</span>"
								 + "<span class='art_mainTitle'>"+item.EXHIBITIONNAME+"</span>";
							if(item.PRICE == 0){
								html += "<span class='forMoving InfoWhereWhen'>"+item.SCHEDULE+" | FREE</span>";
							}
							else {
								html += "<span class='forMoving InfoWhereWhen'>"+item.SCHEDULE+" | BOOK</span>";
							}
							
							html += "</div></a>";
							
						}
						else {
							
							html += "<a class='exh_one' style='margin-right:0px;' onclick='exhDetail("+item.EXHIBITIONNO+")'>"
							 	 + "<img class='exh_poster' src='"+item.MAINPOSTER+"'/>"
							  	 + "<div class='artInfoArea'>"
							  	 + "<span class='art_info_aboutLoca InfoWhereWhen'>"+item.GALLERYNAME+" | "+item.LOCATION+"</span>"
							 	 + "<span class='art_mainTitle'>"+item.EXHIBITIONNAME+"</span>";
						if(item.PRICE == 0){
							html += "<span class='forMoving InfoWhereWhen'>"+item.SCHEDULE+" | FREE</span>";
						}
						else {
							html += "<span class='forMoving InfoWhereWhen'>"+item.SCHEDULE+" | BOOK</span>";
						}
						
						html += "</div></a><br/>";
							
						}
						
						$("#tc").text(item.totCount);
						
					});
					
					
					$(".ExhList_Area").append(html);
					
					/* // >>> (중요@@@@@@) 더보기... 버튼의 value 속성에 값을 지정하기 <<< //
					$("#btnMoreHIT").val(parseInt(start)+lenHIT);
					///////////////////// Integer.parseInt - javaScript에서는 Integer 객체가 없고 var로 타입이 결정되기 때문에 parseInt만 써주면 됨.
					///////////////////// java에서는 var가 없고 Integer 객체가 있기 때문에 Integer.parseInt를 해주는 것임 */
					
					//countHIT 에 지금까지 출력된 상품의 갯수를 누적해서 기록한다.
					$("#count").text( parseInt($("#count").text())+json.length ); // 초기치 0
					
					if( $("#count").text() == $("#tc").text() ){
						$("#count").text("0");
					}
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}
		
		
	function exhDetail(eno){
		location.href="<%= ctxPath%>/exhDetail.at?eno="+eno;
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
			<a href="javaScript:void(0)" onclick="getExhList(1, 'ing', 're');" class="exh_cate_option">진행중인 전시회</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 'exp', 're');" class="exh_cate_option">예정전시</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 'end', 're');" class="exh_cate_option">지난전시</a>
		</div>
		
		<div class="cate_map categoryList">
			<a href="?" class="exh_cate_option on">지역 전체</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '1');" class="exh_cate_option">서울</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '2');" class="exh_cate_option">경기 인천</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '3');" class="exh_cate_option">부산 울산 경남</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '4');" class="exh_cate_option">대구 경북</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '5');" class="exh_cate_option">광주 전라</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '6');" class="exh_cate_option">대전 충청 세종</a>
			<a href="javaScript:void(0)" onclick="getExhList(1, 're', '7');" class="exh_cate_option">제주 강원</a>
		</div>
	</div>
	
	<span id="count">0</span>
	<span id="tc"></span>
	
	<div class="ExhList_Area">
	</div>
</div>
