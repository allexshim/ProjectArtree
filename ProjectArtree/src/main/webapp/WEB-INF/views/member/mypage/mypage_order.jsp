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
		padding-bottom: 30px;
		margin-top: 20px;
	}
	
	div.myPage_content h2 {
		display: inline-block;
		margin-top: 30px;
		font-size: 25px;
		font-weight: normal;
	}
	
	/* 주문 내역 테이블 */
	table.order_tbl {
		width: 100%;
		border-top: 2px solid black;
		text-align: center;
	}
	
	table.order_tbl tr {
	    cursor: pointer;
	}
	
	table.order_tbl th {
		text-align: center;
		color: #999999;
	}
	
	table.order_tbl td img {
		width: 160px;
	}
	
	table.order_tbl th, table.order_tbl td{
		font-size: 17px;
		padding: 10px 0;
	}
	
	td.order_info {
		text-align: left;
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
			$("#myOrder").addClass("on");
		});
	
	});
	
</script>

<body>
	<div class="myPage_wrap">
	<div class="myPage_header">
		<h1 class="header_name">사용자 이름</h1>
		<nav class="myPage_tabs">
			<a href="/artree/mypage.at" class="tab">My Artmap</a>
			<a href="/artree/mypage_order.at" class="tab on" id="myOrder">주문내역</a>
			<a href="/artree/mypage_set.at" class="tab">설정</a>
			<div class="tab_last"></div>
		</nav>
	</div>
	<div class="myPage_content">
		<h2>최근 주문</h2>	
		<div class="conts">
			<table class="order_tbl">
				<tr>
					<th>주문일</th>
					<th>제품정보</th>
					<th>수량</th>
					<th>주문번호</th>
					<th>결제금액</th>
					<th>처리상태</th>
				</tr>
				<tr>
					<td>2020-01-03</td>
					<td class="order_info">
						<img src="http://app.art-map.co.kr/upload/exhibition/artmap_20200113_135646935.jpg">
						<span>아트라벨</span>
					</td>
					<td>1</td>
					<td>AAA01131240</td>
					<td>33,500</td>
					<td>결제완료</td>
				</tr>
				<tr>
					<td>2020-01-13</td>
					<td class="order_info">
						<img src="http://app.art-map.co.kr/upload/exhibition/artmap_20200113_135646935.jpg">
						<span>아트라벨</span>
					</td>
					<td>3</td>
					<td>AAA01131241</td>
					<td>73,900</td>
					<td>결제전취소</td>
				</tr>
			</table>
		</div>
	</div>	
	
	<div style="text-align: center;">
		<span>페이징 처리 부분</span>
	</div>
	</div>
</body>

