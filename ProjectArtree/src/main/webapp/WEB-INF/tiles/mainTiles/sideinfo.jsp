<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ======= tile1 의 sideinfo 페이지 만들기  ======= --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
/* sidebar */
.sidenav {
  margin-left: 10px;
  height: 100%;
  width: 10%;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  overflow-x: hidden;
  overflow-y: hidden;
  padding-top: 20px;
}

.sidenav a {
  margin-top: 50px;
  padding: 0;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f2f2f2;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

span {
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.arrow_box {
  display: none;
  position: absolute;
  width: 100px;
  padding: 8px;
  margin-top: 8px;
  left: 0;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

a:hover + p.arrow_box {
  display: block;
}
</style>

<div class="sidenav" >
  <a href="/search.at" style="margin-top: 150%;">
  	<img alt="검색" src="<%= ctxPath %>/resources/images/main/mainside-search.png" />
  </a>
  <p class="arrow_box" style="color: white; text-align: center;">검색</p>
  
  <a href="<%=ctxPath%>/addExhibition.at">
  	<img alt="전시등록" src="<%= ctxPath %>/resources/images/main/mainside-Enr.png" />
  </a>
  <p class="arrow_box" style="color: white; text-align: center;">전시등록</p>
  	
  <a href="#">
  	<img alt="채팅" src="<%= ctxPath %>/resources/images/main/mainside-chat.png" />
  </a>
  <p class="arrow_box" style="color: white; text-align: center;">채팅</p>
  
</div>
