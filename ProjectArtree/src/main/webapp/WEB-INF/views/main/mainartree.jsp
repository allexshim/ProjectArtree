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
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

<style type="text/css">
   
 body::-webkit-scrollbar { 
 /*    display: none;  */
}
   
   .btn {
   		text-align: center;
		font-weight: bold;
		background-color: #f2f2f2;
		border: none;
		border-radius: 2px;
		margin-top: 30px;
	}
	
	.moreBtn {
		margin-bottom: 10px;
		font-size: 18pt;
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
		height: 100%;
		text-align: center; 
		padding: 10% 5% 0 5%;
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
	
	.recom-a:hover {
		color: black;
		text-decoration: none;
	}
	
	
	.recom-exh {
		-webkit-transform:translate(100px,0);
		margin-top: 450px;
  		float: center;
  		text-align: center;
		display: inline-block;
		width: 85%; 
		height: 550px;
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
		width: 90%;
		height: 350px;
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
	
	.event_one span:hover{
		text-decoration: none;
		cursor: pointer;
	}
	
	.event_one:hover {
		text-decoration: none;
		cursor: pointer;
	}
	
	.event_poster {
		width: 250px;
		height: 350px;
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
		cursor: pointer;
		text-align: center;
		display: block;
		flex: 1;
		width: 33%;
		height: 100%;
	}
	
	.new-one:hover {
		text-decoration: none;
		color: black;
	}
	
	.end-one {
		cursor: pointer;
		text-align: center;
		display: block;
		flex: 1;
		width: 33%;
		height: 100%;
	}
	
	.end-one:hover {
		text-decoration: none;
		color: black;
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
		text-decoration: none;
		color: black;
		position: relative;
		display: block;
		margin: 10px;
	}
	
	.new-exp:hover {
		text-decoration: none;
		color: black;
	}
	
	.end-exp {
		text-decoration: none;
		color: black;
		position: relative;
		display: block;
		margin: 10px;
	}
	
	.end-exp:hover {
		text-decoration: none;
		color: black;
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
	
	#mysideinfo {
		display: none;
	}
	
	.flash:hover {
		cursor: pointer;
	}
	
	/* Flashing */
	.flash img:hover {
		cursor: pointer;
		opacity: 1;
		-webkit-animation: flash 1.5s;
		animation: flash 1.5s;
	}
	@-webkit-keyframes flash {
		0% {
			opacity: .4;
		}
		100% {
			opacity: 1;
		}
	}
	@keyframes flash {
		0% {
			opacity: .4;
		}
		100% {
			opacity: 1;
		}
	}
	
	
	/*  */
	.swiper-container {
		
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      top: 0;
      text-align: center;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: flex-start;
      align-items: flex-start;
    }
    
    .recom-title {
    	display: inline-block;
    	width: 90%;
    	margin-top: 10px;
    	font-size: 14pt;
    	text-decoration: none;
    	color: black;
    }
    
    .recom-content {
    	text-decoration: none;
		color: black;
		position: relative;
		display: block;
		margin: 10px;
    }
    
    .recom-title:hover {
    	text-decoration: none;
    	color: black;
    }
    
    .recom-content:hover {
    	text-decoration: none;
    	color: black;
    }
    
    .end-exp-title {
    	font-size: 14pt;
    }
    
    .new-exp-title {
    	font-size: 14pt;
    }
    
    
   
</style>
	
<script type="text/javascript">



$("#myheader").hide();
$(".navigation").hide(); // 탑 버튼 숨김
$(function () {
	
	$(document).on("mouseover", ".hover-left", function(){
		$(this).find(".forMoving").stop().animate({left:'10px'}, 180);
	});
	
	$(document).on("mouseout", ".hover-left", function(){
		$(this).find(".forMoving").stop().animate({left:'0px'}, 180);
	});
	
	$(document).on("mouseover", ".hover-top", function(){
		$(this).find(".forMoving").stop().animate({top:'10px'}, 180);
	});
	
	$(document).on("mouseout", ".hover-top", function(){
		$(this).find(".forMoving").stop().animate({top:'0px'}, 180);
	});
	
	$.ajax({
		url: "<%=ctxPath%>/getMostPolular.at",
		data: {},
		dataType: "JSON",
		success:function(json){
			
			var html = "";
			
			$.each(json, function(index, item){
				
				if(index == 1) {
					html += "<div class='hot-exh-R'>"
						 +		"<div class='hot-info2'>"
						 +			"<span class='hot-title'>"+item.exhibitionname+"</span>"
						 +			"<span class='hot-content'>"+item.author+"</span>"
						 +			"<span class='hot-content'>"+item.location+"/"+item.galleryname+"</span>"
						 +			"<span class='hot-content'>"+item.startdate+"~"+item.enddate+"</span>"
						 +			"<button type='button' class='moreBtn btn hover-left' onclick='exhDetail("+item.exhibitionno+")'>"
						 +					"자세히 보기"
						 +					"<img class='forMoving' style='position:relative;' src='<%=ctxPath%>/resources/images/exhibition/ico/right_arrow.png'>"
						 +			"</button>"
						 +		"</div>"
						 +		"<a class='flash' onclick='exhDetail("+item.exhibitionno+")'><img class='hot-img2' src='"+item.mainposter+"'></a>"
						 +	"</div>"
				}
				else {
					html += "<div class='hot-exh-L'>"
						 +		"<a class='flash' onclick='exhDetail("+item.exhibitionno+")'><img class='hot-img1' src='"+item.mainposter+"'></a>"
						 +		"<div class='hot-info1'>"
						 +			"<span class='hot-title'>"+item.exhibitionname+"</span>"
						 +			"<span class='hot-content'>"+item.author+"</span>"
						 +			"<span class='hot-content'>"+item.location+" / "+item.galleryname+"</span>"
						 +			"<span class='hot-content'>"+item.startdate+"~"+item.enddate+"</span>"
						 +			"<button type='button' class='moreBtn btn hover-left' onclick='exhDetail("+item.exhibitionno+")'>"
						 +					"자세히 보기"
						 +					"<img class='forMoving' style='position:relative;' src='<%=ctxPath%>/resources/images/exhibition/ico/right_arrow.png'>"
						 +			"</button>"
						 +		"</div>"
						 +	"</div>"
					
				}
					
					 
			});
			
			$(".hot-exh").append(html);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
	$.ajax({
		url: "<%=ctxPath%>/getPreference.at",
		data: {},
		dataType: "JSON",
		success:function(json){
			
			var html = "";
			
			$.each(json, function(index, item){
				
				html += "<div class='swiper-slide'>" 
					 + "<a class='recom-a flash hover-top' onclick='exhDetail("+item.exhibitionno+")'>"	
					 + "<img class='slide-img' src='"+item.mainposter+"'>"
					 + "<br/>"
					 + "<span class='recom-title'>"+item.exhibitionname+"</span>"
					 + "<span class='recom-content'>"+item.author+"</span>"
					 + "<span class='recom-content'>"+item.location+" / "+item.galleryname+"</span>"
					 + "<span class='recom-content'>"+item.startdate+"~"+item.enddate+"</span>"
					 + "</a>"
					 + "</div>"
			});
			
			$(".swiper-wrapper").append(html);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		},
		complete: function() {
			doInitializeSwiper();
		}
	});
	
	
	$.ajax({
		url: "<%=ctxPath%>/getNewest.at",
		data: {},
		dataType: "JSON",
		success:function(json){
			
			var html = "";
			
			$.each(json, function(index, item){
				
				html += "<a onclick='exhDetail("+item.exhibitionno+")' class='new-one flash hover-top'>"
					 +	"<img class='new_poster' src='"+item.mainposter+"' >"
					 +		"<span class='new-exp new-exp-title'>"+item.exhibitionname+"</span>"
					 +		"<span class='new-exp'>"+item.author+"</span>"
					 + 		"<span class='new-exp'>"+item.location+" / "+item.galleryname+"</span>"
					 +		"<span class='new-exp forMoving'>"+item.startdate+"~"+item.enddate+"</span>"
					 +	"</a>"
			});
			
			$(".new-exh").append(html);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
	
	$.ajax({
		url: "<%=ctxPath%>/getEndSoon.at",
		data: {},
		dataType: "JSON",
		success:function(json){
			
			var html = "";
			
			$.each(json, function(index, item){
				
				html += "<a onclick='exhDetail("+item.exhibitionno+")' class='end-one flash hover-top'>"
					 +	"<img class='end_poster' src='"+item.mainposter+"' >"
					 +		"<span class='end-exp end-exp-title'>"+item.exhibitionname+"</span>"
					 +		"<span class='end-exp'>"+item.author+"</span>"
					 + 		"<span class='end-exp'>"+item.location+" / "+item.galleryname+"</span>"
					 +		"<span class='end-exp forMoving'>"+item.startdate+"~"+item.enddate+"</span>"
					 +	"</a>"
			});
			
			$(".end-exh").append(html);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
	$.ajax({
		url: "<%=ctxPath%>/getNewEvent.at",
		data: {},
		dataType: "JSON",
		success:function(json){
			
			var html = "";
			
			$.each(json, function(index, item){
				
				html += "<a href='#' class='event_one flash hover-top'>"
					 +	"<img class='event_poster' src='"+item.mainPoster+"' >"
					 +		"<span class='end-exp'>"+item.eventName+"</span>"
					 +		"<span class='end-exp forMoving'>"+item.startDate+"~"+item.endDate+"</span>"
					 +	"</a>"
			});
			
			$(".event-div").append(html);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
		
	
	
            
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
			$("#myheader").fadeIn();
			$("#mysideinfo").fadeIn();
			$('.navigation').fadeIn();
		} else {
			$("#myheader").fadeOut();
			$("#mysideinfo").fadeOut();
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

function exhDetail(eno){
	location.href="<%= ctxPath%>/exhDetail.at?eno="+eno;
}



</script>


    

	<div id="slider" style="width: 100%; height: 800px; display: inline-block;">
       	<div style="background-size: cover; width:100%; height:100%; z-index:1000; margin-top:0; background-image: url('<%= ctxPath%>/resources/images/main/mainImg1.jpg')">
       		 <div class="main-logo" style="z-index: 5; width: 400px; height: 300px;">
       			<img style="width: 255px; height: 255px; -webkit-transform:translate(300px,350px);" alt="로고이미지" src="<%= ctxPath%>/resources/images/main/logo_black_new.png" />
       		 </div>
       	</div>
	</div>
	
	
	<div id="overflow" class="main-container" style="margin-bottom: 700px;">
		<div class="hot-exh">
			<div id="div1" style="float:center; margin:0 auto; transform:translate(100px,20px);">
				<h2>인기 전시회</h2>
			</div>
			<hr color="black;" style="width:85%; transform:translate(100px,20px);" />
			
			
			
		</div>
		
	<hr color="#f2f2f2;" style="transform:translate(0,700px);" />
	
	
	<div class="recom-exh">	
		<div class="swiper-container">
		    <div class="swiper-wrapper">
		    
		    </div>
		    <!-- Add Pagination -->
		    <div class="swiper-pagination"></div>
		    <!-- Add Arrows -->
		    <div class="swiper-button-next" style=""></div>
		    <div class="swiper-button-prev" style=""></div>
		  </div>
			
			<div id="div2" class="recom-exh-title" style="float: center; transform:translate(0,-680px);">
				<h2>추천 전시회</h2>
				<span>ARTREE 추천전시회를 보여줍니다.</span>
			</div>
			<hr color="black;" style="width:100%; transform:translate(0,-680px);" />
			<div style="text-align:center; display: none;">
			  <span class="dot"></span>
			  <span class="dot"></span>
			  <span class="dot"></span>
			  <span class="dot"></span>
			</div>
		
	</div>
	
	<hr color="#f2f2f2;" style=" transform:translate(0, 100px);" />

	
	<div class="newNend">
		<div id="div3" class="new-title" style="float: left; -webkit-transform:translate(58px, 180px);">
			<h2>신규 전시회</h2>
		</div>
		<hr color="black;" style="width:90%; transform:translate(62px,245px);" />
		<div class="new-exh">
			
		</div>
		
		<div id="div4" class="new-title" style="float: right; -webkit-transform:translate(-58px, 550px);">
			<h2>종료임박 전시회</h2>
		</div>
		<hr color="black;" style="width:90%; transform:translate(64px,600px);" />
		<div class="end-exh" style="transform:translate(0, 270px);">
			
		</div>
	</div>
	
	<hr color="#f2f2f2;" style="transform:translate(0, 530px);" />
	
	
	<div id="div5" class="event-title" style=" float: left; transform:translate(35px, 460px);">
		<h2>EVENT</h2>
	</div>
	<div class="event-more" style="float: right; transform:translate(-35px, 700px);">
		<a class="event-morebtn " href="<%= ctxPath%>/eventList.at">이벤트 모두보기 +</a>
	</div>
	<hr color="black;" style="width:94%; transform:translate(38px,725px);" />
       	<div class="event-div" style="transform:translate(0, 480px);">
           	
       	</div>
       	
</div>

<div class="navigation" style="display: block; right:50px; bottom: 20%; position:fixed; z-index:9999;">
	<a class="return-top" href="#">[TOP]</a>
</div>


<script>
var swiper;
<%-- Initialize Swiper --%>
function doInitializeSwiper() {
	swiper = new Swiper('.swiper-container', {
	    slidesPerView: 3,
	    spaceBetween: 30,
	    slidesPerGroup: 3,
	    loop: true,
	    loopFillGroupWithBlank: true,
	    pagination: {
	      el: '.swiper-pagination',
	      clickable: true,
	    },
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	  });	
}
</script>