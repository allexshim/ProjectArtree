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

div.container_joinEnd {
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

div.joinEnd_wrap {
	border: solid 1px #b7b7b7;
	border-radius: 8px;
	margin-bottom: 20px;
	overflow: auto;
}

div.joinEnd_header {
	background-color: #000;
    padding: 10px 0px;
    text-align: center;
    color: #fff;
    font-size: 22px;
    font-weight: 600;
    line-height: 36px;
}

/* 내용 */
div.joinEnd_content {
	margin-top: 26px;
}

span#fisrt_info {
	color: #787878;
	font-size: 15px;
}

/* 테이블 */
div.joinEnd_content table {
	width: 90%;
	margin-top: 30px;
}

div.joinEnd_content table th {
	font-size: 17px;
    font-weight: 600;
    padding: 10px;
}

div.joinEnd_content table td {
	text-align: center;
	padding: 10px 40px;
}

/* 성별 */
button#gender_male { 
	float: left;
	width: 50%;
	cursor: pointer;
	font-weight: bold;
	height: 40px;
	background-color: #fff;
	color: #757575;
	border: 1px solid #e7e7e7;
}

button#gender_female {
	float: right;
	width: 50%;
	cursor: pointer;
	font-weight: bold;
	height: 40px;
	background-color: #fff;
	color: #757575;
	border: 1px solid #e7e7e7;
}

.on {
	border: 2px solid black !important;
}

/* 연령대 */
select#age_select{
	width: 100%;
    text-align-last: center;
    font-size: 12px;
    height: 40px;
    border: 1px solid #e7e7e7;
}

/* 지역 */
select#area_select{
	width: 100%;
    text-align-last: center;
    font-size: 12px;
    height: 40px;
    border: 1px solid #e7e7e7;
}

/* 마음에 드는 작품 설정 */
div.favor_header {
	font-size: 15.5px;
    font-weight: 600;
    margin: 30px 0 20px 0;
}

div.img_wrap {
		display: inline-block;
		width: 100%;
}

div.img_wrap img {
	width: 280px;
	height: 280px;
	margin-bottom: 22px;
	cursor: pointer;
}

div.img_wrap img:hover {
	border:5px solid black;
}

img.img_margin {
	margin-right: 22px;
}


/* 확인 버튼 */
#next_btn {
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

function gender_chg(g) {
	$(".gender").removeClass("on");
	$("#gender_"+g).addClass("on");
	$("#gender").val(g);
}
	
</script>

<body>
	<div class="container_joinEnd" align="center">
		<div class="joinEnd_wrap">
			<div class="joinEnd_header">
				<span>Artree님, 환영합니다.</span>
			</div>
			<div class="joinEnd_content">
				<span id="fisrt_info">큐레이션 중심, 메타데이터 분석 기반 서비스로<br/>미술작품과 가까워질 수 있어요.</span>
				<table>
					<colgroup>
						<col style="width: 20%" />
						<col style="width: 80%" />
					</colgroup>
					<tr>
						<th>성별</th>
						<td>
							<button type="button" id="gender_male" class="gender" onclick="javascript:gender_chg('male')">남</button>
							<button type="button" id="gender_female" class="gender" onclick="javascript:gender_chg('female')">여</button>
						</td>
					</tr>
					
					<tr>
						<th>연령대</th>
						<td>
							<select id="age_select">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>지역</th>
						<td>
							<select id="area_select">
								<option value="0">서울</option>
								<option value="1">부산</option>
								<option value="2">대구</option>
								<option value="3">인천</option>
								<option value="4">광주</option>
								<option value="5">대전</option>
								<option value="6">울산</option>
								<option value="7">세종</option>
								<option value="8">강원</option>
								<option value="9">경기</option>
								<option value="10">경남</option>
								<option value="11">경북</option>
								<option value="12">전남</option>
								<option value="13">전북</option>
								<option value="14">제주</option>
								<option value="15">충남</option>
								<option value="16">충북</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="content_favor">
				<div class="favor_header">
					<span>마음에 드는 작품을 선택해 주세요.</span>
				</div>
				<div class="favor_content">
					<div class="img_wrap" id="tag1">
						<img class="img_margin" src="http://www.art-map.co.kr/img/fav/1.png" onClick="(fav('1', '1'))"/>
						<img src="http://www.art-map.co.kr/img/fav/2.png" onClick="(favo('2', '1'))"/>
						<br/>
						<img class="img_margin" src="http://www.art-map.co.kr/img/fav/3.png" onClick="(fav('3', '1'))"/>
						<img src="http://www.art-map.co.kr/img/fav/4.png" onClick="(favo('4', '1'))"/>
					</div>
				</div>
			</div>
		

		<button type="button" id="next_btn" onClick="javascript:location.href='<%= request.getContextPath()%>/joinEndTwo.at'">확인</button>
		</div>
	</div>
</body>