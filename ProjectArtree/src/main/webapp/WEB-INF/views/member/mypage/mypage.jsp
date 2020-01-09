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
	
	/* 드래그 시 색상변경 */
	::selection {
	    background-color: #6e1fff;
	    color: #fff;
	}
	
	/* header ~ nav */
	h1.header_name {
		font-size: 25px;
	}
	
	nav.myPage_tabs {
		margin: 30px 0 0 0;
		border-bottom: 2px solid #e5e5e5;
	}
	
	a.tab {
		display: inline-block;
		padding: 15px;
		font-size: 13px;
		color: #000;
		width: 114px;
		text-decoration: none;
	}
	
</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
</script>

<body>
	<div class="myPage_wrap">
	<div class="myPage_header">
		<h1 class="header_name">사용자 이름</h1>
		<nav class="myPage_tabs">
			<a href="#" class="tab">My Artmap</a>
			<a href="#" class="tab">주문내역</a>
			<a href="#" class="tab">설정</a>
		</nav>
	</div>
	<div class="myPage_content">
		<div class="conts_one">
			<div class="favor_chart">
				<h2>취향분석</h2>
				<div class="favor_genre">
					<div class="genre_header">
						<span>선호장르</span>
					</div>
					<div class="genre_cont">
						차트차트차트차트차트
					</div>
				</div>
				<div class="favor_tag">
					<div class="tag_header">
						<span>선호태그</span>
					</div>
					<div class="tag_cont">
						태그태그태그태그태그
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

