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

div.container_joinEndTwo {
	display: block;
	width: 658px;
	margin: 0 auto;
	margin-top: 70px;
}

button {
	outline: none;
}

/* 드래그 시 색상변경 */
::selection {
    background-color: #6e1fff;
    color: #fff;
}

/* 틀 */
div.joinEndTwo_content {
	width: 80%;
	margin-top: 20px;
}

div.joinEndTwo_wrap {
	border: solid 1px #b7b7b7;
	border-radius: 8px;
	margin-bottom: 20px;
}

/* header */
div.joinEndTwo_header {
    padding: 10px 0px;
    text-align: center;
    font-weight: 600; 
    line-height: 36px;
}

div.joinEndTwo_header h2 {
	font-size: 20px;
}

/* 선택한 작품 */
div.pick {
	display: inline-block;
	width: 49%;
}

div.pick img {
	width: 190px;
	height: 190px;
	margin-bottom: 10px;
}

div.pick_desc span {
	display: block;
	font-size: 11px;
	text-align: left;
	font-weight: 500;
	line-height: 16px;
	padding-left: 30px;
}

/* 워드클라우드 */
div.joinEndTwo_chart {
	margin-top: 30px;
}

div.joinEndTwo_chart span {
	display: block;
	color: #A6A6A6;
	text-align: right;
	padding: 5px 5px;
	font-size: 12px;
}

div.word_chart {
	width: 100%;
	height: 234px;
	background-color: #f5f5f5;
	text-align: center;
	margin-top: 10px;
}

/* 푸터 설명 */
div.joinEndTwo_footer {
	text-align: left;
	margin: 40px 0 10px 0;
}

div.joinEndTwo_footer span {
	display: block;
}

/* 확인 버튼 */
#start_btn {
	padding: 10px 40px;
    background: #000;
    color: #fff;
    font-size: 18px;
    border-radius: 5px;
    margin: 0 auto;
    border: 0;
    cursor: pointer;
   	font-weight: 600;
   	margin: 20px 0 30px 0;
}



</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">


	
</script>

<body>
	<div class="container_joinEndTwo" align="center">
		<div class="joinEndTwo_wrap">
			<div class="joinEndTwo_header">
				<h2>선택작품으로 분석된 회원님의 취향입니다.</h2>
			</div>
			
			<div class="joinEndTwo_content">
				<div class="pick" style="float: left">
					<div class="pickImg_wrap">
						<img src="http://app.art-map.co.kr/upload/work/artmap_20190125_151555517.jpg"/>
					</div>
					<div class="pick_desc">
						<span>Allegory</span>
						<span>자기</span>
						<span>2015</span>
					</div>
				</div>
				<div class="pick">
					<div class="pickImg_wrap">
						<img src="http://app.art-map.co.kr/upload/work/artmap_20180920_141357469.JPG"/>
					</div>
					<div class="pick_desc">
						<span>Untitled (Blue and Black)</span>
						<span>알루미늄에 채색</span>
						<span>1952</span>
					</div>
				</div>
				
				<div class="joinEndTwo_chart">
					<span>* 마이페이지 - 작품컬렉션에서 확인하실 수 있습니다.</span>
					<div class="word_chart">
						차트차트차트
						차트차트차트
						차트차트차트
					</div>
				</div>
				
				<div class="joinEndTwo_footer">
					<span style="font-weight: 600;">취향 분석은 회원님의 활동에 따라 변화합니다.</span>
					<span>마음에드는 작품, 좋아하는 작가, 전시회에 대한 호감 표현이</span>
					<span>많아질수록 정확한 큐레이션을 제공해 드립니다.</span>
				</div>
			</div>
			
			
			

		<button type="button" id="start_btn" onClick="javascript:location.href='<%= request.getContextPath()%>/search.at'">아트맵 시작하기</button>
		</div>
	</div>
</body>