<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
/* header */
	.topnav {
	  padding-top: 10px;
	  border-bottom: solid 2px #f2f2f2;
	  margin-top: 0px;
	  z-index: 2;
	  display: inline-block;
	  overflow-x: hidden;
	  overflow-y: hidden;
	  text-align: center;
	  width: 100%;
	  height: 60px;
	}
	
	.topnav a.header-nav {
	  text-align: center;
	  margin: 20px;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 25px;
	  color: black;
	}
	
	.topnav a.logo {
	  z-index: 2;
	  float: left;
	  text-align: left;
	  padding: 14px 16px;
	  text-decoration: none;
	}
	
	.topnav a:hover {
	  color: gray;
	}
	
	.topnav a.login {
		
		text-decoration: none;
		color: white;
		margin: 0 20px 0 20px;
		float: right;
	}
</style>

<div class="topnav">
	<a class="logo">arTree</a>
	<a class="active header-nav" href="#">GALLARY</a>
	<a class="header-nav" href="#">EXHIBITION</a>
	<a class="header-nav" href="#">ABOUT ARTREE</a>
	<a class="header-nav" href="#">SERVICE</a>
	<a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-setting.png"/></a>
	<a class="login" href="#"><img src="<%= ctxPath %>/resources/images/main/mainheader-account-login.png" /></a>
	
</div>

