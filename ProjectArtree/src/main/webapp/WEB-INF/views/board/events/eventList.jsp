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
	}
	
	#container_exhibition .Title_Area .lt {
		display: block;
		font-size: 35pt;
		font-weight: bold;
	}
	
	#container_exhibition .ExhList_Area {
		position: relative;
		max-width: 100%;
		margin-top: 60px;
	}
	
	#container_exhibition .ExhList_Area a {
		text-decoration: none;
		color: #0d0d0d;
		cursor: pointer;
		display: inline-block;
		width: 22%;
		height: 400px;
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
	
	/* 이벤트 추가 버튼 */
	span#addEvent {
		font-size:20pt; 
		float:right; 
		cursor:pointer;
		font-weight : bold;
	}
	
	/* 더보기 버튼 */
	#showMoreBtn {
		font-size:20pt;
		float:left; 
		cursor:pointer;
		padding-top : 20px;
		font-weight : bold;
	}
	
</style>

<%-- EXHIBITION LIST SCRIPT START --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 더보기 버튼 기능 구현하면 첫 로딩 화면에서 아래 코드 실행
		/* display("1"); */
		
		$(".exh_one").hover(function(){
			$(this).css('opacity','0.8');
			$(this).children(".art_info_aboutTime").stop().animate({top:'7px'});

		}, function(){
			$(this).css('opacity','1.0');
			$(this).children(".art_info_aboutTime").stop().animate({top:'0px'});
		});
		
		// 이벤트 추가 버튼
		$("span#addEvent").click(function(){
			window.location.href="/artree/addEvent.at";	
		}); 
		
		$("span#addEvent").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		// 더보기 버튼
		$("#showMoreBtn").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
	}); // end of document.ready -----------------------------------------------
	
	<!--  나중에 exhDetail함수에 전시회 코드를 parameter로 넣습니다. -->
	function exhDetail(){ // .at?code=code 와 같이 전송해서 해당 이벤트의 전시회 상세페이지로 이동합니다.
		location.href="<%= ctxPath%>/exhDetail.at";
	}
	
	
	// === 더보기 버튼 === 
	// 더보기 버튼을 누르면 보여줄 상품의 개수 단위 (한 block, 이경우에는 8개 (~= sizePerPage))
	var lenHIT = 16; /* 4*4개씩 더 보여준다 */
	
	// display 할 HIT 상품 정보 추가 (Ajax로 처리)
	function display(start){
		var code = "${code}";

		$.ajax({
			url : "*.at",
		//	type:"GET",                 ---> 
			data:{"code":code, 
				  "startRno":start, // RNO 몇번 부터 행을 select할 것인가?
				  "len":lenHIT}, // RNO 몇번째까지 행을 select할 것인가? (시작번호 * 블럭 개수)
			dataType : "JSON",
			success : function(json){ // 성공적으로 데이터를 가져온다면
				
				var html = "";
			
				$.each(json, function(index, item){
					<!--  나중에 exhDetail함수에 전시회 코드를 parameter로 넣습니다. -->
					html += "<a class='exh_one' onclick='exhDetail()'>"+
						    "<img class='exh_poster' src='이미지 경로'/>"+
						    "<span class='art_info_aboutLoca InfoWhereWhen'> {이벤트 정보}</span>"+
						    "<span class='art_mainTitle'> {이벤트 정보}</span>"+
						    "<span class='art_info_aboutTime InfoWhereWhen'> {이벤트 정보}</span>"+
						    "</a>";
					
					if((index+1)%4 == 0){ // 0부터 시작하는 index+1 = 1,2,3...과 같이 4의 배수가 아니라면
						html +="<br/>";
					}
				});
				$(".ExhList_Area").append(html);
				
				// 중요! 더보기 버튼의 value 속성값 지정하기
				$(".showMoreBtn").val( parseInt(start)+lenHIT ); // 초기값+1을 증가시킨다.
				$(".count").text( parseInt($(".count").text())+json.length);
				// 누적해서 보여지는 상품 수 세기 (totalCount를 넘어가면 더보기를 중단한다.)
				// 기존 값 + 이번에 select해온 개수(jsonArray에 들어온 객체 수)
				
				// countHIT 값과, 가장 처음 읽어온 총 count 값이 같아지면 더이상 불러오지 않는다.
				if($(".count").text()
						== $(".totalCount").text() ){
					// 모든 상품 리스트를 출력했다면, 더보기 버튼 텍스트를 변경한다.
					$("span#showMoreText").text("Back to Top");
					
					// 더보기 화살표 방향 반대로 바꾸기
					$(".arrow").removeClass("fa-chevron-down");
					$(".arrow").addClass("fa-chevron-up");
					
					// countHIT를 0으로 초기화한다.
					$(".count").text("0");
				}		
			},
			error: function(request, status, error){ // 에러가 났을 경우의 동작
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	// ===============

</script>
<%-- EXHIBITION LIST SCRIPT END --%>


<div id="container_exhibition">
	<div class="Title_Area">
		<span class="st">WHAT'S ON</span>
		<span class="lt">EVENTS</span>
	</div>
	
	<!-- 나중에 admin 계정 생기면 아래 조건을 '==' 으로 바꿔주세요. 관리자 계정으로 로그인할때만 보이는 버튼입니다. -->
	<c:if test="${sessionscope.loginuser.userid != 'admin' }">
		<span id="addEvent"><i class="fas fa-plus"></i> ADD</span>
	</c:if>
	
	<div class="ExhList_Area">
		<a class="exh_one" onclick="exhDetail()"> <!--  나중에 exhDetail함수에 전시회 코드를 parameter로 넣습니다. -->
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<br/>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<br/>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<br/>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<a class="exh_one" onclick="exhDetail()" style="margin-right: 0;">
			<img class="exh_poster" src="<%= ctxPath%>/resources/images/exhibition/artmap_20200102_9426350.jpg"/>
			<span class="art_info_aboutLoca InfoWhereWhen">전북도립미술관 | 전북</span>
			<span class="art_mainTitle">그녀의 이름은</span>		
			<span class="art_info_aboutTime InfoWhereWhen">2020.11.12 - 2020.11.13 | FREE</span>
		</a>
		<br/>
	</div>
	
	<div id="showMoreBtn" align="right" value=""><span id="showMoreText">Show More Events</span>
	<span class="totalCount" style="display:none;">${totalCategoryCount}</span> 
	<%-- 대상이 되는 행(상품)이 총 몇개인지 출력 --%>
	<span class="count" style="display:none;">0</span>
	<i class="arrow fas fa-chevron-down"></i></div>
</div>
