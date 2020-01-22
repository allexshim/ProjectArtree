<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	/* 기본  */
	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	div.myPage_wrap {
		width: 1250px;
		margin: 0 auto;
	}
	
	ul {
		padding: 0;
		list-style: none;
	}

	/* header ~ nav */
	h1.header_name {
		font-size: 25px;
	}
	
	nav.myPage_tabs {
		margin: 30px 0 0 0;
	}
	
	a.tab {
		display: inline-block;
		padding: 15px;
		font-size: 14px;
		color: #000;
		width: 10%;
		text-decoration: none;
		text-align: center;
		float: left;
		border-bottom: 2px solid #e5e5e5;
	}
	
	div.tab_last {
		display: inline-block;
		width: 70%;
		height: 52px;
		float: left;
		border-bottom: 2px solid #e5e5e5;
	}
	
	.on {
		border-bottom: 2px solid #666 !important;
	}
	
	/* 기본 틀 */
	div.conts {
		display: inline-block;
		width: 100%;
		border-bottom: 1px solid #e2e2e2;
		padding-bottom: 30px;
		margin-top: 20px;
	}
	
	div.conts h2 {
		margin: 20px 0;
		font-size: 25px;
		font-weight: normal;
	}
	
	/* 취향 분석 */
	div.favor_genre {
		width: 50%;
		float: left;
		text-align: center;
	}
	
	div.favor_tag {
		width: 50%;
		float: right;
		text-align: center;
	}
	
	div.favor_chart span {
		font-size: 18px;
	}
	
	div.chart_cont {
		padding: 50px;
	}
	
	/* 작품 컬렉션 */
	ul.collect_list li {
		display: inline-block;
	}
	
	div.list_div img {
		width: 249px;
	}

	/* 전시 클립 */
	div.tab_nav {
		width: 50%;
		float: left;
		border-bottom: 3px solid #DBDBDB;
		text-align: center;
		cursor: pointer;
		padding: 11px 0 20px 0;
	}
	
	table.tab_tbl {
		width: 100%;
	}
	
	div.tbl_div span {
		display: block;
	}
	
	div.tbl_div img {
		width: 160px;
		height: 160px;
		margin: 15px;
	}
	
	
	/* 선호 작가 */
	div.artist_list {
		width: 406px;
		margin-right: 31px;
		float: left;
		cursor: pointer;
		text-align: center;
	}
	
	div.artist_list img {
		margin-bottom: 20px;
		width: 406px;
		height: 279px;
	}
	
	/* 선호 전시회 */
	div.place_list {
		width: 610px;
		height: 483px;
		margin-right: 30px;
		float: left;
	}
	
	div.img_wrap {
		width: 100%;
		height: 414px;
		background-image: url("http://app.art-map.co.kr/upload/museum/artmap_20191227_113539758.jpg");
		background-position: center;
		background-size: cover;
		display: block;
	}
	
	div.place_desc {
		float: left;
		width: 60%;
		margin-top: 20px;
	}
	
	div.place_desc span {
		display: block;
	}
	
	div.btn {
		float: right;
		margin-top: 10px;
		border: 1px solid #111;
		border-radius: 0;
		width: 163px;
		text-align: center;
		
	}
	
	div.btn a {
		height: 12px;
		padding: 20px 0px;
		text-decoration: none;
		color: #363636;
		font-size: 16px;
	}

	
</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	$(function() {
		$(".tab").mouseover(function(){
			$(this).addClass("on");
		});
		
		$(".tab").mouseout(function(){
			$(this).removeClass("on");
			$("#myArtmap").addClass("on");
		});
	
	});
	
	// 가고싶어요 다녀왔어요 변경
	function tab_nav(n){
		$(".tab_nav").removeClass("on");
		$(".tbl_div").css("display", "none");
		$("#tab_nav"+n).addClass("on");
		$("#tab_wrap"+n).css("display", "");
	}
</script>

<body>
	<div class="myPage_wrap">
	<div class="myPage_header">
		<h1 class="header_name">사용자 이름</h1>
		<nav class="myPage_tabs">
			<a href="/artree/mypage.at" class="tab on" id="myArtmap">My Artmap</a>
			<a href="/artree/mypage_order.at" class="tab">주문내역</a>
			<a href="/artree/mypage_set.at" class="tab">설정</a>
			<div class="tab_last"></div>
		</nav>
	</div>
	<div class="myPage_content">
		<div class="conts">
			<div class="favor_chart">
				<h2>취향분석</h2>
				<div class="favor_genre">
					<div class="genre_header">
						<span>선호장르</span>
					</div>
					<div class="chart_cont">
						차트차트차트차트차트<br/>
						차트차트차트차트차트<br/>
						차트차트차트차트차트<br/>
						차트차트차트차트차트<br/>
						차트차트차트차트차트
					</div>
				</div>
				<div class="favor_tag">
					<div class="tag_header">
						<span>선호태그</span>
					</div>
					<div class="chart_cont">
						태그태그태그태그태그<br/>
						태그태그태그태그태그<br/>
						태그태그태그태그태그<br/>
						태그태그태그태그태그<br/>
						태그태그태그태그태그
					</div>
				</div>
			</div>
		</div>
		
	<!-- 	<div class="conts">
			<div class="collection">
				<h2>작품컬렉션</h2>
				<div class="collect_div">
					<ul class="collect_list">
						<li>
							<div class="list_div">
								<img src="http://app.art-map.co.kr/upload/work/artmap_20191018_95021230.jpg"/>
								<div class="list_desc">
									<h4>무제</h4>
									<span class="artist">임봉재</span>
									<span class="desc">캔버스에 유채</span>
									<span class="size">162X130.3cm 2000</span>
								</div>
							</div>
						</li>
						<li>
							<div class="list_div">
								<img src="http://app.art-map.co.kr/upload/work/artmap_20191018_95021230.jpg" />
								<div class="list_desc">
									<h4>무제</h4>
									<span class="artist">임봉재</span>
									<span class="desc">캔버스에 유채</span>
									<span class="size">162X130.3cm 2000</span>
								</div>
							</div>
						</li>
						<li>
							<div class="list_div">
								<img src="http://app.art-map.co.kr/upload/work/artmap_20191018_95021230.jpg"/>
								<div class="list_desc">
									<h4>무제</h4>
									<span class="artist">임봉재</span>
									<span class="desc">캔버스에 유채</span>
									<span class="size">162X130.3cm 2000</span>
								</div>
							</div>
						</li>
						<li>
							<div class="list_div">
								<img src="http://app.art-map.co.kr/upload/work/artmap_20191018_95021230.jpg"/>
								<div class="list_desc">
									<h4>무제</h4>
									<span class="artist">임봉재</span>
									<span class="desc">캔버스에 유채</span>
									<span class="size">162X130.3cm 2000</span>
								</div>
							</div>
						</li>
						<li>
							<div class="list_div">
								<img src="http://app.art-map.co.kr/upload/work/artmap_20191018_95021230.jpg"/>
								<div class="list_desc">
									<h4>무제</h4>
									<span class="artist">임봉재</span>
									<span class="desc">캔버스에 유채</span>
									<span class="size">162X130.3cm 2000</span>
								</div>
							</div>
						</li>
						<li>
							<div class="list_div">
								<img src="http://app.art-map.co.kr/upload/work/artmap_20191018_95021230.jpg"/>
								<div class="list_desc">
									<h4>무제</h4>
									<span class="artist">임봉재</span>
									<span class="desc">캔버스에 유채</span>
									<span class="size">162X130.3cm 2000</span>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div> -->
		
		<div class="conts" style="padding: 0px;">
			<div class="clip">
				<h2>전시클립</h2>
				<div class="tab_nav on" onClick="tab_nav('1')" id="tab_nav1">가고싶어요 (1)</div>
				<!-- select count -->
				<div class="tab_nav" onClick="tab_nav('2')" id="tab_nav2">다녀왔어요 (1)</div>
				<div class="tbl_div" id="tab_wrap1">
					<table class="tab_tbl">
						<colgroup>
							<col style="width: 10%"/>
							<col style="width: 65%"/>
							<col style="width: 25%"/>
						</colgroup>
						<tr>
							<td>
								<img src="http://app.art-map.co.kr/upload/exhibition/artmap_20200106_104227138.jpg"/>
							</td>
							<td>
								<span>MIMESIS AP3: Picturesque City</span>
								<span>미메시스아트뮤지엄/경기</span>
								<span>2019.11.28 - 2020.01.27</span>
							</td>
							<td>
								<span>전시중</span>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="tbl_div" id="tab_wrap2" style="display: none;">
					<table class="tab_tbl">
						<colgroup>
							<col style="width: 10%"/>
							<col style="width: 65%"/>
							<col style="width: 25%"/>
						</colgroup>
						<tr>
							<td>
								<img src="http://app.art-map.co.kr/upload/exhibition/artmap_20191017_95348991.jpg"/>
							</td>
							<td>
								<span>알폰스 무하 Alphonse Mucha</span>
								<span>마이아트뮤지엄/서울</span>
								<span>2019-10-24 - 2020-03-01</span>
							</td>
							<td>
								<span>전시중</span>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="conts">
			<h2>선호작가</h2>
			<div class="favor_artist">
				<ul>
					<li>
						<div class="artist_list">
							<img src="http://app.art-map.co.kr/upload/author/artmap_20191105_131226254.jpg"/>
							<span>공성훈</span>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="conts">
			<h2>선호전시관</h2>
			<div class="favor_place">
				<ul>
					<li>
						<div class="place_list">
							<div class="img_wrap"></div>
							<div class="place_desc">
								<span>아라리오뮤지엄 탑동시네마/제주</span>
								<span>제주특별자치도 제주시 삼도이동 1261-8</span>
							</div>
							<div class="btn">
								<a href="#">자세히 보러가기</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
</body>

