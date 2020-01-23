<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">

	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	#container_gal_list {
		font-family: 'Noto Sans Kr', sans-serif;
		margin: 0 auto;
		width: 70%;
	}
	
	#container_gal_list .main_title {
		display: inline-block;
		width: 100%;
		text-align: center;
		font-weight: bold;
		font-size: 25pt;
		margin: 0px 0 60px 0;
	}
	
	#container_gal_list .main_top {
		display: inline-block;
		width: 100%;
		margin: 0 0 50px 0;
		height: 500px;
	}
	
	<%-- slider start --%>
	#container_gal_list .mainGalImg { 
		vertical-align: middle; 
		width: 50%;
		float: left;
		height: 100%;
		padding-bottom: 40px;
	}
	
	#container_gal_list .contents {
		width: 50%;
		float: right;
		text-align: left;
		padding: 20px 0 20px 40px;
		height: 100%;
	}
	
	#container_gal_list .contents .recom_title {
		font-size: 20pt;
		font-weight: bold;
		width: 100%;
		display: inline-block;
	}
	
	#container_gal_list .contents .recom_info { margin: 40px 0 50px 0;}
	
	#container_gal_list .contents .recom_info span {
		width: 100%;
		display: inline-block;
		font-size: 12pt;
		line-height: 150%;
	}
	
	#container_gal_list .contents .thisCurExh span {
		font-size: 13pt;
		font-weight: bold;
		margin-bottom: 15px;
		width: 100%;
		display: inline-block;
	}
	
	#container_gal_list .searchArea {
		display: inline-block;
		width: 100%;
		margin: 100px 0 150px 0;
	}
	
	#container_gal_list .searchArea select {
		width: 20%;
		display: inline-block;
		margin-right: 5%;
		font-size: 15pt;
		border: none;
		height: 50px;
		border-bottom: solid 2px #444;
	}
	
	#container_gal_list .searchArea input {
		display: inline-block;
		height: 45px;
		border: none;
		width: 95%;
		font-size: 15pt;
		padding-left: 10px;
		background-color: white;
	}
	
	#container_gal_list .searchArea img {
		display: inline-block;
		width: 5%;
		float: right;
		cursor: pointer;
	}
	
	#container_gal_list .inputText {
		border-bottom: solid 2px #444;
		display: inline-block;
		width: 70%;
	}
	
	#container_gal_list .galArea {
		display: inline-block;
		width: 100%;
	}
	
	#container_gal_list .galArea .gal_one {
		display: inline-block;
		width: 28%;
		margin: 0 5% 80px 0;
		text-align: left;
		text-decoration: none;
		height: 350px;
		position: relative;
		cursor: pointer;
	}

	#container_gal_list .galArea .gal_one img {
		width: 100%;
		height: 200px;
		margin-bottom: 15px;
	}
	
	#container_gal_list .galArea .gal_one span {
		width: 100%;
		display: block;
		color: #000;
	}
	
	#container_gal_list .galArea .gal_one .galAddr { 
		font-size: 9pt; 
		margin-bottom: 5px;
	}
	
	#container_gal_list .galArea .gal_one .galInfo { 
		display: table-cell; 
		font-weight: 500; 
	}
	
	#container_gal_list .galArea .gal_one .galTitle { 
		font-size: 15pt; 
		font-weight: bold; 
		margin: 15px 0 5px 0;
		position: relative;
	}

	#container_gal_list .Title_Area {
		width: 100%;
		display: inline-block; 
		text-align: center;
		margin: 200px 0 200px 0;
	}
	
	#container_gal_list .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
		color: #000;
	}
	
	#container_gal_list .carousel-inner {
		position: relative;
		height: 500px;
	}
	
	#container_gal_list .carousel-inner .item {
		height: 100%;
	}
	
	#container_gal_list .carousel-control {
		background-image: none;
	}
	
	#container_gal_list .carousel-indicators {
	  display: block;
	  bottom: -30px;
	  color: #bbb;
	}
	
	#container_gal_list .carousel-indicators li {    
	  background-color: #cbcbcb;
	  margin-right: 5px;
	  margin-left: 5px;
	}
	
	#container_gal_list .carousel-indicators .active {
	  background-color: #737373;
	}

	#container_gal_list .contents .thisCurExh img {
		display: inline-block;
		width: 25%;
		margin-right: 35px;
		height: 200px;
	}
	
	
	
	
	
	.thisCurExh ul,li{list-style:none;}
    .exhSlide{overflow:hidden;}
    .exhSlide ul{width:calc(100% * 2);display:flex;animation:exhSlide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .exhSlide li{width:calc(100% / 2);height:200px;}
    @keyframes exhSlide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */ 
/*       50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;} */
      100% {margin-left:0;}
    } 
 
</style>  

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		/////////////// 스크롤 페이징
		var page = 1;
		getGalList(page);
	    /////////////// 이번주 추천 공간
	    getGalRecomList;

		$(document).on("mouseover", ".gal_one", function(){
			$(this).find(".galTitle").stop().animate({bottom:'5px'}, 180);
		});
		
		$(document).on("mouseout", ".gal_one", function(){
			$(this).find(".galTitle").stop().animate({bottom:'0px'}, 180);
		});
		
		
		$("#searchText").keydown(function(event){
			
			if(event.keyCode == 13){
				goSearch();
			}
			
		});
		
		$("select[name=searchWhere]").change(function(){
			goSearch();
		});
		
		$("#count").hide();
		$("#tc").hide();
		
		var type="";
		var loca="";
	    
	    // 스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		$(window).scroll(function(){   
		    if($(window).scrollTop() >= $(document).height() - $(window).height()){
		    	 page++; 
		    	 getGalList(page);
		    } 
		});
	    
	}); // end of document ready ---------------
	
	/////////////////// 이번주 추천 공간 불러오기 //////////////////
	function getGalRecomList(){
		
		$.ajax({
			url: "<%=ctxPath%>/galRecomList.at",
			dataType: "JSON",
			success:function(json){
				
				var html = "";
				
				if(json.length == 0){
					html += "<span style='text-align:center;'>준비중입니다 :></span>";
					$(".carousel-inner").html(html);
				}
				else {
					
					$.each(json, function(index, item){
						
						if(index == 0){
							// item active
						}
						else {
							// item
						}
						
					});
					
					$(".carousel-inner").append(html);
					
				} // end of if ~ else ----------------
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		})
		
	}
	
	
	var len = 9;
	////////////////// 갤러리 목록 불러오기 /////////////////////
	function getGalList(page){

		$.ajax({
			url: "<%=ctxPath%>/galList.at",
			data: {"page":page, "len":len},
			dataType: "JSON",
			success:function(json){
				
				var html = "";
				
				if(json.length == 0){
					
					html += "<span style='text-align:center;'>준비중입니다 :></span>";
					
					$(".galArea").html(html);

				}
				else {

					$.each(json, function(index, item){
					
						if( (index+1)%3 != 0){
							
							html += "<a class='gal_one' onclick='galDetail("+item.GALLERYNO+")'>"
								 + "<img class='mainImg' src='"+item.MAINPICTURE+"'/>"
								 + "<span class='galTitle'>"+item.GALLERYNAME+" | "+item.LOCATION+"</span>"
								 + "<span class='galAddr'>"+item.DETAILADDRESS+"</span>";
							
						  if(item.INTRODUCTION != null){
							html += "<span class='galInfo'>"+item.INTRODUCTION+"</span>";
						  }
							html += "</a>";
							
						}
						else {
							
							html += "<a class='gal_one' onclick='galDetail("+item.GALLERYNO+")' style='margin-right: 0;'>"
							 + "<img class='mainImg' src='"+item.MAINPICTURE+"'/>"
							 + "<span class='galTitle'>"+item.GALLERYNAME+" | "+item.LOCATION+"</span>"
							 + "<span class='galAddr'>"+item.DETAILADDRESS+"</span>";
							
						  if(item.INTRODUCTION != null){
							html += "<span class='galInfo'>"+item.INTRODUCTION+"</span>";
						  }
							html += "</a><br/>";							
						}
						
						$("#tc").text(item.totCount);
						
					});
					
					
					$(".galArea").append(html);
					
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
	
	function goSearch(){
		
		var searchWhere = $("#searchWhere").val();
		var searchText = $("#searchText").val().trim();

		if ( searchWhere == '' && searchText == ''){
			alert("검색어를 입력 후 다시 시도해주세요.");
			return;
		}
		
		/* var formData = $("form[name=searchGalFrm]").serialize();		
			
			$.ajax({
				
				url: "",
				data: formData,
				type: "GET",
				dataType: "JSON",
				success:function(json){
					
					var html = "";
					
					$.each(json, function(){
						
						
						
					});
					
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});		 */
		
	}// end of goSearch() ---------
	
	function galDetail(gno){
		location.href="<%=ctxPath%>/galDetail.at?gno="+gno;
	}

</script>

<div id="container_gal_list" align="center">

	<div class="Title_Area">
		<span class="lt">GALLERY</span>
	</div>
	<span id="count">0</span>
	<span id="tc"></span>
	<span class="main_title">이번주 추천 공간</span>

	
	<div class="main_top">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	      <div class="item active">
	        <a href=""><img class="mainGalImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"></a>
	        <div class="contents">			  	
			  	<span class="recom_title">스튜디오퓨어파이브|부산</span>
			  	<div class="recom_info">
			  		<span style="color: red;">현재 전시중</span>
			  		<span>휴관일 월요일</span>
			  		<span>운영시간 10:00 - 18:00</span>
			  	</div>
			  	<div class="thisCurExh">
			  		<span>진행중 전시회</span>
					<div class="exhSlide">
						<ul>
						  <li><img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/poster1.JPG"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/></li>
						  <li><img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/></li>
						</ul>
					</div>
				 </div>
			  </div>
	      </div>
	
	      <div class="item">
	        <a href=""><img class="mainGalImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"></a>
	        <div class="contents">			  	
			  	<span class="recom_title">스튜디오퓨어파이브|부산</span>
			  	<div class="recom_info">
			  		<span style="color: red;">현재 전시중</span>
			  		<span>휴관일 월요일</span>
			  		<span>운영시간 10:00 - 18:00</span>
			  	</div>
			  	<div class="thisCurExh">
			  		<span>진행중 전시회</span>
					<div class="exhSlide">
						<ul>
						  <li><img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/></li>
						</ul>
					</div>
			  	</div>
			 </div>
	      </div>
	    
	      <div class="item">
	        <a href=""><img class="mainGalImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"></a>
	        <div class="contents">			  	
			  	<span class="recom_title">스튜디오퓨어파이브|부산</span>
			  	<div class="recom_info">
			  		<span style="color: red;">현재 전시중</span>
			  		<span>휴관일 월요일</span>
			  		<span>운영시간 10:00 - 18:00</span>
			  	</div>
			  	<div class="thisCurExh">
			  		<span>진행중 전시회</span>
					<div class="exhSlide">
						<ul>
						  <li><img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/poster1.JPG"/>
						  <img src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/></li>
						</ul>
					</div>
			  	</div>
			 </div>
	      </div>
	    </div>
	  </div>
	</div>
		

	<div class="searchArea">
		<form name="searchGalFrm">
			<select name="searchWhere" id="searchWhere">
				<option value="">지역전체</option>
				<option value="서울">서울</option>
				<option value="경기 인천">경기 인천</option>
				<option value="부산 울산 경남">부산 울산 경남</option>
				<option value="대구 경북">대구 경북</option>
				<option value="광주 전라">광주 전라</option>
				<option value="대전 충청 세종">대전 충청 세종</option>
				<option value="제주 강원">제주 강원</option>
			</select>
			<div class="inputText">
				<input type="text" name="searchText" id="searchText" placeholder="전시회 검색???"/>
				<img class="icoForSearch" onclick="goSearch()" src="<%= ctxPath%>/resources/images/exhibition/ico/ico_search.png">
			</div>
		</form>
	</div>
	
	<div class="galArea">
	</div>
	
</div>