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
		font-size: 30pt;
		margin: 30px 0 60px 0;
	}
	
	#container_gal_list .main_top {
		display: inline-block;
		width: 100%;
		margin: 0 0 50px 0;
	}
	
	<%-- slider start --%>
	#container_gal_list .mySlides {	display: none; height: 500px; width: 100%;}
	#container_gal_list img { 
		vertical-align: middle; 
		width: 50%;
		float: left;
		height: 100%;
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
	
	#container_gal_list .contents .recom_info { margin: 20px 0 50px 0;}
	
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
	
	#container_gal_list .slideshow-container {
	  width: 100%; 
	  position: relative;
	  margin: auto;
	  display: inline-block;
	}
	
	#container_gal_list .numbertext {
		display: none;	  
	}
	
	#container_gal_list .dot {
	  height: 10px;
	  width: 10px;
	  margin: 40px 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}
	
	#container_gal_list .active {
	  background-color: #717171;
	}
	
	#container_gal_list .fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 3s;
	  animation-name: fade;
	  animation-duration: 3s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	@keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	<%-- slider end --%>
	
	#container_gal_list .searchArea {
		display: inline-block;
		width: 100%;
		margin: 50px 0 100px 0;
	}
	
	#container_gal_list .searchArea select {
		width: 15%;
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
		width: 53%;
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
		transition: opacity 1s ease;
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

	
</style>  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">


	
</script>

<div id="container_gal_list" align="center">

	<span class="main_title">이번주 추천 공간</span>
	<%-- -------------------------------------슬라이드쇼 영역 --%>

	<div class="main_top">
		<div class="slideshow-container">
			<div class="mySlides fade" align="center">
			  <div class="numbertext">1 / 3</div>
			  <img class="slideView" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png">
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
			
			<div class="mySlides fade">
			  <div class="numbertext">2 / 3</div>
			  <img class="slideView" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png">
			  <div class="contents">
			  	<span class="recom_title">아라리오뮤지엄 탑동시네마|제주</span>
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
			
			<div class="mySlides fade">
			  <div class="numbertext">3 / 3</div>
			  <img class="slideView" src="<%= ctxPath%>/resources/images/exhibition/챕터투.png">
			  <div class="contents">
			  	<span class="recom_title">더가든팩토리|경기</span>
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
		<br>
		<div style="text-align:center">
		  <span class="dot"></span> 
		  <span class="dot"></span> 
		  <span class="dot"></span> 
		</div>
	</div>

	<div class="searchArea">
		<form name="">
			<select name="searchWhere" id="searchWhere">
				<option>지역전체</option>
				<option>서울</option>
				<option>경기 인천</option>
				<option>부산 울산 경남</option>
				<option>대구 경북</option>
				<option>광주 전라</option>
				<option>대전 충청 세종</option>
				<option>제주 강원</option>
			</select>
			<select name="searchPlaceType" id="searchPlaceType">
				<option>공간전체</option>
				<option>미술관</option>
				<option>박물관</option>
				<option>갤러리</option>
				<option>복합문화공간</option>
				<option>대안공간</option>
				<option>창작 스튜디오</option>
			</select>
			<div class="inputText">
				<input type="text" name="searchText" id="searchText" placeholder="전시회 검색???"/>
				<img class="icoForSearch" onclick="" src="<%= ctxPath%>/resources/images/exhibition/ico/ico_search.png">
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
		
		
	});

	<%-- select works slider start --%>
	var slideIndex = 0;
	showSlides();

	function showSlides() {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	  setTimeout(showSlides, 3000);
	}
	<%-- select works slider end --%>

</script>
