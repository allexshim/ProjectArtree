<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
/* header */
html,body{
	font-family: 'Noto Sans Kr', sans-serif !important; 
}

	#myheader a.header-nav {
	  font-weight: bold;
	  text-align: center;
	  margin: 20px;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 20px;
	  color: black;
	}

	#myheader a.logo {
	  -webkit-transform:translate(0,-10px);
	  z-index: 1000;
	  float: left;
	  text-align: left;
	  text-decoration: none;
	}
	
	#myheader a.login {
		text-decoration: none;
		color: white;
		margin: 0 10px 0 20px;
		float: right;
	}
	
	#myheader a.menu {
		text-decoration: none;
		color: white;
		margin: 0 10px 0 0;
		float: right;
	}
	
	/* Dropdown Button */
.dropbtn {
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}
.dropbtn:hover{
	border-bottom: solid 2px #f2f2f2;
}



/* The container <div> - needed to position the dropdown content */
.dropdown {
  cursor: pointer;
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Service) */
.M1 {
  -webkit-transform:translate(10px,10px);
  font-weight: bold;
  text-align: left;
  font-size: 20pt;
  margin: 15px 0 20px 20px;
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  border-radius: 0px;
  
}

.dropdown-a1 {
	font-size: 20px;
	color: black;
    padding: 12px 30px;
    text-decoration: none;
    display: block;
}


/* Dropdown Content (Hidden by Default) */
.dropdown-content-R1 {
  font-weight: bold;
  text-align: center;
  font-size: 12px;
  -webkit-transform:translate(-25px,-10px);
  display: none;
  position: absolute;
  background-color: white;
  width: 50px;
  
}

/* Links inside the dropdown */
.dropdown-content-R1 a {
  text-align: center;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Dropdown Content (Hidden by Default) */
.dropdown-content-R2 {
  font-weight: bold;
  text-align: center;
  font-size: 12px;
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  -webkit-transform:translate(-45px,-10px);
  border: solid 1px #f2f2f2;
  margin-left: 30px;
  
}

.menu .dropdown-menu {
	min-width: 70px;
}

/* Links inside the dropdown */
.dropdown-content-R2 a {
  text-align: center;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.loginNadmin {
	padding-top: 10px;
}


/* 로그인 스타일 적용 */
.layer {
	position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1000;
}

.layer .bg {
	width: 100%;
	height: 100%;
	background-color: black;
	opacity: 0.8;
}

.pop {
    position: absolute;
    top: 38%;
    left: 38%; 
    width: 400px;
    height: auto;
    z-index: 100;
}

.pop .pop-conts input {

    width: 380px;
    float: left;
    height: 60px;
    background-color: transparent;
    text-align: center;
    border: 1px solid #fff;
    margin-bottom: 10px;
    font-size: 16px;
    color: white;
}

.pop .pop-conts input::placeholder {
	color: white;
}

a.find_btn {
	float: left;
    margin-top: 5px;
    font-size: 14px;
    color: #fff;
    text-decoration: none !important;
}

a.find_btn:hover {
    color: #fff;
}

input#login_btn {
	float: left;
	width: 380px;
    cursor: pointer;
    background-color: #fce373;
    color: black;
    font-weight: bold;
    height: 60px;
    margin-top: 15px;
    font-size: 16px;
    border: none !important;
}

</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#password_login").keydown(function(key){			
		if(key.keyCode==13){
			$("#login_btn").click();
		}
	});
	
	$(".dropdown").hover(            
	        function() {
	            $('.dropdown-menu', this).not('.in .dropdown-menu').stop( true, true ).slideDown("300");
	            $(this).toggleClass('open');        
	        },
	        function() {
	            $('.dropdown-menu', this).not('.in .dropdown-menu').stop( true, true ).slideUp("200");
	            $(this).toggleClass('open');       
	        }
	    );
	
    
});


//============================ 로그인 스크립트 ============================
// 클릭하면 로그인 창 띄우기
function layer_open(el) {
	$("."+el).css("display", "");
	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg');
	if(bg){
		$('.'+el).fadeIn(); 
	} 
	
	$('.'+el+' .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		
			$('.'+el).fadeOut();
			e.preventDefault();
		
	});
}

// 로그인 버튼 클릭하면 로그인
function goLogin() {
	// 빈 칸 있는지 검사
	if( $("#email_login").val().trim() == "" ) {
		  alert("이메일을 입력해 주세요.");
		  $("#email_login").focus();
		  return;
	  }
	else if( $("#password_login").val().trim() == "" ) {
		 alert("비밀번호를 입력해 주세요.");
		 $("#password_login").focus();
		 return;
	}
	
	var frm = document.loginForm;
	  frm.method = "POST";
	  frm.action = "<%= request.getContextPath()%>/loginEnd.at";
	  frm.submit();
}

</script>

		<div class="row">
		<div class="col-sm-2"></div>
			<div class="col-sm-8" style="float: center;" id="bs-slide-dropdown">
				<a class="active header-nav" href="<%=ctxPath%>/galHome.at">GALLARY</a>
				<a class="header-nav" href="<%=ctxPath%>/exhHome.at">EXHIBITION</a>
				<a class="header-nav" href="<%=ctxPath%>/mainartree.at"><img style="height: 60px;" src="<%=ctxPath %>/resources/images/main/logo_black1.jpg" /></a>
				<a class="header-nav" href="<%=ctxPath%>/aboutbin.at">ABOUT ARTREE</a>
					<div class="dropdown">
					  <a class="dropbtn header-nav dropdown-toggle" data-toggle="dropdown">SERVICE</a>
					  <div class="dropdown-menu M1" role="menu">
					    <a class="dropdown-a1" href="<%=ctxPath%>/notice.at">Notice</a>
					    <a class="dropdown-a1" href="<%=ctxPath%>/reviewList.at">Review</a>
					    <a class="dropdown-a1" href="<%=ctxPath%>/previewList.at">Preview</a>
					    <a class="dropdown-a1" href="<%=ctxPath%>/eventList.at">Event</a>
					    <a class="dropdown-a1" href="<%=ctxPath%>/communityList.at">Community</a>
					  </div>
					</div>
			</div>
		 	<!-- 오른쪽메뉴 -->
		 <div class="loginNadmin col-sm-2" style="position: relative;">
			
			<div class="dropdown ddl" >
				  <a class="dropbtn login dropdown-toggle" data-toggle="dropdown" style=" padding-top: 0px; -webkit-transform:translate(0,0);">
				  	<img src="<%= ctxPath %>/resources/images/main/mainheader-account-login.png" />
				  </a>
				  <div class="dropdown-content-R1 dropdown-menu" role="menu">
				  	<c:if test="${sessionScope.loginuser == null}">
					    <a href="javascript:layer_open('layer')">로그인</a>
					    <a href="<%=ctxPath%>/join.at">회원가입</a>
					</c:if>
				    <c:if test="${sessionScope.loginuser != null}">
				    	<a href="<%=ctxPath%>/logout.at">로그아웃</a>
				    </c:if>
				  </div>
				  
				  
			</div>
			<div class="dropdown ddm" >
				 	<a class="dropbtn menu" data-toggle="dropdown" style="padding-top: 0px; -webkit-transform:translate(0,0);"><img src="<%= ctxPath %>/resources/images/main/mainheader-menu.png" /></a>
				    <div class="dropdown-content-R2 dropdown-menu" role="menu">
					    <a href="<%=ctxPath%>/mypage.at">마이페이지</a>
					    <a href="#">장바구니</a>
					    <c:if test="${sessionScope.loginuser.status == 2}">
					    	<a href="<%=ctxPath%>/admin.at">관리자페이지</a>
				    	</c:if>
				  </div>
			</div>	  
		</div>
	</div>

	<%-- 로그인 레이어 --%>
  	<div class="layer" style="display: none;">
  	<div class="bg"></div>
	<div id="layer" class="pop">
		<div class="pop-container">
		<div class="pop-conts">
		<div class="login_wrap">
			<form name="loginForm" id="loginForm">
			<div class="login_box">
				<input type="text" placeholder="이메일로 로그인" name="email_login" id="email_login" class="login_input"/>
				<input type="password" placeholder="비밀번호" name="password_login" id="password_login" class="login_input"/>
				
				<div class="login_find">
					<a href="/artree/idFind.at" class="find_btn">아이디 찾기&nbsp;&nbsp;|&nbsp;&nbsp;</a>
					<a href="/artree/passwordFind.at" class="find_btn">비밀번호 찾기</a>
				</div>
				<input type="button" id="login_btn" value="로그인" onClick="goLogin()"/>
			</div>
			</form>
		</div>
		</div>
		</div>
	</div>
</div> 
