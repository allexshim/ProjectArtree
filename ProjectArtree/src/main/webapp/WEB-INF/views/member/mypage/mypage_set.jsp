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
		height: 1361px;
		margin: 0 auto;
	}
	
	ul {
		padding: 0;
		list-style: none;
	}
	
	div.myPage_header {
		display: inline-block;
		width: 100%;
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

	/* 테이블 */
	table.setting_tbl {
		width: 100%;
		height: 100%;
	}

	table.setting_tbl th {
		padding: 30px 0;
		vertical-align: top;
	}
	
	table.setting_tbl td {
		padding: 30px;
	}
	
	table.setting_tbl h2 {
		font-size: 25px;
		margin: 0px;
	} 
	
	tr.favor_set span {
		font-weight: normal;
		font-size: 13px;
	}
	
	tr input {
		width: 580px;
		height: 37px;
		margin-right: 10px;
		border: 1px solid #e2e2e2;
		padding: 10px;
	}
	
	tr button {
		font-size: 15.5px;
		width: 120px;
		background-color: #000;
		color: #fff;
		padding: 9px 15px;
		text-align: center;
		outline: none;
		border: none;
		height: 37px;
		vertical-align: top;
	}
	
	/* 취향분석 재설정 */
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
	
	

	/* 비밀번호 */
	tr.password_set label {
		display: block;
		font-size: 16px;
		font-weight: normal;
	}
	
	/* 회원탈퇴 */
	tr.status_set label {
		display: block;
		font-size: 16px;
		font-weight: normal;
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
			$("#mySetting").addClass("on");
		});
	
	});
	
	function fav(n,s){

		if(s == "1"){

			var tag1 = n;
			$("#tag1").hide();
			$("#tag2").show();
			$("#tagA").css("background-image","url('http://www.art-map.co.kr/img/fav/"+tag1+"A.png')");
			$("#tagB").css("background-image","url('http://www.art-map.co.kr/img/fav/"+tag1+"B.png')");
			$("#tagC").css("background-image","url('http://www.art-map.co.kr/img/fav/"+tag1+"C.png')");
			$("#tagD").css("background-image","url('http://www.art-map.co.kr/img/fav/"+tag1+"D.png')");
			$("#tagA").attr("onclick","fav('"+tag1+"A','2')");
			$("#tagB").attr("onclick","fav('"+tag1+"B','2')");
			$("#tagC").attr("onclick","fav('"+tag1+"C','2')");
			$("#tagD").attr("onclick","fav('"+tag1+"D','2')");

		} else {

			var param = JSON.stringify({"tag1":n.substring(0,1),"_id":userid,"tag2":n});
			$.post("/data/info.php",param,function(data){
				var res = JSON.parse(data);

				console.log(res.result);

				if(res.result){
					alert("변경되었습니다.");
					location.reload();
				}
			});
		}

	}
</script>

<body>
	<div class="myPage_wrap">
	<div class="myPage_header">
		<h1 class="header_name">사용자 이름</h1>
		<nav class="myPage_tabs">
			<a href="/artree/mypage.at" class="tab">My Artmap</a>
			<a href="/artree/mypage_order.at" class="tab">주문내역</a>
			<a href="/artree/mypage_set.at" class="tab on" id="mySetting">설정</a>
			<div class="tab_last"></div>
		</nav>
	</div>
	<div class="myPage_content">
		<table class="setting_tbl">
			<colgroup>
				<col style="width: 20%;"/>
				<col style="width: 80%;"/>
			</colgroup>
		
				<tr class="favor_set">
					<th>
						<h2 style="margin-bottom: 30px;">취향분석 설정</h2>
						<span>마음에 드는 작품을 골라 주세요</span>
					</th>
					<td>
						<div class="img_wrap" id="tag1">
							<img class="img_margin" src="http://www.art-map.co.kr/img/fav/1.png" onClick="(fav('1', '1'))"/>
							<img src="http://www.art-map.co.kr/img/fav/2.png" onClick="(favo('2', '1'))"/>
							<br/>
							<img class="img_margin" src="http://www.art-map.co.kr/img/fav/3.png" onClick="(fav('3', '1'))"/>
							<img src="http://www.art-map.co.kr/img/fav/4.png" onClick="(favo('4', '1'))"/>
						</div>

						<div style="margin-top:30px; width:582px; float:left; display:none;" id="tag2">
							<div style=" margin-right:22px;  margin-bottom:22px;  background-size:cover; background-position:center"  id="tagA"></div>
							<div style="background-size:cover; background-position:center" onclick="fav('B','2')" id="tagB"></div>
							<div style="margin-right:22px; background-size:cover; background-position:center" onclick="fav('C','2')" id="tagC"></div>
							<div style="background-size:cover; background-position:center" onclick="fav('D','2')" id="tagD"></div>
						</div>
					</td>
				</tr>
				<tr class="name_set">
					<th><h2>닉네임</h2></th>
					<td>
						<input type="text"/>
						<button type="button" id="name_change">변경</button>
					</td>
				</tr>
				<tr class="password_set">
					<th><h2>비밀번호 설정</h2></th>
					<td>
						<label>현재 비밀번호</label>
						<input type="text" style="margin-bottom: 10px;"/>
						<label>변경 비밀번호</label>
						<input type="text"/>
						<button type="button" id="password_change">비밀번호변경</button>
					</td>
				</tr>
				<tr class="status_set">
					<th><h2>회원탈퇴</h2></th>
					<td>
						<label>탈퇴사유</label>
						<input type="text"/>
						<button type="button" id="password_change">회원탈퇴</button>
					</td>
				</tr>
		</table>
	</div>	
	</div>
	
</body>

