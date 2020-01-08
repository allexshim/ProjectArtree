<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String cxtpath = request.getContextPath();
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
  <a class="active header-nav" href="#">Home</a>
  <a class="header-nav" href="#">News</a>
  <a class="header-nav" href="#">Contact</a>
  <a class="header-nav" href="#">About</a>
</div>