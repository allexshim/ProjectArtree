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
	
	div.display {
		display: none;
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
		
		updateSubmit();
	}
	
	// 두 번째 작품까지 선택하면 update 위한 ajax
	function updateSubmit() {
		var data = $("form[name=tagForm]").serialize();	
		
		$.ajax({
			url:"<%= request.getContextPath()%>/updateFavor.at",
			data:data,
			type:"GET",
			success:function(json){
				alert("변경되었습니다.");
				location.reload();
			},
			  
		    error: function(request, status, error){
		 		alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
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
						<div class="img_wrap" id="tagImg">
							<img class="img_margin" src="<%= ctxPath%>/resources/images/member/1.png" onClick="favor_step1(1, '1066', '983')"/>
			                <img src="<%= ctxPath%>/resources/images/member/2.png" onClick="favor_step1(2, '1094', '2007')"/>
			                <br/>
			                <img class="img_margin" src="<%= ctxPath%>/resources/images/member/3.png" onClick="favor_step1(3, '1240', '9')"/>
			                <img src="<%= ctxPath%>/resources/images/member/4.png" onClick="favor_step1(4, '1367', '2583')"/>
						</div>

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
               
		                 <div class="img_wrap display" class="tagImg" id="tagImg4">
		                    <img class="img_margin" src="<%= ctxPath%>/resources/images/member/4A.png" onClick="favor_step2('1088', '312')"/>
		                    <img src="<%= ctxPath%>/resources/images/member/4B.png" onClick="favor_step2('1216', '267')"/>
		                    <br/>
		                    <img class="img_margin" src="<%= ctxPath%>/resources/images/member/4C.png" onClick="favor_step2('1328', '267')"/>
		                    <img src="<%= ctxPath%>/resources/images/member/4D.png" onClick="favor_step2('1506', '864')"/>
		                 </div>
						
						
						<form name="tagForm">
							<input type="hidden" id="galleryno1" name="galleryno1"/>
							<input type="hidden" id="exhibitionno1" name="exhibitionno1"/>
							<input type="hidden" id="galleryno2" name="galleryno2"/>
							<input type="hidden" id="exhibitionno2" name="exhibitionno2"/>
						</form>
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

