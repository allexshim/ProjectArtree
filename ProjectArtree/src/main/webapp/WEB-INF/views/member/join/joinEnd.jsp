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

/* ===== 회원가입 완료 첫 번째 페이지 ===== */
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
button#gender_1 { 
	float: left;
	width: 50%;
	cursor: pointer;
	font-weight: bold;
	height: 40px;
	background-color: #fff;
	color: #757575;
	border: 1px solid #e7e7e7;
}

button#gender_2 {
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
	border: 5px solid black;
}

div.display {
	display: none;
}

img.img_margin {
	margin-right: 22px;
}


/* 확인 버튼 */
#confirm_btn {
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

/* ===== 회원가입완료 두 번째 페이지 ===== */
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

	$(function() {
		
		$("#agegroup").val(${loginuser.getAgegroup()});
		$("#area").val('${loginuser.getArea()}');
		 
		$("#age_select").click(function() {
			$("#agegroup").val($("#age_select option:selected").val());
		});
		
		$("#area_select").click(function() {
			$("#area").val($("#area_select option:selected").val());
		});
		
		
	}); // end of function() --------------

// 성별 선택하면 css 변경
function gender_chg(g) {
	$(".gender").removeClass("on");
	$("#gender_"+g).addClass("on");
	$("#gender").val(g);
}

// 작품 선택1, 작품 선택2
// favor_step1 (tagImg 뒤에 올 숫자, exhibitionno, galleryno)
function favor_step1(n, e, g) {
	$("#exhibitionno1").val(e);
	$("#galleryno1").val(g);
	$("#tagImg").fadeOut( 300 );
	setTimeout(function(){ $("#tagImg"+n).fadeIn( 300 ); }, 300);
}

// favor_step2 (exhibitionno, galleryno)
function favor_step2(e, g){
	$("#exhibitionno2").val(e);
	$("#galleryno2").val(g);
	$("#comp").html("'확인'을 눌러 완료해 주시기 바랍니다.");
}

// 작품 선택1, 2 완료하면 선택한 작품 보여주기
function confirm() {
	// 성별, 나이대, 지역 다 선택했는지 확인
	var gender = $("#gender").val();
	var agegroup = $("#age_select :selected").val();
	var area = $("#area").val();
	var exhibitionno1 = $("#exhibition1").val();
	var galleryno1 = $("#galleryno1").val();
	var exhibitionno2 = $("#exhibition2").val();
	var galleryno2 = $("#galleryno2").val();
	
	if(!gender) {
		alert("성별을 선택해 주세요!");
		return false;
	}
	
	if(!agegroup) {
		alert("연령대를 선택해 주세요!");
		return false;
	}
	
	if(!area) {
		alert("지역을 선택해 주세요!");
		return false;
	}
	
	if(!(exhibitionno1 || galleryno1 || exhibitionno2 || galleryno2)) {
		alert("작품을 선택해 주세요!sdfsdf");
		return false;
	}

	var join_data = $("form[name=joinFinalForm]").serialize(); // form 태그에 있는 모든 것들이 name을 가지고 간다.
	   
   $.ajax({
	  url:"<%= request.getContextPath()%>/joinEndInsert.at",
	  data:join_data,
	  type:"POST",
	  dataType:"JSON",
	  success:function(json){
		  var html = "";
		  
		  
		  
		  console.log(json.myFavorList.length());
		  
		  $("#st1").css("display", "none");
		  $("#st2").css("display", "");
		  
		 
		  
		  $.each(json, function(index){
			  console.log(index);
			  html += "<div class='pickImg_wrap'>";
			  html += "<img src='"+json.myFavorList[index]["image1"]+"'/>";
			  html += "</div>";
			  html += "<div class='pick_desc'>";
			  html += "<span>"+json.myFavorList[index]["exhibitionname"]+"</span>";
			  html += "<span>"+json.myFavorList[index]["author"]+"</span>";
			  html += "</div>";
		  
		  $(".pick").html(html);
		  
		});
	  },
	  
	  error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	  }
	  
	  
   }); // end of ajax
}

</script>

<body>
	<div class="container_joinEnd" align="center">
		<%-- ========================================================================= -->
		<%-- 회원가입완료 처음 페이지 --%>
		<div class="joinEnd_wrap" id="st1">
			<div class="joinEnd_header">
				<span>${loginuser.getName()}님, 환영합니다.</span>
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
							<button type="button" id="gender_1" class="gender" onclick="javascript:gender_chg(1)">남</button>
							<button type="button" id="gender_2" class="gender" onclick="javascript:gender_chg(2)">여</button>
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
								<option value="서울">서울</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="인천">인천</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="세종">세종</option>
								<option value="강원">강원</option>
								<option value="경기">경기</option>
								<option value="경남">경남</option>
								<option value="경북">경북</option>
								<option value="전남">전남</option>
								<option value="전북">전북</option>
								<option value="제주">제주</option>
								<option value="충남">충남</option>
								<option value="충북">충북</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="content_favor" id="set_favor">
				<div class="favor_header">
					<span>마음에 드는 작품을 선택해 주세요.</span>
				</div>
				<div id="comp" style="text-align:center; font-weight:500; font-size:13px; margin-top:15px; color:#005766;"></div>
				<%-- 첫 번째 작품설정 --%>
				<div class="favor_content1">
				<div class="img_wrap" id="tagImg">
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/1.png" onClick="favor_step1(1, '1066', '983')"/>
                  <img src="<%= ctxPath%>/resources/images/member/2.png" onClick="favor_step1(2, '1094', '2007')"/>
                  <br/>
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/3.png" onClick="favor_step1(3, '1240', '9')"/>
                  <img src="<%= ctxPath%>/resources/images/member/4.png" onClick="favor_step1(4, '1367', '2583')"/>
               </div>
               
               <%-- 두 번째 작품설정 --%>
               <div class="img_wrap display" id="tagImg1">
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/1A.png" onClick="favor_step2('1096', '2023')"/>
                  <img src="<%= ctxPath%>/resources/images/member/1B.png" onClick="favor_step2('1229', '339')"/>
                  <br/>
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/1C.png" onClick="favor_step2('1332', '725')"/>
                  <img src="<%= ctxPath%>/resources/images/member/1D.png" onClick="favor_step2('1353', '1126')"/>
               </div>
               
               <div class="img_wrap display" id="tagImg2">
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/2A.png" onClick="favor_step2('1218', '722')"/>
                  <img src="<%= ctxPath%>/resources/images/member/2B.png" onClick="favor_step2('1296', '298')"/>
                  <br/>
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/2C.png" onClick="favor_step2('1374', '270')"/>
                  <img src="<%= ctxPath%>/resources/images/member/2D.png" onClick="favor_step2('1418', '272')"/>
               </div>
               
               <div class="img_wrap display" id="tagImg3">
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/3A.png" onClick="favor_step2('1077', '459')"/>
                  <img src="<%= ctxPath%>/resources/images/member/3B.png" onClick="favor_step2('1241', '45')"/>
                  <br/>
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/3C.png" onClick="favor_step2('1380', '725')"/>
                  <img src="<%= ctxPath%>/resources/images/member/3D.png" onClick="favor_step2('1509', '9')"/>
               </div>
               
               <div class="img_wrap display" id="tagImg4">
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/4A.png" onClick="favor_step2('1088', '312')"/>
                  <img src="<%= ctxPath%>/resources/images/member/4B.png" onClick="favor_step2('1216', '267')"/>
                  <br/>
                  <img class="img_margin" src="<%= ctxPath%>/resources/images/member/4C.png" onClick="favor_step2('1328', '267')"/>
                  <img src="<%= ctxPath%>/resources/images/member/4D.png" onClick="favor_step2('1506', '864')"/>
               </div>
               </div>
            	
               <button type="button" id="confirm_btn" onClick="confirm()">확인</button>
			</div>
	</div>	
	
	<%-- ========================================================================= -->
	<%-- 작품설정 완료 후 회원가입완료 두 번째 페이지 --%>
	<div class="joinEnd_wrap" id="st2" style="display: none;">
		<div class="favor_content2">
			<div class="joinEndTwo_header">
				<h2>선택작품으로 분석된 회원님의 취향입니다.</h2>
			</div>
			<div class="joinEndTwo_content">
				
				
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
	<form name="joinFinalForm">
		<input type="text" name="finalGender" id="gender"/>
		<input type="text" name="finalAgegroup" id="agegroup"/>
		<input type="text" name="finalArea" id="area"/>
		<input type="text" name="exhibitionno1" id="exhibitionno1">
		<input type="text" name="galleryno1" id="galleryno1">
		<input type="text" name="exhibitionno2" id="exhibitionno2">
		<input type="text" name="galleryno2" id="galleryno2">
	</form>
		
		</div>
</body>