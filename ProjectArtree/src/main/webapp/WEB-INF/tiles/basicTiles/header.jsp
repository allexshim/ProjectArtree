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
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Service) */
.dropdown-content {
  font-weight: bold;
  text-align: left;
  font-size: 20px;
  margin: 15px 0 0 20px;
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
.dropdown-content-R1 {
  font-weight: bold;
  text-align: center;
  font-size: 12px;
  margin: 50px 0 0 0;
  -webkit-transform:translate(12px,0);
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  
}

/* Links inside the dropdown */
.dropdown-content-R1 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content-R1 {
	display: block;
	z-index: 100;
	
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content-R2 {
  font-weight: bold;
  text-align: center;
  font-size: 12px;
  margin: 50px 0 0 0;
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  -webkit-transform:translate(-5px,0);
  
}

/* Links inside the dropdown */
.dropdown-content-R2 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content-R2 {
	display: block;
	z-index: 100;
	
}

.loginNadmin {
	padding-top: 10px;
}


	

</style>

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
			
			<div class="dropdown" >
				  <a class="dropbtn login" style="padding-top: 0px; -webkit-transform:translate(20px,0);"><img src="<%= ctxPath %>/resources/images/main/mainheader-account-login.png" /></a>
				  <div class="dropdown-content-R1">
				    <a href="#">로그인</a>
				    <a href="<%=ctxPath%>/join.at">회원가입</a>
				    
				    <a href="#">로그아웃</a>
				    
				  </div>
				  
				  
			</div>
			<div class="dropdown" >
				 	<a class="dropbtn menu" style="padding-top: 0px; -webkit-transform:translate(20px,0);"><img src="<%= ctxPath %>/resources/images/main/mainheader-menu.png" /></a>
				    <div class="dropdown-content-R2">
				    
					    <a href="<%=ctxPath%>/mypage.at">마이페이지</a>
					    
					    <a href="<%=ctxPath%>/admin.at">관리자페이지</a>
				    
				  </div>
			</div>	  
		</div>
	</div>


