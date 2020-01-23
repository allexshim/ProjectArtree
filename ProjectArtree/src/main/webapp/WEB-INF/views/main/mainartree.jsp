<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
   
 body::-webkit-scrollbar { 
    display: none; 
}
   
   .main-container { 
   		margin: 0 auto;
   		padding-top: 100px;
   		width: 80%;
   		 
   }
   
  .hot-exh-L {
  		-webkit-transform:translate(100px, 0);
  		margin-top: 50px;
  		float: left;
  		text-align: center;
		display: inline-block;
		width: 70%; 
		height: 500px; 
		border: solid 1px #e6e6e6;
	}
	
	.hot-img1 {
		float: left; 
		width: 50%; 
		height: 100%;
	}

	.hot-info1 {
		float: right; 
		width: 50%;
		height: 100%
		text-align: center; 
		padding: 10% 5% 0 5%;
	}
	
	.recom-info {
		float: right; 
		width: 50%;
		height: 100%
		text-align: center; 
		padding: 15% 5% 0 5%;
	}
	
	.hot-exh-R {
		margin-top: 50px;
		-webkit-transform:translate(300px, 0);
  		text-align: center;
		display: inline-block;
		width: 70%; 
		height: 500px; 
		border: solid 1px #e6e6e6;
	}
	
	.hot-img2 {
		float: right; 
		width: 50%; 
		height: 100%;
	}

	.hot-info2 {
		float: left; 
		width: 50%; 
		height: 100%
		text-align: center; 
		padding: 10% 5% 0 5%;
	}
	
	.hot-title {
		display: block; 
		font-size: 20pt; 
		font-weight: bold;
	}
	
	.hot-content {
		display: block; 
		font-size: 15pt; 
		font-weight: bold; 
		margin: 20px 0 0 0;
	}
	
	
	
	
	.recom-exh {
		-webkit-transform:translate(100px,0);
  		margin-top: 450px;
  		float: center;
  		text-align: center;
		display: inline-block;
		width: 85%; 
		height: 450px; 
		border: solid 1px #f2f2f2;
	}
	
	
	.slideshow {
	 
	  height: 450px;
	  position: relative;
	  margin: auto;
	}
	
	.mySlides { 
	  display: none;
	}
	
	.active1 {
		background-color: black;
	}
	
	.slide-img { 
		width: 35%;
		height: 450px;
	}

	
	.event-div {
		text-align: center;
		position:relative;
	    display: -webkit-flex;
	    display: flex;
	    -webkit-justify-content: center;
	    justify-content: center;
	    -webkit-align-items: center;
	    align-items: center; 
		width: 100%;
		height: 400px;
	}
	
	.event_one {
		flex: 1;
		width: 25%;
		height: 100%;
	}
	
	.event_poster {
		width: 250px;
		height: 350px;
	}
	
	.recom-info {
		width: 100%;
	}
	
	.event-title {
		margin-top: 200px;
	}
	
	.new-exh {
		-webkit-transform:translate(0,200px);
		text-align: center;
		position:relative;
	    display: -webkit-flex;
	    display: flex;
	    -webkit-justify-content: center;
	    justify-content: center;
	    -webkit-align-items: center;
	    align-items: center; 
		width: 100%;
		height: 400px;
	}
	
	.end-exh {
		margin-top: 350px;
		text-align: center;
		position:relative;
	    display: -webkit-flex;
	    display: flex;
	    -webkit-justify-content: center;
	    justify-content: center;
	    -webkit-align-items: center;
	    align-items: center; 
		width: 100%;
		height: 400px;
	}
	
	.new-one {
		
		text-align: center;
		display: block;
		flex: 1;
		width: 33%;
		height: 100%;
	}
	
	.end-one {
		
		text-align: center;
		display: block;
		flex: 1;
		width: 33%;
		height: 100%;
	}
	
	.new_poster {
		width: 300px;
		height: 350px;
	}
	
	.end_poster {
		width: 300px;
		height: 350px;
	}
	
	.new-exp {
		display: block;
		margin: 10px;
	}
	
	.end-exp {
		display: block;
		margin: 10px;
	}
	
	.event-morebtn {
		cursor: pointer;
		color: black;
	}
	
	.event-morebtn:hover {
		text-decoration: none;
		color: black;
	}
	
	.return-top {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	.return-top:hover {
		color: black;
		text-decoration: none;
	}
	
   
</style>
	
<script type="text/javascript">

$(".return-top").hide(); // 탑 버튼 숨김
$(function () {
            
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
			$('.navigation').fadeIn();
		} else {
			$('.navigation').fadeOut();
		}
	});
           
	$('.return-top').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 800);  // 탑 이동 스크롤 속도
		return false;
	});
	
	$(".tabContent").on("click", function (e) {
		e.preventDefault();//anchor이벤트의 기본동작을 막는다.
		var thisTarget = $(this).attr("href");
		$(window).scrollTop($(thisTarget).offset().top);
	});
	
	$(".hot-info1").hover(function(){
		$(this).find(".hot-content").stop().animate({left:'5px'}, 'fast');

	}, function(){
		$(this).find(".hot-content").stop().animate({left:'0px'}, 'fast');
	});
	
});

var ovf, slider;

$(function(){
    ovf = this.getElementById("overflow");
    slider = this.getElementById("slider");
    winResize();
    $(window).bind({resize: winResize, scroll: winScroll});
});

function winResize(){  
    ovf.style.top = slider.offsetHeight + "px";
}

function winScroll(){
    var op = 1 - (window.pageYOffset / slider.offsetHeight);
    slider.style.opacity = op; 
}
	

	
	

</script>
   
    

	<div id="slider" style="width: 100%; height: 800px; display: inline-block;">
       	<div style="background-size: cover; width:100%; height:100%; z-index:1000; margin-top:0; background-image: url('<%= ctxPath%>/resources/images/main/mainImg1.jpg')">
       		 <div class="main-logo" style="z-index: 5; width: 400px; height: 300px;">
       			<img style="-webkit-transform:translate(270px,330px);" alt="로고이미지" src="<%= ctxPath%>/resources/images/main/logo_black_new.png" />
       		 </div>
       	</div>
	</div>
	
	
	<div id="overflow" class="main-container" style="margin-bottom: 500px;">
		<div class="hot-exh">
			<div id="div1" style="float:center; margin:0 auto; transform:translate(100px,20px);">
				<h2>인기 전시회</h2>
			</div>
			<div class="hot-exh-L">
				<a href="#"><img class="hot-img1" src="<%= ctxPath%>/resources/images/exhibition/poster1.JPG"></a>
				<div class="hot-info1">
					<span class="hot-title">전시회명</span>
					<span class="hot-content">작가명</span>
					<span class="hot-content">전시위치</span>
					<span class="hot-content">2020-01-20~2020-01-22</span>
				</div>
			</div>
			
			<div class="hot-exh-R">
				<div class="hot-info2">
					<span class="hot-title">전시회명</span>
					<span class="hot-content">작가명</span>
					<span class="hot-content">전시위치</span>
					<span class="hot-content">2020-01-20~2020-01-22</span>
				</div>
				<a href="#"><img class="hot-img2" src="<%= ctxPath%>/resources/images/exhibition/poster2.JPG"></a>
			</div>
			
			<div class="hot-exh-L">
				<a href="#"><img class="hot-img1" src="<%= ctxPath%>/resources/images/exhibition/poster3.JPG"></a>
				<div class="hot-info1">
					<span class="hot-title">전시회명</span>
					<span class="hot-content">작가명</span>
					<span class="hot-content">전시위치</span>
					<span class="hot-content">2020-01-20~2020-01-22</span>
				</div>
			</div>
		</div>
		
	<hr color="#f2f2f2;" style="transform:translate(0,700px);" />
	
	<div class="recom-exh">	
		
		<div class="recom-exhList">
			<div class="slideshow">
			  <div class="mySlides">
			    
			    <a href="#"><img class="slide-img" src="<%= ctxPath%>/resources/images/exhibition/poster2.JPG"></a>
			    	<div class="hot-info1" style="padding-top: 10%;">
						<span class="hot-title">전시회명</span>
						<span class="hot-content">작가명</span>
						<span class="hot-content">전시위치</span>
						<span class="hot-content">2020-01-20~2020-01-22</span>
					</div>
			  </div>
			  
			  <div class="mySlides">
			    <a href="#"><img class="slide-img" src="<%= ctxPath%>/resources/images/exhibition/poster1.JPG"></a>
			   		<div class="hot-info1" style="padding-top: 10%;">
						<span class="hot-title">전시회명</span>
						<span class="hot-content">작가명</span>
						<span class="hot-content">전시위치</span>
						<span class="hot-content">2020-01-20~2020-01-22</span>
					</div>
			  </div>
			
			  <div class="mySlides">
			    <a href="#"><img class="slide-img" src="<%= ctxPath%>/resources/images/exhibition/poster2.JPG"></a>
			    	<div class="hot-info1" style="padding-top: 10%;">
						<span class="hot-title">전시회명</span>
						<span class="hot-content">작가명</span>
						<span class="hot-content">전시위치</span>
						<span class="hot-content">2020-01-20~2020-01-22</span>
					</div>
			  </div>
			  
			  <div class="mySlides">
			    <a href="#"><img class="slide-img" src="<%= ctxPath%>/resources/images/exhibition/poster3.JPG"></a>
			    	<div class="hot-info1" style="padding-top: 10%;">
						<span class="hot-title">전시회명</span>
						<span class="hot-content">작가명</span>
						<span class="hot-content">전시위치</span>
						<span class="hot-content">2020-01-20~2020-01-22</span>
					</div>
			  </div>
			
			</div>
			
			<div id="div2" class="recom-exh-title" style="float: center; transform:translate(0,-580px);">
				<h2>추천 전시회</h2>
				<span>ARTREE 추천전시회를 보여줍니다.</span>
			</div>
			
			<div style="text-align:center; display: none;">
			  <span class="dot"></span>
			  <span class="dot"></span>
			  <span class="dot"></span>
			  <span class="dot"></span>
			</div>
		</div>
	</div>
	
	<hr color="#f2f2f2;" style=" transform:translate(0, 100px);" />

	
	<div class="newNend">
		<div id="div3" class="new-title" style="float: left; -webkit-transform:translate(58px, 180px);">
			<h2>신규 전시회</h2>
		</div>
		<hr color="black;" style="width:90%; transform:translate(62px,245px);" />
		<div class="new-exh">
			<a href="#" class="new-one">
				<img class="new_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
				<span class="new-exp">전시회명</span>
				<span class="new-exp">전시기간</span>
				<span class="new-exp">전시작가</span>
			</a>
			
			<a href="#" class="new-one">
				<img class="new_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
				<span class="new-exp">전시회명</span>
				<span class="new-exp">전시기간</span>
				<span class="new-exp">전시작가</span>
			</a>
			
			<a href="#" class="new-one">
				<img class="new_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
				<span class="new-exp">전시회명</span>
				<span class="new-exp">전시기간</span>
				<span class="new-exp">전시작가</span>
			</a>
		</div>
		
		<div id="div4" class="new-title" style="float: right; -webkit-transform:translate(-58px, 370px);">
			<h2>종료임박 전시회</h2>
		</div>
		<hr color="black;" style="width:90%; transform:translate(64px,420px);" />
		<div class="end-exh" style="transform:translate(0, 90px);">
			<a href="#" class="end-one">
				<img class="end_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
				<span class="end-exp">전시회명</span>
				<span class="end-exp">전시기간</span>
				<span class="end-exp">전시작가</span>
			</a>
			
			<a href="#" class="end-one">
				<img class="end_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
				<span class="end-exp">전시회명</span>
				<span class="end-exp">전시기간</span>
				<span class="end-exp">전시작가</span>
			</a>
				
			<a href="#" class="end-one">
				<img class="end_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
				<span class="end-exp">전시회명</span>
				<span class="end-exp">전시기간</span>
				<span class="end-exp">전시작가</span>
			</a>
		</div>
	</div>
	
	<hr color="#f2f2f2;" style="transform:translate(0, 250px);" />
	
	
	<div id="div5" class="event-title" style=" float: left; transform:translate(35px, 180px);">
		<h2>EVENT</h2>
	</div>
	<div class="event-more" style="float: right; transform:translate(-35px, 420px);">
		<a class="event-morebtn" href="<%= ctxPath%>/eventList.at">더보기+</a>
	</div>
	<hr color="black;" style="width:94%; transform:translate(38px,445px);" />
       	<div class="event-div" style="transform:translate(0, 200px);">
           	<a href="#" class="event_one" >
				<img class="event_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			</a>
			<a href="#" class="event_one" >
				<img class="event_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			</a>
			<a href="#" class="event_one" >
				<img class="event_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			</a>
			<a href="#" class="event_one" >
				<img class="event_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			</a>
       	</div>

</div>

<div class="navigation" style="display: block; right:50px; bottom: 20%; position:fixed; z-index:9999;">
	<a class="return-top" href="#">[TOP]</a>
</div>
<script type="text/javascript">

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
	  setTimeout(showSlides, 3000); // Change image every 2 seconds
	}


</script>