<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
/* header */
	.topnav {
	  margin: 0 auto;
	  padding-top: 10px;
	  z-index: 2;
	  display: inline-block;
	  overflow-x: hidden;
	  overflow-y: hidden;
	  text-align: center;
	  width: 100%;
	  height: 60px;
	  overflow:visible; 
	  float: center;
	}
	
	.topnav a.header-nav {
	  font-weight: bold;
	  text-align: center;
	  margin: 20px;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 20px;
	  color: black;
	}

	.topnav a.logo {
	  -webkit-transform:translate(0,-10px);
	  z-index: 1000;
	  float: left;
	  text-align: left;
	  text-decoration: none;
	}
	
	.topnav a.login {
		text-decoration: none;
		color: white;
		margin: 0 20px 0 20px;
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
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  font-weight: bold;
  text-align: left;
  font-size: 20px;
  margin: 20px 0 0 20px;
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
	z-index: 100; 
	
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content-R {
  font-weight: bold;
  text-align: center;
  font-size: 15px;
  margin: 55px 0 0;
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  
}

/* Links inside the dropdown */
.dropdown-content-R a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content-R {
	display: block;
	z-index: 100;
	
}

.loginNadmin {
	padding-top: 10px;
}



</style>

<div  class="topnav" style="">
	<div class="row">
		<div class="col-sm-2"></div>
			<div class="col-sm-8" style="float: center;">
				<a class="active header-nav" href="<%=ctxPath%>/galList.at">GALLARY</a>
				<a class="header-nav" href="<%=ctxPath%>/exhList.at">EXHIBITION</a>
				<a class="header-nav" href="<%=ctxPath%>/mainartree.at"><img style="height: 60px;" src="<%=ctxPath %>/resources/images/main/logo_black1.jpg" /></a>
				<a class="header-nav" href="<%=ctxPath%>/aboutbin.at">ABOUT ARTREE</a>
					<div class="dropdown">
					  <a class="dropbtn header-nav">SERVICE</a>
					  <div class="dropdown-content">
					    <a href="<%=ctxPath%>/notice.at">Notice</a>
					    <a href="<%=ctxPath%>/reviewList.at">Review</a>
					    <a href="<%=ctxPath%>/previewList.at">Preview</a>
					    <a href="<%=ctxPath%>/eventList.at">Event</a>
					    <a href="<%=ctxPath%>/communityList.at">Cummunity</a>
					  </div>
					</div>
			</div>
		 	<!-- 오른쪽메뉴 -->
		 <div class="loginNadmin col-sm-2" style="position: relative;">
			
			<div class="dropdown" style="float: right;">
				  <a class="dropbtn login" style="padding-top: 0px;"><img src="<%= ctxPath %>/resources/images/main/mainheader-account-login.png" /></a>
				  <div class="dropdown-content-R">
				    <a href="<%=ctxPath%>/join.at">로그인</a>
				    <a href="<%=ctxPath%>/join.at">회원가입</a>
				    <a href="<%=ctxPath%>/mypage.at">마이페이지</a> 
				  </div>
			</div>
		</div>
	</div>
</div>

