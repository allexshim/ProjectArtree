<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String ctxpath = request.getContextPath();
%>

<style type="text/css">
/* header */
.topnav {
  position: fixed;
  z-index: 2;
  display: inline-block;
  overflow-x: hidden;
  overflow-y: hidden;
  background-color: #333;
  text-align: center;
  width: 100%;
  height: 50px;
}

.topnav a.header-nav {
  text-align: center;
  margin: 30px;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 25px;
  color: white;
}

.topnav a.logo {
  z-index: 2;
  color: white;
  float: left;
  text-align: left;
  padding: 14px 16px;
  text-decoration: none;
}

.topnav a:hover {
  color: gray;
}
</style>

<div class="topnav" style="margin-bottom: 0;">
  <a class="logo">arTree</a>
  <a class="active header-nav" href="#">GALLARY</a>
  <a class="header-nav" href="#">EXHIBITION</a>
  <a class="header-nav" href="#">ABOUT ARTREE</a>
  <a class="header-nav" href="#">SERVICE</a>
  <a class="header-nav" href="#">MY</a>
</div>

