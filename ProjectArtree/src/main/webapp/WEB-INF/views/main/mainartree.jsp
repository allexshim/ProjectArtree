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
			font-size: 20pt;
			margin: 20px;
		}
		
		.footer	{
		   z-index: 2;
		   position: fixed;
		   left: 0;
		   bottom: 0;
		   width: 100%;
		   color: white;
		   text-align: center;
		
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
		  background-color: black;
		  padding : 5%;
		  position: absolute;
		  left: 25%;
		  top: 60%;
		  width: 50%;
		  height: 30%;
		  text-align: center;
		  font-size: 18px;
		}
		
		.search-input {
			display: inline-block;
			width: 100%;
			height: 50px; 
		}
		
		.inputdiv {
			margin-top: -10px;
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
                    	$("#myheader").css("display", "none");
                    	return;
                    	}
                    else {
                    	$("#myheader").css("display", "block");
                    }
                    $(this).carousel('prev');
                    
                } else {
                    if (getActiveIdx === 3){
                    	$("#myheader").css("display", "block");
                    	return;
                    	}
                    if (getActiveIdx === 2){
                    	$("#myheader").css("display", "block");
                    	
                    	}
                    if (getActiveIdx === 1){
                    	$("#myheader").css("display", "block");
                    	
                    	}
                    if (getActiveIdx === 0){
                    	$("#myheader").css("display", "none");
                    	
                    	}
                    if (getActiveIdx === -1){
                    	$("#myheader").css("display", "none");
                    	
                    	}
                    
                    $(this).carousel('next');
                }
            });
            
            var getActiveIdx = $myCarousel.find(".carousel-inner>.item.active").index();
            if (getActiveIdx === 0){
            	$("#myheader").css("display", "none");
            	
            	}
            
            else {
            	$("#myheader").css("display", "block");
            	
            	}
            
/* 
            //scroll slides on swipe for touch enabled devices

            $("#myCarousel").on("touchstart", function (event) {
                var yClick = event.originalEvent.touches[0].pageY;
                $(this).one("touchmove", function (event) {

                    var yMove = event.originalEvent.touches[0].pageY;
                    if (Math.floor(yClick - yMove) > 1) {
                        $(".carousel").carousel('next');
                    } else if (Math.floor(yClick - yMove) < -1) {
                        $(".carousel").carousel('prev');
                    }
                });
                $(".carousel").on("touchend", function () {
                    $(this).off("touchmove");
                });
            });
*/
        });

    </script>
   
    
	    <div class="slide-wrapper">
		    <div class="main-container">
		        <div id="myCarousel" class="carousel slide">		            <!-- Indicators -->
		            <ol class="carousel-indicators">
		                <li data-target="#myCarousel" data-slide-to="0" class="active list-text">main</li>
		                <li data-target="#myCarousel" data-slide-to="1" class="list-text">notice</li>
		                <li data-target="#myCarousel" data-slide-to="2" class="list-text">exhibition</li>
		                <li data-target="#myCarousel" data-slide-to="3" class="list-text">footer</li>
		            </ol>
		
		            <!-- Wrapper for slides -->
		            
		
		            <div class="carousel-inner">
		                <div class="item active">
		                	
		                	<div class="fill" style="margin-top:0; background-image: url('<%= ctxPath%>/resources/images/main/mainImg.jpg')">
		                		
		                		<div class="main-logo">
		                			arTree
		                		</div>
		                		
		                		<div class="main-search">
		                			<div class="inputdiv">
										<input class="search-input"/>
										<input class="search-input"/>										   			
		                			</div>
		                		</div>
		                		
		                	</div>
		                
		                </div>
		                
		                <div class="item">
		            		
		                    <div class="fill" style="">
		                    
		                    </div>
		                
		                </div>
		                
		                <div class="item">
		                	
		                    <div class="fill" style="">
		                    
		                    </div>
		                
		                </div>
		                
		                <div class="item">
		                	
		                    <div class="fill" style="">
		                    
		                    </div>
		                         
	                       <div class="footer">
							  <p>Footer</p>
							</div>
		                </div>
		                
		            </div>
		        </div>
		    </div>
		</div>
	