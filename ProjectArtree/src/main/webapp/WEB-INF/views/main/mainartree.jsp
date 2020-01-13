<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
    <style type="text/css">
    
     html, body {
            width: 100%;
            height: 100%;
            
        }
    
        .carousel-inner, .carousel, .item, .main-container, .fill {
            height: 100%;
            width: 100%;
            background-position: center center;
            background-size: cover;
        }

        .slide-wrapper {
            display: inline;
        }

        .slide-wrapper .main-container {
            padding: 0px;
        }

        /*------------------------------ vertical bootstrap slider----------------------------*/

        .carousel-inner > .item.next, .carousel-inner > .item.active.right {
            transform: translate3d(0, 100%, 0);
            -webkit-transform: translate3d(0, 100%, 0);
            -ms-transform: translate3d(0, 100%, 0);
            -moz-transform: translate3d(0, 100%, 0);
            -o-transform: translate3d(0, 100%, 0);
            top: 0;
        }

        .carousel-inner > .item.prev, .carousel-inner > .item.active.left {
            transform: translate3d(0, -100%, 0);
            -webkit-transform: translate3d(0, -100%, 0);
            -moz-transform: translate3d(0, -100%, 0);
            -ms-transform: translate3d(0, -100%, 0);
            -o-transform: translate3d(0, -100%, 0);
            top: 0;
        }
        
        
        .carousel-inner > .item.next.left, .carousel-inner > .item.prev.right, .carousel-inner > .item.active {
            transform: translate3d(0, 0, 0);
            -webkit-transform: translate3d(0, 0, 0);
            -ms-transform: translate3d(0, 0, 0);;
            -moz-transform: translate3d(0, 0, 0);
            -o-transform: translate3d(0, 0, 0);
            top: 0;
        }

        /*------------------------------- vertical carousel indicators ------------------------------*/
        .carousel-indicators {
            position: absolute;
            top: 0;
            bottom: 0;
            margin: auto;
            height: 200px;
            right: 10px;
            left: auto;
            width: auto;
            text-align: right;
        }

        .carousel-indicators li {
            display: block;
            margin: 20px;
            border: none;
        }

        .carousel-indicators li.active {
            margin: 20px;
            background: none;
        }
		
		.list-text{
			text-decoration: bold;
			font-size: 10pt;
			margin: 20px;
		}
		
		.footer	{
		   height: 150px;
		   z-index: 2;
		   position: fixed;
		   left: 0;
		   bottom: 0;
		   width: 100%;
		   text-align: center;
		   border-top: solid 1px gray;
		}
		
		.main-logo {
		  color: white;
		  text-decoration: bold;
		  padding : 5%;
		  position: absolute;
		  left: 25%;
		  top: 30%;
		  width: 50%;
		  height: 30%;
		  text-align: center;
		  font-size: 50px;
		}
		
		.main-search {
		  padding : 5%;
		  position: absolute;
		  left: 37.7%;
		  top: 60%;
		  width: 25%;
		  height: 20%;
		  text-align: center;
		  font-size: 18px;
		}
		
		.search-input {
			display: inline-block;
			width: 100%;
			height: 50px; 
		}
		
		.inputdiv {
			margin-left: 0;
			width: 100%;
			margin-top: -50px;
		}
		
		/* header */
		.topnav {
		  border-bottom: solid 2px #f2f2f2;
		  margin-top: 10px;
		  z-index: 2;
		  display: inline-block;
		  overflow-x: hidden;
		  overflow-y: hidden;
		  text-align: center;
		  width: 100%;
		  height: 60px;
		}
		
		.topnav a.header-nav {
		  text-align: center;
		  margin: 20px;
		  padding: 14px 16px;
		  text-decoration: none;
		  font-size: 25px;
		  color: black;
		}
		
		.topnav a.logo {
		  z-index: 2;
		  float: left;
		  text-align: left;
		  padding: 14px 16px;
		  text-decoration: none;
		}
		
		.topnav a:hover {
		  color: gray;
		}
		
		.topnav a.login {
			margin: 0 20px 0 20px;
			float: right;
		}
		
		/* sidebar */
		.sidenav {
		  margin-left: 10px;
		  height: 100%;
		  width: 10%;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  left: 0;
		  overflow-x: hidden;
		  overflow-y: hidden;
		  padding-top: 20px;
		}
		
		.sidenav a {
		  margin-top: 50px;
		  padding: 0;
		  text-decoration: none;
		  font-size: 25px;
		  color: #818181;
		  display: block;
		}
		
		.sidenav a:hover {
		  color: #f2f2f2;
		}
		
		.main {
		  margin-left: 160px; /* Same as the width of the sidenav */
		  font-size: 28px; /* Increased text to enable scrolling */
		  padding: 0px 10px;
		}
		
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
		
		span {
		    display: block;
		    width: 80px;
		    padding: 2px 16px;
		    cursor: pointer;
		}
		.arrow_box {
		  display: none;
		  position: absolute;
		  width: 80px;
		  padding: 8px;
		  margin-top: 8px;
		  left: 0;
		  -webkit-border-radius: 8px;
		  -moz-border-radius: 8px;  
		  border-radius: 8px;
		  background: #333;
		  color: #fff;
		  font-size: 14px;
		}
		
		.arrow_box:after {
		  position: absolute;
		  bottom: 100%;
		  left: 50%;
		  width: 0;
		  height: 0;
		  margin-left: -10px;
		  border: solid transparent;
		  border-color: rgba(51, 51, 51, 0);
		  border-bottom-color: #333;
		  border-width: 10px;
		  pointer-events: none;
		  content: " ";
		}
		
		a:hover + p.arrow_box {
		  display: block;
		}

		/* imgfadein */
		.imgfadein {
			position: absolute;
			left: 30%;
			top: 25%;
		    width: 400px;
		    height: 500px;
		}
		#slide {
		    position:relative;
		    width: 800px;
		    height: 500px;
		    overflow:hidden;
		}
		#slide > div {
		    position:absolute;
		    top:0;
		    left:0;
		    width:100%;
		    height:100%;
		    height: 500px;
		}
		
		#slide2 {
		    position:relative;
		    width: 800px;
		    height: 500px;
		    overflow:hidden;
		}
		#slide2 > div {
		    position:absolute;
		    top:0;
		    left:0;
		    width:100%;
		    height:100%;
		    height: 500px;
		}
		
		.explain {
			 font-size: 24pt; 
			 position: absolute; 
			 top: 0;
			 left: 60%;
			 
		}
		
		.best {
			position: absolute;
			top: 15%;
			left: 30%;
			font-size: 26pt;
		}
		
		.exhibitions {
			text-align: center;
			position:relative;
		    left: 10%;
		    display: -webkit-flex;
		    display: flex;
		    -webkit-justify-content: center;
		    justify-content: center;
		    -webkit-align-items: center;
		    align-items: center; 
			top: 5%;
			width: 1300px;
			height: 650px;
		}
		
		.exhibitions-title {
			height: 30px;
			font-size: 18pt;
			
		}
		
		.exhibitions-img {
			margin-top: 30px;
			
		}
		
		
		.notice {
			
		    left: 20%;
		    
			top: 5%;
			width: 1200px;
			height: 660px;
		}
	</style>
	
	<script type="text/javascript">
        $(document).ready(function () {
            var $myCarousel = $('#myCarousel');
            // invoke the carousel
            $myCarousel.carousel({
                interval: false
            });
            
            // scroll slides on mouse scroll
            $myCarousel.bind('mousewheel DOMMouseScroll', function (e) {
                var getActiveIdx = $myCarousel.find(".carousel-inner>.item.active").index();
                if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
                    if (getActiveIdx === 0){
                    	return;
                    	}
                    
                    $(this).carousel('prev');
                    
                } else {
                    if (getActiveIdx === 3){
                    	return;
                    	}
                 
                    $(this).carousel('next');
                }
            });
            
           /* fade_container */
            $('#slide > div:gt(0)').hide();

            setInterval(function(){
                $('#slide > div:first')
                    .fadeOut(1000)
                    .next()
                    .fadeIn(1000)
                    .end()
                    .appendTo('#slide');
            },3000);
    
            
        });

    </script>
   
    
	    <div class="slide-wrapper">
		    <div class="main-container">
		        <div id="myCarousel" class="carousel slide">		            
		        <!-- Indicators -->
		            <ol class="carousel-indicators">
		                <li data-target="#myCarousel" data-slide-to="0" class="active list-text">홈</li>
		                <li data-target="#myCarousel" data-slide-to="1" class="list-text">인기전시회</li>
		                <li data-target="#myCarousel" data-slide-to="2" class="list-text">신규/종료임박</li>
		                <li data-target="#myCarousel" data-slide-to="3" class="list-text">전시회등록</li>
		            </ol>
		
		            <!-- Wrapper for slides -->
		            
		
		            <div class="carousel-inner">
		                <div class="item active">
		                	
		                	<div class="fill" style="margin-top:0; background-image: url('<%= ctxPath%>/resources/images/main/mainImg.jpg')">
		                		
		                		<div class="main-logo">
		                			로고이미지
		                		</div>
		                		
		                <div class="main-search">
		                			<div class="inputdiv">
										<input class="search-input" placeholder="전시회 이름으로 검색"/>
										<input class="search-input" placeholder="지역별 전시회 검색"/>										   			
		                			</div>
		                </div>
		                		
		                	</div>
		                
		                </div>
		                
		                <div class="item">
		            		<div class="topnav" style="margin-bottom: 0;">
							  <a class="logo">로고이미지</a>
							  <a class="header-nav" href="#">GALLARY</a>
							  <a class="header-nav" href="<%= ctxPath %>/exhList.at">EXHIBITION</a>
							  <a class="header-nav" href="#">ABOUT ARTREE</a>
							  <a class="header-nav" href="#">SERVICE</a>
							 
							  <a class="login" href="<%= ctxPath %>/admin.at"><img src="<%= ctxPath %>/resources/images/main/mainheader-setting.png"/></a>
							  <a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-account.png" /></a>
							  <a class="login" href="#">my</a>
							</div>
							<div class="sidenav" >
							  <a href="#" style="margin-top: 80%;">
							  	<img alt="검색" src="<%= ctxPath %>/resources/images/main/mainside-search.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Search</p>
							  
							  <a href="#">
							  	<img alt="티켓" src="<%= ctxPath %>/resources/images/main/mainside-ticket.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Buy a Tickets</p>
							  	
							  <a href="#">
							  	<img alt="채팅" src="<%= ctxPath %>/resources/images/main/mainside-chat.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Chat</p>
							  	
							  <a href="#">
							  	<img alt="달력" src="<%= ctxPath %>/resources/images/main/mainside-schedule.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Schedule</p>
							  	
							  <a href="#">
							  	<img alt="지도" src="<%= ctxPath %>/resources/images/main/mainside-location.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Location</p>
							  
							</div>
		                    <div class="fill" >
		                    	<div class="best">지금 핫한 전시회</div>
		                    	<div class="imgfadein">
								    <div id="slide">
								        <div>
									        <img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" alt="" />
									        <div class="explain">
												제목 내용
											</div>
								       </div>

								        <div>
								        	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster2.JPG" alt="" />
								        	<div class="explain">
												BEST Exhibitions
											</div>
								        </div>
								        <div>
								        	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" alt="" />
								        	<div class="explain">
												BEST Exhibitions
											</div>
								        </div>
								        <div>
								        	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster2.JPG" alt="" />
								        	<div class="explain">
												BEST Exhibitions
											</div>
								        </div>
								        <div>
								        	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" alt="" />
								        	<div class="explain">
												BEST Exhibitions
											</div>
								        </div>
								    </div>
								</div>
								
		                    </div>
		                
		                </div>
		                
		                <div class="item">
		                	<div class="topnav" style="margin-bottom: 0;">
							  <a class="logo">arTree</a>
							  <a class="active header-nav" href="#">GALLARY</a>
							  <a class="header-nav" href="#">EXHIBITION</a>
							  <a class="header-nav" href="#">ABOUT ARTREE</a>
							  <a class="header-nav" href="#">SERVICE</a>
							  <a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-setting.png"/></a>
							  <a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-account.png" /></a>
							  <a class="login" href="#">my</a>
							  
							</div>
							<div class="sidenav" >
							  <a href="#" style="margin-top: 80%;">
							  	<img alt="검색" src="<%= ctxPath %>/resources/images/main/mainside-search.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Search</p>
							  
							  <a href="#">
							  	<img alt="티켓" src="<%= ctxPath %>/resources/images/main/mainside-ticket.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Buy a Tickets</p>
							  	
							  <a href="#">
							  	<img alt="채팅" src="<%= ctxPath %>/resources/images/main/mainside-chat.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Chat</p>
							  	
							  <a href="#">
							  	<img alt="달력" src="<%= ctxPath %>/resources/images/main/mainside-schedule.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Schedule</p>
							  	
							  <a href="#">
							  	<img alt="지도" src="<%= ctxPath %>/resources/images/main/mainside-location.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Location</p>
							  
							</div>
		                    <div class="fill" style="">
		                    	<div class="exhibitions">
		                    		<div style="flex:1; width: 50%; height: 100%;" class="endexpected-exh">
		                    			<div class="exhibitions-title" style="text-align: left;">
		                    				종료예정 전시회
		                    			</div>
		                    			<div class="exhibitions-img">
		                    				<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" />
		                    			</div>
		                    		</div>
		                    		<div style="flex:1; width: 50%; height: 100%;" class="new-exh">
		                    			
		                    			<div >
		                    				<img style="width: 400px; height: 500px; margin-top: 0;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" />
		                    			</div>
		                    			<div class="exhibitions-title" style="margin-top: 30px; text-align: right;">
		                    				신규 전시회 
		                    			</div>
		                    		</div>
		                    		
		                    	</div>
		                    </div>
		                
		                </div>
		                
		                <div class="item">
		                	<div class="topnav" style="margin-bottom: 0;">
							  <a class="logo">arTree</a>
							  <a class="active header-nav" href="#">GALLARY</a>
							  <a class="header-nav" href="#">EXHIBITION</a>
							  <a class="header-nav" href="#">ABOUT ARTREE</a>
							  <a class="header-nav" href="#">SERVICE</a>
							  <a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-setting.png"/></a>
							  <a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-account.png" /></a>
							  <a class="login" href="#">my</a>
							</div>
							<div class="sidenav" >
							  <a href="#" style="margin-top: 80%;">
							  	<img alt="검색" src="<%= ctxPath %>/resources/images/main/mainside-search.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Search</p>
							  
							  <a href="#">
							  	<img alt="티켓" src="<%= ctxPath %>/resources/images/main/mainside-ticket.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Buy a Tickets</p>
							  	
							  <a href="#">
							  	<img alt="채팅" src="<%= ctxPath %>/resources/images/main/mainside-chat.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Chat</p>
							  
							  <a href="#">
							  	<img alt="달력" src="<%= ctxPath %>/resources/images/main/mainside-schedule.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Schedule</p>
							  	
							  <a href="#">
							  	<img alt="지도" src="<%= ctxPath %>/resources/images/main/mainside-location.png" />
							  </a>
							  <p class="arrow_box" style="color: white; text-align: center;">Location</p>
							  
							  
							  
							</div>
		                    <div class="fill" style="">
		                    	<div class="notice">
		                    		
		                    	</div>
		                    </div>
		                         
	                       <div class="footer">
							  <p>Footer</p>
							</div>
		                </div>
		                
		            </div>
		        </div>
		    </div>
		</div>
	