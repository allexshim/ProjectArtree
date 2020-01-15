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
		margin: 30px 0 60px 0;
	}
	
	#container_gal_list .main_top {
		display: inline-block;
		width: 100%;
		margin: 0 0 50px 0;
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
	
	#container_gal_list .contents .thisCurExh img {
		display: inline-block;
		width: 29%;
		margin-right: 35px;
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
		margin: 0 5% 60px 0;
		text-align: left;
		text-decoration: none;
		transition: opacity 0.5s ease;
	}
	
	#container_gal_list .galArea .gal_one:hover {
		opacity: 0.7;
	}
	
	#container_gal_list .galArea .gal_one img {
		width: 100%;
		margin-bottom: 15px;
	}
	
	#container_gal_list .galArea .gal_one span {
		width: 100%;
		display: block;
		color: #000;
	}
	
	#container_gal_list .galArea .gal_one .galTitle { 
		font-size: 15pt; 
		font-weight: bold; 
		margin: 15px 0 8px 0;
	}

	#container_gal_list .Title_Area {
		width: 100%;
		display: inline-block; 
		text-align: center;
		margin: 100px 0 100px 0;
	}
	
	#container_gal_list .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
		color: #000;
	}
	
	#container_gal_list .carousel-inner {
		position: relative;
		height: 550px;
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
	
	
</style>  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<div id="container_gal_list" align="center">

	<div class="Title_Area">
		<span class="lt">GALLERY</span>
	</div>
	
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
			  		<div class="thisExhPoster">
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"></a>
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"></a>
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" style="margin-right: 0px;"></a>
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
			  		<div class="thisExhPoster">
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"></a>
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"></a>
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" style="margin-right: 0px;"></a>
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
			  		<div class="thisExhPoster">
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"></a>
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"></a>
				  		<a href=""><img src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg" style="margin-right: 0px;"></a>
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
		<a href="#" class="gal_one" onclick="exhDetail()">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<a href="#" class="gal_one" onclick="exhDetail()">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<a href="#" class="gal_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<br/>
		<a href="#" class="gal_one" onclick="exhDetail()">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<a href="#" class="gal_one" onclick="exhDetail()">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<a href="#" class="gal_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<br/>
		<a href="#" class="gal_one" onclick="exhDetail()">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<a href="#" class="gal_one" onclick="exhDetail()">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<a href="#" class="gal_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="mainImg" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png"/>
			<span class="galTitle">전북도립미술관 | 전북</span>
			<span class="galAddr">서울 강남구 도곡동 454-41</span>		
		</a>
		<br/>
	</div>
	
</div>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#searchText").keydown(function(event){
			
			if(event.keyCode == 13){
				goSearch();
			}
			
		});
		
		$("select[name=searchWhere]").change(function(){
			goSearch();
		});
		
	});
	
	function goSearch(){
		
		var searchWhere = $("#searchWhere").val();
		var searchText = $("#searchText").val().trim();

		if ( searchWhere == '' && searchText == ''){
			alert("검색어를 입력 후 다시 시도해주세요.");
			return;
		}
		
		var formData = $("form[name=searchGalFrm]").serialize();		
			
			$.ajax({
				
				url: "<%= ctxPath%>/galList.at",
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
			});		
		
	}// end of goSearch() ---------


</script>
