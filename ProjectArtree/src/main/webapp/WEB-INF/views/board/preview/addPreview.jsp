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
	
	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	#detailContainer {
		padding-bottom : 100px;
	}
	
	#detailContainer {	
		margin: 100px 0 100px 0;
	}	
		
	#detailContainer .Title_Area {	
		margin: 0 auto;
		width: 100%;
		display: inline-block;
		text-align: center;
		
	}	
		
	#detailContainer .Title_Area .st {	
		display: block;
		font-size: 15pt;
		
	}	
		
	#detailContainer .Title_Area .lt {	
		display: block;
		font-size: 35pt;
		font-weight: bold;
	}	
	
	div#myPoster {
		padding-top : 10px;
	}
	
	div#myPoster:after {
		content: "";
	  	display: block;
		width : 80%;		
		padding-top : 30px;
		border-bottom : solid 2px lightgray;
	}
	
	div#detailContents {
		width: 80%;
		margin: 0 auto;
		padding-bottom: 20px;
		border-bottom : solid 2px lightgray;
		overflow: hidden; /* div밖으로 이미지가 넘칠 때 해결 방법! 기억해둘것! */
	}
	
	div#detailContents h3 {
		padding-left : 2.5%;
	}
	
	table#detailTable {
		width: 95%;
		margin: 0 auto;
	}
	
	table#detailTable tr td {
		font-size : 12pt;
		padding-top : 10px;
		padding-bottom : 10px;
	}
	
	table#detailTable tr td:first-child {
		width : 80px;
		font-weight: bold;
	}
	
	table#detailTable tr td:nth-child(2) input {
		width : 100%;
		border : 1px solid lightgray;
	}
	
	table#detailTable > tbody > tr:nth-child(8) > td {
		/* width : 100%; */
		font-weight: normal;
		padding-top : 20px;
	}

	div#myBtns {
		float : right;
		padding-right : 22px;
	}
	
	div#myBtns img {
		padding : 10px;
		cursor : pointer;
	}
	
	div#preNext {
		width: 80%;
		margin: 0 auto;
	}
	
	div#preNext table tr td:nth-child(2) {
		font-weight: bold;
		width : 80px;
		text-align: center;
	}
	
	div#preNext table tr td {
		cursor : pointer;
	}
	
	div#toListBtn {
		padding-top : 20px;
		padding-bottom : 20px;
		overflow : hidden;
		cursor : pointer;
	}
	
	div#detailContainer input, div#detailContainer textarea {
		border-radius: 5px;
	}
	
	#detailContainer .modal-dialog {
		margin: 100px auto !important;
	}
	
	#detailContainer .modalExhArea {
		overflow: scroll;
	}
	
	#detailContainer .modalSpan {
		font-size: 15pt;
		padding: 30px 15px;
		border: solid 1px #e6e6e6;
		margin: 20px auto;
	}
	
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){ 
		
		// 이전글 클릭시 이벤트
		$(".prev").click(function(){
			
		}) // 이전글 클릭시 이벤트 -------------
		
		
		// 다음글 클릭시 이벤트
		$(".next").click(function(){
			
			
		}) // 다음글 클릭시 이벤트 --------------
		
		// 글목록으로 돌아가기
		$("#toListBtn").click(function(){
			window.location.href="/artree/previewList.at";
		});
		
		$("#registerBtn").click(function(){
			// 유효성 검사
			var name = $("#name").val().trim();
			var title = $("#title").val().trim();
			var contents = $("#contents").val().trim();
			
			if(name == ""){
				alert("전시회 이름을 입력하세요!");
				$("#name").focus();
			} 
			else if(title == ""){
				alert("글 제목을 입력하세요!");
				$("#title").focus();
			} 
			else if(contents == ""){
				alert("내용을 입력하세요!");
				$("#contents").focus();
			} 
			else {
				var frm = document.addpreview;
				frm.method = "GET";
				frm.action = "*.at";
				frm.submit();
			}
		});
		
		$("input[id=searchName]").keyup(function() { getExhList($("#searchName").val()); });
		
	}); // end of $(document).ready -------------------------------------
	
	function getExhList(key){
		
		$.ajax({
			
			url:"<%=ctxPath%>/getModalExhList.at",
			data: {"key":key},
			dataType: "JSON",
			success: function(json){
				
				var html = "";
				
				if(json.length == 0){
					html += "<span class='modalSpan'>전시회가 존재하지 않습니다.</span>"
				}
				else {
					
					$.each(json, function(index, item){
							
						if( (index+1)%3 != 0){				
							
							html += "<a class='exh_one' onclick='goText("+item.EXHIBITIONNAME+")'>";
							
								if(item.MAINPOSTER.substr(0, 4) != 'http'){
									html += "<img class='exh_poster' src='<%= ctxPath%>/resources/files/"+item.MAINPOSTER+"'/>";
									alert(item.MAINPOSTER.substr(0, 4));
								}
								else {
									html += "<img class='exh_poster' src='"+item.MAINPOSTER+"'/>";
								}
							
							html += "<span class='art_mainTitle'>"+item.EXHIBITIONNAME+"</span></div></a>";
							
						}
						else {
							
							html += "<a class='exh_one' style='margin-right:0px;' onclick='goText("+item.EXHIBITIONNAME+")'>";
							
							if(item.MAINPOSTER.substr(0, 4) != 'http'){
								html += "<img class='exh_poster' src='<%= ctxPath%>/resources/files/"+item.MAINPOSTER+"'/>";
								alert(item.MAINPOSTER.substr(0, 4));
							}
							else {
								html += "<img class='exh_poster' src='"+item.MAINPOSTER+"'/>";
							}
						
							html += "<span class='art_mainTitle'>"+item.EXHIBITIONNAME+"</span></div></a><br/>";
							
						}
						
					});
					
					$(".modalExhArea").html(html);
					
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		});
		
	}

</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Membership</span>
			<span class="lt">Preview</span>
		</div>
		
		<div id="myPoster" align="center">
			<img src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
		</div>
		
		<div id="detailContents">
		<form name="addpreview">
			<table id="detailTable">
				<tr>
					<td>전시회명</td>
					<td>
						<input id="name" name="name" type="text" placeholder="전시회명을 입력해주세요." readonly="readonly" data-toggle="modal" data-target="#myModal"/>
					</td>
				<tr>
				
				<tr>
					<td>제목</td>
					<td><input id="title" name="title" type="text" placeholder="제목을 입력해주세요."/></td>
				<tr>
				<tr>
					<td>작성자</td>
					<td>심예은</td> <!-- $ {loginuser.getUserName} -->
				<tr>
				<tr>
					<td>작성일자</td>
					<td>2020-01-07 21:21</td>
				<tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" style="resize:none; border:solid 1px lightgray" rows="10" cols="120">
						</textarea>
					</td>
				<tr>
			</table>
	</form>
			<div id="myBtns">
				<img id="registerBtn" src="<%= ctxPath %>/resources/images/board/registerBtn.JPG" />
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
				    <h4 class="modal-title">전시회명 검색</h4>
				  </div>
				  <div class="modal-body">
				    <input type="text" name="searchName" id="searchName" placeholder="전시회명을 입력해주세요." style="width: 100%;"/>
				    <div class="modalExhArea">
				    </div>
				  </div>
				</div>
			</div>
		</div>
		
		<div id="preNext">
			<table>
				<tr>
					<td class="prev"><i class='fa fa-angle-up' style='font-size:32px'></i></td>
					<td class="prev">이전글</td>
					<td class="prev">이전글제목이전글제목이전글제목이전글제목이전글제목이전글제목</td>
				</tr>
				<tr>
					<td class="next"><i class='fa fa-angle-down' style='font-size:32px'></i></td>
					<td class="next">다음글</td>
					<td class="next">다음글제목다음글제목다음글제목다음글제목다음글제목다음글제목</td>
				</tr>
			</table>
		</div>
		<div id="toListBtn" align="center">
			<img id="toListBtn" src="<%= ctxPath %>/resources/images/board/toListBtn.JPG" />
		</div>
	</div>
</body>
</html>