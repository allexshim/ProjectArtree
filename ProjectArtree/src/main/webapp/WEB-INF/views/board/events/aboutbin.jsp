<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABOUT Artree</title>
</head>

<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	.bodybin{
		font-family: 'Noto Sans Kr', sans-serif;		
	}
	
	.headerBin {				
		width: 100%;
		height: 540px;
		margin-bottom: 90px;
		background-size: cover;
  	 	background-position: center;
	}
</style>

<body class="bodybin">
	<div class="headerBin" style="background-image:url('<%= ctxPath %>/resources/images/board/boardImage6.jpg')">		
	</div>
	
	<div style="margin: 0px 215px 90px 215px; text-align: center;">		
		<div style="text-align: center; margin-top: 50px;">
			<h2 style="line-height: 32px; font-size: 20px; letter-spacing: -0.8px;">미술시장의 폐쇄성을 타파하기 위해<br>
			큐레이터, DB전문가, 소프트웨어 개발자, 전업작가, 기획자가 함께 창립</h2>
		</div>
		<div style="font-size: 14px; line-height: 23px; text-align: center; margin-top: 40px; margin-bottom: 60px;">
			<span>
				Artree는 미술작품,작가,전국의 갤러리,전시공간 들의 DB구축에 대한 꾸준한 노력과<br>
				K-Global 빅데이터 스타트업 기술기업에 선정, 문화데이터 활용 경진대회 수상,<br>
				굿콘텐츠 서비스 선정, 스마트벤처 캠퍼스 4기를 통해 고객조사, 내부, 외부 컨설팅을 통해<br>
				미술시장의 새로운 온라인 플랫폼으로 자리잡아 가고 있습니다.<br><br>
				기존 큐레이션 서비스 Artree의 데이터 분석 기반으로, 네이버 클라우드 플랫폼(NCP)과 협력하여 아티스트가 엑세스 하여<br>
				포트폴리오의 기능을 수정 관리 할수 있는 아트 클라우드 개발 고안과,<br>
				블록체인 기반 진품 인증 솔루션 ARTLOG 로 미술 생태계의 신뢰성과 블록체인과 예술산업의 접점을 연구하고 있습니다.<br>
				2019MWC 4yfn 에 국내 최초 아트 플랫폼 사로서 ART LOG 서비스로 참가하여 ,<br>
				서울 창업허브 블록체인 기업 선정 등 ART Dapp 으로의 퍼스트 무버를 목표하고 있습니다.		<br>	
			</span>
		</div>
	</div>
	              
	<div style="margin-bottom:73px; width: 100%; height: 300px; background-color: #f0f0fa; padding-top: 36px;">
		<div style="width: 800px; margin: 0 auto; font-size: 14px; font-weight: bold;">
			<div style="line-height: 60%; text-align: center; margin-bottom: 44px; font-size: 30px; font-weight: bold;">		
				Company Info.
			</div>
			<div style="margin-bottom:31px;">아트리 ARTREE | 대표 : 심예은</div>
			<div style="float: left; margin-right: 31px;">
				Head Office<br><br>
				대구광역시 북구 호암로51,<br>
				삼성벤처캠퍼스 벤처오피스 512호 아트맵<br>
			</div>
			<div style="float: left; margin-right: 31px;">
				Branch Office<br><br>
				서울특별시 마포구 백범로31길 21<br>
				Seoul startup Hub 2층 G 212호 ARTMAP KOREA<br>
			</div>
			<div style="float: left;">
				Contact<br><br>
				info@artree.co.kr<br>
				www.artree.co.kr<br>
			</div>
		</div>
	</div>
	
	<div style="text-align: center;">
		<h2>Team Reference</h2>	
		<img src="<%= ctxPath %>/resources/images/event/year.png" style="margin:60px 0px 100px 0px; width: 1000px;">
	</div>
	
	<div style="text-align: center;">
		<hr>
		<div>
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/1.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/2.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/3.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/4.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/5.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/6.png">			
		</div>
		<hr>
		<div>
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/7.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/8.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/9.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/10.png">
			<img style="margin-right:5%; width: 150px;" src="<%= ctxPath %>/resources/images/event/11.png">			
		</div>
		<hr>
	</div>
	
</body>
</html>