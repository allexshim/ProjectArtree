<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ======= tile1 의 sideinfo 페이지 만들기  ======= --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">

/* sidebar */

#mysideinfo a {
  margin-top: 50px;
  padding: 0;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

#mysideinfo a:hover {
  color: #f2f2f2;
}


.arrow_box {
  display: none;
  position: absolute;
  width: 80px;
  padding: 8px;
  margin-top: 8px;
  left: 10px;
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

  
  
  <a href="#"  style="margin-top: 150%;">
  	<img alt="채팅" src="<%= ctxPath %>/resources/images/main/mainside-chat.png" />
  </a>
  <p class="arrow_box" style="color: white; text-align: center;">채팅</p>
  
  <a href="/search.at">
  	<img alt="검색" src="<%= ctxPath %>/resources/images/main/mainside-ticket.png" />
  </a>
  <p class="arrow_box" style="color: white; text-align: center;">예매</p>
  
  <a href="<%=ctxPath%>/addExhibition.at">
  	<img alt="전시등록" src="<%= ctxPath %>/resources/images/main/mainside-Enr.png" />
  </a>
  <p class="arrow_box" style="color: white; text-align: center;">전시등록</p>
  	

