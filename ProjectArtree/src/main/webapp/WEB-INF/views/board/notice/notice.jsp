<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	.M1 {
		-webkit-transform:translate(-10px,0);
	}
	
	#noticeContainer {
		
		padding-bottom: 300px;
	}
	
	
	
	img#boardtop {
		/* position : absolute; */
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		margin-bottom: 100px;
		padding-top : 50px;
		width : 500px;
		text-align: left;
		padding-left : 200px;
	}
	
	div#topText span {
		font-size : 15pt;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}
	
	div#topText > h4 {
		display : inline-block;
		margin-right : 30px;
		padding-top : 20px;
		font-weight : bold;
		color : gray;
		cursor : pointer;
	} 
	
	div#topText .current {
		color : black;
	}
	
	/* 공지 추가, 삭제 버튼 */	
	div#btns {
		padding-right : 200px;
		margin-bottom: 40px;
	}
	
	div#btns img {
		padding-right : 10px;
	}
	
	/* 공지 추가, 삭제하기 */
	#addNoticeContainer {
		
		padding-left : 200px;
		padding-top : 20px;
	}
	
	#notTitle, .fa-plus {
		font-size : 25px;
		font-weight : bold;
		color : black;
	}
	
	input::placeholder {
		color:black;
	}
	
	#notTitle, #notContent {
		border : none;
	}
	
	#notContent {
		font-size : 12pt;
		width : 650px;
		height : 200px;
		resize : none;
	}
	
	#addBtn {
		cursor : pointer;
	}
	
	#backBtn {
		cursor: pointer;
	}

	/* 공지 내용 */
	div#noticeList {
		padding-top : 10px;
		padding-left : 200px;
		padding-bottom : 0;
	}
	
	.noticeTitle {
		font-size: 16pt;
		font-weight : bold;
		cursor : pointer;
	}
	
	.singleNotice {
		padding-top : 10px;
		padding-bottom : 10px;
	}
	
	.showContent {
		display : show;
	}
	
	#addNotice {
		cursor: pointer;
	}
	
	#removeNotice {
		cursor: pointer;
	}
	
	#backNotice {
		cursor: pointer;
	}
	
	/* == 페이징 바 == */
	.pageNumber {
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
	  margin-top: 100px;
	  display: block;
	}
	
	.pagination a {
	  color: black;
	  padding: 3px 10px;
	  text-decoration: none;
	  cursor : pointer;
	  margin : 0 10px;
	}
		
	.pagination span.active {
	 	border : solid 2px black;
	 	color: black;
		padding: 3px 10px;
		text-decoration: none;
		cursor : pointer;
		margin : 0 10px;
		font-size: 16px; 
		font-weight: bold;  
	}
		
	.pagination a:hover, .pagination span:hover {
	   text-decoration: underline;
	}
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		
		$(".noticeContent").hide();
		$("#addNoticeContainer").hide();
		$("#backNotice").hide();
		
		// 공지사항/자주묻는 질문 버튼 hover 효과
		$("div#topText > h4").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		// 공지사항/자주묻는 질문 버튼 선택 
		$("div#topText > h4").click(function(){
			$("div#topText > h4").removeClass("current");
			$(this).addClass("current");
		});
		
		// 공지 추가/삭제 버튼 hover 효과
		$("div#btns img").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		// 공지 추가하기 -------------------------------------------
		$("#addNotice").click(function(){
			// 추가하는 form이 보인다.
			$("#addNoticeContainer").show();
		});
		
		$("#addBtn").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		$("#backBtn").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		
		// 새 공지를 작성 후 add를 클릭하면 유효성 검사 후 submit
		$("#addBtn").click(function(){
			
			if(confirm("공지를 등록 하시겠습니까?") == true){
				
				if($("#notTitle").val().trim() == ""){
					alert("제목을 입력하세요!");
					$("#notTitle").focus();
				}
				else if($("#notContent").val().trim() == ""){
					alert("내용을 입력하세요!");
					$("#notContent").focus();			
				}
				else {
					
					var frm = document.newNotice;
					frm.method = "POST";
					frm.action = "<%=ctxPath%>/addNotice.at";
					frm.submit();
					
				}
			}
			else {
				return;
			}
		}); // 공지 추가 하기 끝 --------------------------------
		
		$("#backBtn").click(function(){
			if(confirm("취소 하시겠습니까?") == true){
				$("#addNoticeContainer").hide();
			}
			else {
				return;
			}
		});
		
		// 공지 삭제하기 --------------------------------------
		$("#removeNotice").click(function(){
			$("#backNotice").show();
			$(this).hide();
			
			$(".arrow").toggleClass("fa-chevron-down");
			$(".arrow").toggleClass("fa-times");
		});
		
		$("#backNotice").click(function(){
			$("#removeNotice").show();
			$(this).hide();
			
			$(".arrow").toggleClass("fa-chevron-down");
			$(".arrow").toggleClass("fa-times");
		});
		
		$(".arrow").click(function(){
			if(confirm("공지를 삭제하시겠습니까?") == true){
				// delete 모드일때만 삭제 가능하다.
				if($(this).hasClass("fa-times")){
					var notNo = $(this).next().text();
					window.location.href = "<%=ctxPath%>/delNotice.at?notNo="+encodeURI(notNo);
					// 해당 url로 이동해서 글 삭제, 이후 다시 notice.at으로 보내주면 새로고침 되게 하면 됩니다.
				}
			}
			else{
				return;
			}
		});
		
		// 공지 삭제하기 끝 -----------------------------------
		
		// 각 공지 제목 hover 효과
		$(".noticeTitle").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		$(".noticeTitle").click(function(){
			$(this).next().toggle(); // 클릭하면 보이고, 보이지 않게 한다.
			$(this).find("i").toggleClass("fa-chevron-down");
			$(this).find("i").toggleClass("fa-chevron-up");
		});
		
		
		 
	}); // end of document.ready ---------------------------------------

	
	
</script>
</head>
<body>
	<div id="noticeContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage5.jpg" />
		</div>

		<div id="topText">
			<span style="text-align:center">Membership</span>
			<h1 style="margin:0;">Notice</h1>
			<h4 class="current">공지사항</h4>
			<h4 >자주 묻는 질문</h4>
		</div>
		<c:if test="${sessionScope.loginuser.status == 2}">
			<div id="btns" align="right">
				<img id="addNotice" src="<%= ctxPath %>/resources/images/board/addNoticeBtn.JPG" />
				<img id="removeNotice" src="<%= ctxPath %>/resources/images/board/deleteNoticeBtn.JPG" />
				<img id="backNotice" src="<%= ctxPath %>/resources/images/board/backNoticeBtn.JPG" />
			</div>
		</c:if>
		<!--  add 버튼을 누르면 나타나는 공지 추가하기  -->
		<div id="addNoticeContainer">
			<form id="newNotice" name="newNotice">
				<span>
					<i class="fas fa-plus"></i>
					<input type="text" name="notTitle" id="notTitle" placeholder="제목을 입력하세요." /><br/>
					<textarea name="notContent" id="notContent" placeholder="내용을 입력하세요."></textarea>
				</span>
				<div align="center">
					<img onclick="" id="addBtn" src="<%= ctxPath %>/resources/images/board/addBtn.JPG" />
					<img onclick="" id="backBtn" src="<%= ctxPath %>/resources/images/board/backNoticeBtn.JPG" />
				</div>
				
			</form>
		</div>
	
		<c:forEach var="item" items="${noticeList}">
			<div id="noticeList">
				<div class="singleNotice">
					<span class="noticeTitle"> ${item.notTitle}
					 <i class="arrow fas fa-chevron-down"></i>
					 <span class="noticeNo" style="display:none;">${item.notNo}</span>
					 </span>
					<div class="noticeContent" style="width:60%;">
						${item.notContent}
						
						<br/><br/><br/><br/><br/>
						<p>작성일 : ${item.NOTWRITEDAY}</p>
					</div>	
				</div>
			</div>
		</c:forEach>
		
		<!-- 페이징바  -->
		<div class="pagination" align="center">
			${pageBar}
		</div>
	</div>
</body>
</html>