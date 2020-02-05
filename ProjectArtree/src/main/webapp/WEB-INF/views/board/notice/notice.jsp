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
	
	
	img#boardtop {
		/* position : absolute; */
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		
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
	
	.tabtitle {
		
	} 
	
	/* 공지 추가, 삭제 버튼 */	
	div#btns {
		margin-top: 50px;
		text-align: right;
		margin-bottom: 40px;
	}
	
	div#btns img {
		padding-right : 10px;
	}
	
	/* 공지 추가, 삭제하기 */
	#addNoticeContainer {
		margin-bottom: 100px;
		border-top: solid 2px black;
		border-bottom: solid 2px black;
		padding-left : 0;
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
	div.noticeList {
		padding-top : 10px; 
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
	
	.tabWrap { width: 1200px; min-height: 700px; margin-top: 30px;}
	.tab_Menu { border-bottom: solid 2px #f3f3f3; margin: 0px; padding: 0px; list-style: none; }
	.tab_Menu::after {content: '';display:table;clear:both;overflow:hidden;visibility:hidden;}
	.tabMenu { width: 150px; margin: 0px; text-align: left; cursor: pointer;
			   padding-top: 10px; padding-bottom: 10px; float: left; }
		.tabMenu a { font-size: 15pt;
					 font-weight : bold;
					 color: black;
					 text-decoration: none;
					 cursor : pointer; }
	.tab_Content_Wrap::after {content: '';display:table;clear:both;overflow:hidden;visibility:hidden;}
	.tabPage { width: 1200px; float: left; padding-top: 30px; }
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		
		$(".noticeContent").hide();
		$("#addNoticeContainer").hide();
		$("#backNotice").hide();
		$(".faqList").hide();
		
		// 공지 추가/삭제 버튼 hover 효과
		$("div#btns img").hover(function(){
			$(this).css('opacity','0.8');
		}, function(){
			$(this).css('opacity','1.0');
		});
		
		$(".tabMenu").click(function(){
	         $(".tabMenu").css('opacity','0.3');
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
				else if($(':radio[name="notCategory"]:checked').length < 1){
					alert("공지 종류를 선택하세요!");
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
			if(confirm("작성을 취소 하시겠습니까?") == true){
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
			
			// delete 모드일때만 삭제 가능하다.
			if($(this).hasClass("fa-times")){
				if(confirm("공지를 삭제하시겠습니까?") == true){
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
		
		// 슬라이드 토글 이렇게 햇단말이죵
		var $noticeTitle = $(".noticeTitle");
		$noticeTitle.click(function(){
			var $this = $(this);
			
			$noticeTitle.each(function() {
				$(this).not($this).next().slideUp(500);
			}).promise().then(function() {
				$this.next().slideToggle(500); // 클릭하면 보이고, 보이지 않게 한다.
			});
			$this.find("i").toggleClass("fa-chevron-down");
			$this.find("i").toggleClass("fa-chevron-up");
		});
		
		 
	}); // end of document.ready ---------------------------------------

	
	function tabSetting() {
		// 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
		$('.tabPage').hide();
		$($('.current').find('a').attr('href')).show();

		// Tab 메뉴 클릭 이벤트 생성
		$('li').click(function (event) {
			var tagName = event.target.tagName; // 현재 선택된 태그네임
			var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
			var currentLiTag = $('li[class~=current]'); // 현재 current 클래스를 가진 탭
			var isCurrent = false;  
			
			// 현재 클릭된 탭이 current를 가졌는지 확인
			isCurrent = $(selectedLiTag).hasClass('current');
			
			// current를 가지지 않았을 경우만 실행
			if (!isCurrent) {
				$($(currentLiTag).find('a').attr('href')).hide();
				$(currentLiTag).removeClass('current');

				$(selectedLiTag).addClass('current');
				$($(selectedLiTag).find('a').attr('href')).show();
			}

			return false;
		});
	}

	$(function () {
		// 탭 초기화 및 설정
		tabSetting();
	});
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
			<div class="tabWrap">
				<ul class="tab_Menu">
					<li class="tabMenu current" style="opacity: 1.0;">
						<a class="tabTitle" href="#tabContent01" >공지 사항</a>
					</li>
					<li class="tabMenu" style="opacity: 0.3;">
						<a class="tabTitle" href="#tabContent02" >자주 묻는 질문</a>
					</li>
				</ul>
				
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
					<div class="category">
						<input type="radio" name="notCategory" value="1" /> 공지
						<input type="radio" name="notCategory" value="2" /> FAQ
					</div>
					<div align="left" style="margin-top: 50px; margin-bottom: 50px;">
						<img onclick="" id="addBtn" src="<%= ctxPath %>/resources/images/board/addBtn.JPG" />
						<img onclick="" id="backBtn" src="<%= ctxPath %>/resources/images/board/backNoticeBtn.JPG" />
					</div>
					
				</form>
			</div>
				
				<div class="tab_Content_Wrap">
					<div id="tabContent01" class="tabPage">
						<c:forEach var="item" items="${noticeList}">
							<c:if test="${item.notCategory == '1'}">
								<div class="noticeList">
									<div class="singleNotice">
										<span class="noticeTitle"> ${item.notTitle}
										 <i class="arrow fas fa-chevron-down"></i>
										 <span class="noticeNo" style="display:none;">${item.notNo}</span>
										 </span>
										<div class="noticeContent" style="width:60%; margin-top: 30px; border-bottom: solid 1px black;">
											${item.notContent}
											
											<br/><br/>
											작성일시 : ${item.notWriteday}
											<br/><br/>
										</div>	
									</div>
								</div>
							</c:if>
						</c:forEach>
			
			<!-- 페이징바  -->
			<div class="pagination" align="center">
				${pageBar}
			</div>
					</div>
					<div id="tabContent02" class="tabPage">
						<c:forEach var="item" items="${faqList}">
							<c:if test="${item.notCategory == '2'}">
								<div class="noticeList">
									<div class="singleNotice">
										<span class="noticeTitle"> ${item.notTitle}
										 <i class="arrow fas fa-chevron-down"></i>
										 <span class="noticeNo" style="display:none;">${item.notNo}</span>
										 </span>
										<div class="noticeContent" style="width:60%; margin-top: 30px; border-bottom: solid 1px black;">
											${item.notContent}
											
											<br/><br/>
										</div>	
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
			
	</div>
</body>
</html>