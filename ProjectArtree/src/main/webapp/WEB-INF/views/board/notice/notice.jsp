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
	
	#reviewContainer {
		padding-bottom : 100px;
	}
	
	img#boardtop {
		/* position : absolute; */
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		padding-top : 50px;
		width : 500px;
		text-align: left;
		padding-left : 60px;
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
		padding-right : 30px;
	}
	
	div#btns img {
		padding-right : 10px;
	}
	
	/* 공지 추가, 삭제하기 */
	#addNoticeContainer {
		padding-left : 60px;
		padding-top : 20px;
	}
	
	#addTitle, .fa-plus {
		font-size : 25px;
		font-weight : bold;
		color : black;
	}
	
	input::placeholder {
		color:black;
	}
	
	#addTitle, #addContent {
		border : none;
	}
	
	#addContent {
		font-size : 12pt;
		width : 650px;
		height : 200px;
		resize : none;
	}
	
	#addBtn {
		cursor : pointer;
	}

	/* 공지 내용 */
	div#noticeList {
		padding-top : 40px;
		padding-left : 60px;
		padding-bottom : 100px;
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
		
		// 새 공지를 작성 후 add를 클릭하면 유효성 검사 후 submit
		$("#addBtn").click(function(){
			
			if($("#addTitle").val().trim() == ""){
				alert("제목을 입력하세요!");
				$("#addTitle").focus();
			}
			else if($("#addContent").val().trim() == ""){
				alert("내용을 입력하세요!");
				$("#addContent").focus();			
			}
			else {
				var frm = document.newNotice;
				frm.method = "POST";
				frm.action = "*.at";
				frm.submit();
			}
		}); // 공지 추가 하기 끝 --------------------------------
		
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
			// delete 모드일때만 삭제 가능하다.
			if($(this).hasClass("fa-times")){
				var noticeno = $(this).next().text();
				window.location.href = "*.at?noticeno="+encodeURI(noticeno);
				// 해당 url로 이동해서 글 삭제, 이후 다시 notice.at으로 보내주면 새로고침 되게 하면 됩니다.
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
			<h4>자주 묻는 질문</h4>
		</div>
		
		<div id="btns" align="right">
			<img id="addNotice" src="<%= ctxPath %>/resources/images/board/addNoticeBtn.JPG" />
			<img id="removeNotice" src="<%= ctxPath %>/resources/images/board/deleteNoticeBtn.JPG" />
			<img id="backNotice" src="<%= ctxPath %>/resources/images/board/backNoticeBtn.JPG" />
		</div>
		
		<!--  add 버튼을 누르면 나타나는 공지 추가하기  -->
		<div id="addNoticeContainer">
			<form id="newNotice" name="newNotice">
				<span>
					<i class="fas fa-plus"></i>
					<input type="text" name="addTitle" id="addTitle" placeholder="제목을 입력하세요." /><br/>
					<textarea name="addContent" id="addContent" placeholder="내용을 입력하세요."></textarea>
				</span>
				<div align="center">
					<img id="addBtn" src="<%= ctxPath %>/resources/images/board/addBtn.JPG" />
				</div>
			</form>
		</div>
		
		<div id="noticeList">
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent" style="width:80%;">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
		
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
			
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
			
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
			
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
			
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
			
			<div class="singleNotice">
				<span class="noticeTitle">공지사항공지사항공지사항공지공지사항공지사항공지사항공지
				 <i class="arrow fas fa-chevron-down"></i>
				 <span class="noticeNo" style="display:none;">"$ {noticeNo}"</span>
				 </span>
				<div class="noticeContent">
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다. 공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
					공지사항에 대한 자세한 설명을 볼수있습니다.공지사항에 대한 자세한 설명을 볼수있습니다.
				</div>	
			</div>
			
		</div>
		
	</div>
</body>
</html>