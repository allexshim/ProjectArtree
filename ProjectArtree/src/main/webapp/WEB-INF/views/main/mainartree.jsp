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
		 position: absolute; 
		 top: 20%;
		 left: 55%;
		 
	}
	
	.best {
		position: absolute;
		top: 15%;
		left: 23.5%;
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
		margin:0 60px 0 0;
		
	}

	
	
	.recom-exhibitions {
		text-align: center;
		position:relative;
	    left: 25%;
	    display: -webkit-flex;
	    display: flex;
	    -webkit-justify-content: center;
	    justify-content: center;
	    -webkit-align-items: center;
	    align-items: center; 
		top: 5%;
		width: 800px;
		height: 400px;
	}
	
	.recom_one {
		margin-right: 50px;
		flex: 1;
		width: 25%;
		height: 60%;
	}
	
	.exh_poster {
		width: 200px;
		height: 350px;
	}
	
	.recom-info {
		width: 100%;
	}
	
	.recomExh {
		position: absolute;
		top: 15%;
		left: 20%;
		font-size: 26pt;
	}
	
	.newNend-exh-exp {
		display: block;
		text-align: center;
		width: 400px;
		font-size: 12pt;
	}
	
	.hotexhDiv {
		 border: solid 1px gray;
	}
	
	.hot-rank {
		-webkit-transform:translate(0,-50px);
	}
	
	.hot-exh a{
		font-size: 12pt;
		margin: 20px;
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
	            if (getActiveIdx === 4){
	            	return;
	            	}
	         
	            $(this).carousel('next');
	        }
	    });
	    
	   /* fade_container */
	    $('#slide > div:gt(0)').hide();
	
	    setInterval(function(){
	        $('#slide > div:first')
	            .fadeOut(4000)
	            .next()
	            .fadeIn(4000)
	            .end()
	            .appendTo('#slide');
	    },4000);
	
	    
	    
	});
	
	

</script>
   
    
<div class="slide-wrapper">
	<div class="main-container">
	    <div id="myCarousel" class="carousel slide">		            
		    <!-- Indicators -->
		    <ol class="carousel-indicators" style="margin:20px 20px; top: 30%;">
		        <li style="-webkit-transform:rotate(270deg) translate(80px,0px); " data-target="#myCarousel" data-slide-to="0" class="active list-text">HOME</li>
		        <li style="-webkit-transform:rotate(270deg) translate(40px,0px); " data-target="#myCarousel" data-slide-to="1" class="list-text">HOT</li>
		        <li style="-webkit-transform:rotate(270deg) translate(10px,0px); " data-target="#myCarousel" data-slide-to="2" class="list-text">FAVORITE</li>
		        <li style="-webkit-transform:rotate(270deg) translate(-60px,0px); " data-target="#myCarousel" data-slide-to="3" class="list-text">NEW/END</li>
		        <li style="-webkit-transform:rotate(270deg) translate(-120px,0px); " data-target="#myCarousel" data-slide-to="4" class="list-text">FOOTER</li>
		    </ol>
		
		     <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		         <div class="item active">
		         	
		         	 <div class="fill" style="z-index:10; margin-top:0; background-image: url('<%= ctxPath%>/resources/images/main/mainImg.jpg')">
		         		
		         		 <div class="main-logo" style="z-index: 5;">
		         			로고이미지
		         		 </div>
				         <div class="main-search" style="z-index: 5;">
			       			<div class="inputdiv">
								<input class="search-input" placeholder="전시회 이름으로 검색"/>
								<input class="search-input" placeholder="지역별 전시회 검색"/>										   			
			       			</div>
				         </div>
		         	</div>
		         </div>
		         
		         <div class="item">
			     
					 <jsp:include page="/WEB-INF/tiles/mainTiles/header.jsp"></jsp:include>
					 <jsp:include page="/WEB-INF/tiles/mainTiles/sideinfo.jsp"></jsp:include>
					 
		             <div class="fill">
						<div class="best">인기 전시회 TOP 5</div>
							
	        				<div class="imgfadein" style="-webkit-transform : translate(-100px,0);">
								<div id="slide">
									
								    <div class="hotexhDiv">
								     	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" alt="" />
								      	<div class="explain">
											<div class="hot-exh" >
												<a>인기전시회들1</a>
											</div>
											<br/><br/><br/>
											<div class="hot-exh">
												<a>인기전시회 작가들1</a>
											</div>
											<br/><br/><br/>
											<div class="hot-exh">
												<a>인기전시회 갤러리1</a>
											</div>
											<br/><br/><br/>
											<div class="hot-exh">
												<a>인기전시회 날짜1</a>
											</div>
										</div>
								    </div>
								
							     <div class="hotexhDiv">
							     	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster2.JPG" alt="" />
							     	<div class="explain">
							     		
										<div class="hot-exh" >
											<a>인기전시회들2</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 작가들2</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 갤러리2</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 날짜2</a>
										</div>
									</div>
							     </div>
							     <div class="hotexhDiv">
							     	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" alt="" />
							     	<div class="explain">
							     		
										<div class="hot-exh" >
											<a>인기전시회들3</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 작가들3</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 갤러리3</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 날짜3</a>
										</div>
									</div>
							     </div>
							     <div class="hotexhDiv">
							     	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster2.JPG" alt="" />
							     	<div class="explain">
							     		
										<div class="hot-exh" >
											<a>인기전시회들4</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 작가들4</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 갤러리4</a>
										</div>
										<br/><br/><br/>
										<div class="hot-exh">
											<a>인기전시회 날짜4</a>
										</div>
									</div>
							     </div>
							     <div class="hotexhDiv">
							     	<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" alt="" />
							        	<div class="explain">
							        		
											<div class="hot-exh" >
												<a>인기전시회들5</a>
											</div>
											<br/><br/><br/>
											<div class="hot-exh">
												<a>인기전시회 작가들5</a>
											</div>
											<br/><br/><br/>
											<div class="hot-exh">
												<a>인기전시회 갤러리5</a>
											</div>
											<br/><br/><br/>
											<div class="hot-exh">
												<a>인기전시회 날짜5</a>
											</div>
										</div>
							        </div>
								</div>
							</div>
						
		              </div>
		          </div>
		          
		          <div class="item">
					<jsp:include page="/WEB-INF/tiles/mainTiles/header.jsp"></jsp:include>
					<jsp:include page="/WEB-INF/tiles/mainTiles/sideinfo.jsp"></jsp:include>
					
					<div class="fill" style="">
	                	<div class="recomExh">추천 전시회</div>
		               	<div class="recom-exhibitions">
		               		<a class="recom_one" >
								<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
								<span class="recom-info">그녀의 이름은</span>
								<span class="recom-info">전북도립미술관 | 전북</span>		
								<span class="recom-info">2020.11.12 - 2020.11.13</span>
							</a>
							<a class="recom_one" >
								<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
								<span class="recom-info">그녀의 이름은</span>
								<span class="recom-info">전북도립미술관 | 전북</span>		
								<span class="recom-info">2020.11.12 - 2020.11.13</span>
							</a>
							<a class="recom_one" >
								<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
								<span class="recom-info">그녀의 이름은</span>
								<span class="recom-info">전북도립미술관 | 전북</span>		
								<span class="recom-info">2020.11.12 - 2020.11.13</span>
							</a>
							<a class="recom_one" >
								<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
								<span class="recom-info">그녀의 이름은</span>
								<span class="recom-info">전북도립미술관 | 전북</span>		
								<span class="recom-info">2020.11.12 - 2020.11.13</span>
							</a>
		               	</div>
	                </div>
		            
		         </div>
		         
				 <div class="item">
					<jsp:include page="/WEB-INF/tiles/mainTiles/header.jsp"></jsp:include>
					<jsp:include page="/WEB-INF/tiles/mainTiles/sideinfo.jsp"></jsp:include>
					
					<div class="fill">
		             	<div class="exhibitions">
		             		<div style="flex:1; width: 50%; height: 100%; margin: 80px 30px 0 0;" class="endexpected-exh" >
			             		<div style="float: center; text-align: center; margin: 0 0 0 175px; padding-bottom: 20px;">	
			             			<span class="newNend-exh-exp endexh">종료예정 전시회</span>
		             				<span class="newNend-exh-exp endexh">종료예정 전시회 위치</span>
		             				<span class="newNend-exh-exp endexh">종료예정 전시회 기간</span>
		             			</div>	
		             			<div class="exhibitions-img" >
			             			<div class="exhibitions-title" style="text-align: left; float:left; margin-right:0px; top:400px; -webkit-transform:rotate(270deg) translate(-400px,60px);">
			             				종료예정 전시회
			             			</div>
		             				<img style="width: 400px; height: 500px;" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" />
		             			</div>
		             		</div>
		             		<div style="flex:1; width: 50%; height: 100%; " class="new-exh">
		             			
		             			<div style="text-align: left; margin:-20 0 0 200px;">
			             			<div class="exhibitions-title" style="margin: 0 100px 0 0; float:right; text-align: right; -webkit-transform:rotate(270deg) translate(-50px,-450px);">
			             				신규 전시회 
			             			</div>
		             				<img style="width: 400px; height: 500px; margin-top: 0; -webkit-transform:translate(50px,0);" src="<%= ctxPath %>/resources/images/exhibition/poster3.JPG" />
		             			</div>
		             			<div style="float: center; text-align: center; margin-left: 50px; -webkit-transform:translate(0,20px);" >
		             				<span class="newNend-exh-exp">새로나온 전시회</span>
		             				<span class="newNend-exh-exp">새로나온 전시회 위치</span>
		             				<span class="newNend-exh-exp">새로나온 전시회 기간</span>
		             			</div>
		             			
		             		</div>
		             		
		             	</div>
		             </div>
					
				</div>
				
				<div class="item">
					<jsp:include page="/WEB-INF/tiles/mainTiles/header.jsp"></jsp:include>
					<jsp:include page="/WEB-INF/tiles/mainTiles/sideinfo.jsp"></jsp:include>
					
					<div class="fill">
		            	<div class="addexh">
		            		<div class="addexh-title" style="text-align: center">
		            			
		            		</div>
		            	</div>	
		            </div>
					             
					<jsp:include page="/WEB-INF/tiles/mainTiles/footer.jsp"></jsp:include>
				</div>
				
	        </div>
	    </div>
	</div>
</div>
	