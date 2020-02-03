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

	.modal {
		top:80px;
	}

	.M1 {
		-webkit-transform:translate(-10px,0);
	}

	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	#communityContainer {
		padding-bottom : 100px;
	}
	
	img#boardtop {
		/* position : absolute; */
		width : 100%;
		height : 540px;
	}
	
	div#topText {
		padding-top : 50px;
		width : 100px;
		text-align: center;
		padding-left : 60px;
	}
	
	div#topText span {
		font-size : 15pt;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}
	
	/* == 검색바 부분 == */
	
	div#searchContainer {
		float : right;
		padding-right : 100px;
		vertical-align: middle;
	}
	
	div#searchContainer input#searchWord {
		border : none;
		padding-bottom: 5px;
		border-bottom : solid 1px black;
		font-size : 12pt;
	} 
	
	div#searchContainer #searchType {
		font-size : 12pt;
		height : 30px;
		margin-right : 10px;
	}
	
	div#searchContainer #searchicon {
		cursor : pointer;
	}
	
	div#contentContainer {
		clear:both;
	}
	
	div#contentContainer {
		padding-top : 50px;
	}
	
	/* == 테이블 부분 == */
	
	table#communityContents {
		width : 90%;
		margin : 0 auto;
		border-collapse: collapse;
	}

	div#goWrite {
		float : right;
		padding-right : 7%;
		cursor : pointer;
	}
	
	.contentBin {
		float: left;
		width: 280px;
		height: 380px;
		cursor: pointer;
		margin: 30px;
	}
	
	/* == 페이징 바 == */
	.pageNumber {
		font-size:16px; 
		font-weight:bold;
	}
	
	.pagination {
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
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		
		// 수정 & 삭제
		$("#modifyBtn").click(function(){			
			var frm = document.eventNo;
			frm.method = "POST";
			frm.action = "modifyEvent.at";
			frm.submit();					
		});
		
		$("#deleteBtn").click(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/delEvent.at",				
				type:"POST",					
				data:{"eventNo":$("#eventNo2").val()},				
				error:function(request,status,error) {
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}	
			});				
			location.href="<%=ctxPath%>/event.at";
		});
		
		// 관리자 로그인시 버튼 보이기
		$("#myBtns").hide();
		$("div#goWrite").hide();
		
		var admin ="${sessionScope.loginuser.status}";
		if(admin == 2){
			$("#myBtns").show();
			$("div#goWrite").show();
		}
		
		// 리스트 클릭하면 상세페이지 모달 갱신
		$(document).on("click",".contentBin",function(){
			var eventNo = $(this).find("input[name=eventNo]").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/eventDetail.at",				
				type:"POST",					
				data:{"eventNo":eventNo},				
				dataType:"JSON",
				success:function(json){ 						
					var html = "";						
					$(".modal-title").text(json.EVENTNAME);
					html += "<div style=\"float: left; width:50%;\">";
					html += "<img style=\"width:100%;\" src=\""+json.MAINPOSTER+"\"/>";
					html += "</div>";
					html += "<div style=\"float: right; width:50%; padding:3%;\">";
					html += "<table class=\"table table-hover\">";
					html += "<tr>";
					html += "<th><div>기간</div></th>";
					html += "<td><div>"+json.STARTDATE+" ~ "+json.ENDDATE+"</div></td>";					
					html += "</tr>";
					html += "<tr>";
					html += "<th><div>내용</div></th>";
					html += "<td><div>"+json.CONTENT+"</div></td>";
					html += "</tr>";
					html += "</table>";					
					html += "</div>";															
					html += "";									
					$(".modal-body").html(html);
					$("#eventNo2").val(eventNo);
				}, 
				error:function(request,status,error) {
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}					
			});
		});
		
		// 글쓰기 페이지로 가기
		$("div#goWrite").click(function(){
			if(${sessionScope.loginuser == null}){
				alert("먼저 로그인 하세요!");
				location.href="javascript:layer_open('layer')";
				return;
			}
			else {
				window.location.href="/artree/addEvent.at";	
			}
		});
		
	}); // end of document.ready ------------------------------------------------

</script>
</head>
<body>
	<form name="eventNo">
		<input id="eventNo2" name="eventNo2" hidden="hidden" value="">
	</form>	
	<div id="communityContainer">
		<div id="imgcontainer">	
	  		<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage2.jpg" />
		</div>

		<div id="topText">
			<span style="text-align:center">Membership</span>
			<h1 style="margin:0;">Event</h1>
		</div>					
		
		<div style="overflow: hidden; margin: 0 auto; width: 90%; margin-left:7%;" id="contentContainer">
			${content}
		</div>

		<!-- 페이징바  -->
		<div class="pagination" align="center">
			${pageBar}
		</div>
		
		<div id="goWrite">
			<img src="<%= ctxPath %>/resources/images/board/writeBtn.JPG" />
		</div>		
	</div>
	
	<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Modal Header</h4>
	        </div>
	        <div style="overflow: hidden;" class="modal-body">	         
	        </div>
	        <div class="modal-footer">
	            <div id="myBtns">
					<img id="modifyBtn" src="<%= ctxPath %>/resources/images/board/modifyBtn.JPG" />
					<img id="deleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
				</div>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	<!-- Modal End -->
	
</body>
</html>