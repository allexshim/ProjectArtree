<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Artree</title>

<%-- bootstrap 사용을 위한 library --%>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/v4-shims.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
 <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
 <script src="https://unpkg.com/swiper/js/swiper.js"></script>
 <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
 <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/style/basicstyle.css" />
  <script type="text/javascript" src="<%=ctxPath %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
   <%-- 이 파일의 css는 해당 파일에서 담당한다. --%>
</head>
<body>
	<div id="mycontainer">
		<div id="myheader"> <%-- 이 div에는 tiles-layout.xml에서 선언한 header.jsp 부분이 들어온다고 지정한다. --%>
			<tiles:insertAttribute name="header" />
		</div>
		
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
		
		<div id="mysideinfo">
			<tiles:insertAttribute name="sideinfo" />
		</div>
		
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	
</body>
</html>