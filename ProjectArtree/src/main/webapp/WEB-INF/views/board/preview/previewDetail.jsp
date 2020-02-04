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
	
	div#myPoster img {
		width: 30%;
	    border-radius: 5px;
	    box-shadow: 10px 10px 5px lightgrey;
	    margin: 40px 0 50px 0px;
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
		padding-bottom: 30px;
		padding-left : 20px;
		border-bottom : solid 2px lightgray;
		overflow: hidden; /* div밖으로 이미지가 넘칠 때 해결 방법! 기억해둘것! */
	}
	
	table#detailTable {
		width: 60%;
	}
	
	
	table#detailTable tr td {
		font-size : 12pt;
		line-height: 200%;
	}
	
	#detailTable > tbody > tr:nth-child(3) > td:nth-child(1) {
		width : 50px;
		font-weight: bold;
	}
	
	#detailTable > tbody > tr:nth-child(3) > td:nth-child(3){
		width : 70px;
		font-weight: bold;
	}
	
	#detailTable > tbody > tr:nth-child(3) > td:nth-child(2) {
		width : 70px;
	}
	
	table#detailTable > tbody > tr:nth-child(7) > td {
		width : 100%;
		font-weight: normal;
		padding-top : 20px;
	}

	div.myBtns {
		float : right;
		padding-right : 22px;
	}
	
	div.myBtns img {
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
	
	div#detailContainer input {
		border-radius: 5px;
	}
	
	/* 댓글 부분 */
	div#myComments {
		width : 88%;
		padding-left : 165px;
		padding-top : 20px;
	}
	
	div#myComments img {
		padding : 10px;
		padding-bottom : 0;
		float: right;
	}
	
	.comWriter {
		width:120px; 
		font-weight:bold;
		font-size : 12pt;
	}
	
	.commentContents {
		padding-bottom : 10px;
	}
	
	div#myComments table {
		width: 100%;
	}
	
	div#myComments table textarea {
		width: 100%;
	}
	
	/* 새 댓글 작성하기 */
	form#newComment {
		overflow:hidden;
	}
	
	input#comWriter {
		border:none;
		width:120px; 
		font-weight:bold;
		font-size : 12pt;
		padding-bottom : 5px;
	}
	
	textarea#comContent {
		resize : none;
		border-radius: 5px;
		width : 100%;
	}
	
	img#addComment {
		padding-top : 5px;
		padding-right : 0px;
		float : right;
		cursor : pointer;
	}
	
	.commentModifyBtn, .commentDeleteBtn {
		cursor : pointer;
	}
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		goCommentListView();
		
		// 이전글 클릭시 이벤트
		$(".prev").click(function(){
			var bno = $(".prevno").text();
			location.href="<%=ctxPath%>/previewDetail.at?bno="+bno;
		}) // 이전글 클릭시 이벤트 -------------
		
		// 다음글 클릭시 이벤트
		$(".next").click(function(){
			var bno = $(".nextno").text();
			location.href="<%=ctxPath%>/previewDetail.at?bno="+bno;
		}) // 다음글 클릭시 이벤트 --------------
		
		// 글 삭제 버튼 이벤트
		$("#deleteBtn").click(function(){
			var returnVal = confirm("정말로 삭제하시겠습니까?");
			if(returnVal == true){
				location.href="<%=ctxPath %>/deletePreview.at?bno="+${previewDetailMap.SEQ};
			}
		});
		
		// 글목록으로 돌아가기
		$("#toListBtn").click(function(){
			window.location.href="/artree/previewList.at";
		});
		

		// 새 댓글 등록하기
		$("#addComment").click(function(){ 
			
			if($("#comContent").val().trim() == ""){
				alert("댓글 내용을 입력하세요!");
				$("#comContent").focus();
			}
			else {
				var form_data = $("form[name=newComment]").serialize();
				$.ajax({
					  url:"<%=ctxPath%>/addPrevComment.at",
					  data:form_data,
					  type:"POST",
					  dataType:"JSON",
					  success:function(json){
						  if(json.result == 1){
							  $("#comContent").val("");
							  goCommentListView();	  
						  }
						  else {
							  alert("다시 시도해주세요.");
						  }
						  
					  },
					  error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					  }
					  
				   });
			}
			
		});
		
		// 댓글 수정하기를 눌렀을 때 - 
		$(document).on("click", ".commentModifyBtn", function(event){
			
			$(event.target).text("취소").removeClass("commentModifyBtn").addClass("cancelComModify").css("cursor","pointer");
			$(event.target).next().text("등록").removeClass("commentDeleteBtn").addClass("submitEditCom").css("cursor","pointer");
			var target = $(event.target).parent().parent().next().next();
			
			var content = target.text();
			var cno = $(event.target).next().next().text();
			
			var html = "<td colspan=2>"
					 + "<textarea id='commentContents' name='commentContents' style='margin:10px 0 30px 0; resize:none; border-radius: 5px; width: 100%;'>"+content+"</textarea>"
				 	 + "</td>";
				 
			target.html(html);

		});
		
		// 댓글 수정 눌렀다가 취소 눌렀을 때
		$(document).on("click", ".cancelComModify", function(event){
			$(event.target).text("수정").removeClass("cancelComModify").addClass("commentModifyBtn");
			$(event.target).next().text("삭제").removeClass("submitEditCom").addClass("commentDeleteBtn");
			var target = $(event.target).parent().parent().next().next();
			var content = target.text();
			var html = "<td class='commentContents' colspan='2' style='width:500px; padding-top:10px;'>"
					 + "<textarea readonly='readonly' class='commentContents' name='commentContents' style='resize:none; border:none !important;'>"+content+"</textarea>"
					 + "</td>";
			target.html(html);
		});
		
		// 댓글 수정 눌렀다가 등록 눌렀을 때
		$(document).on("click", ".submitEditCom", function(event){
			
			var cno = $(event.target).next().text();
			var content = $(event.target).parent().parent().next().next().find("textarea[name=commentContents]").val();
			
			goModifyComm(cno, content);
		});
		
		// 댓글 삭제하기
		$(document).on("click", ".commentDeleteBtn", function(event){
			
			var cno = $(event.target).next().text();
			var bool = confirm('해당 댓글을 삭제하시겠습니까?');
			
			if (bool) {
				$.ajax({
					  url:"<%= ctxPath%>/delComment.at",
					  data:{"cno":cno, "bno":"${previewDetailMap.SEQ}"},
					  type:"POST",
					  dataType:"JSON",
					  success:function(json){
						  if(json.result == 1){
							  goCommentListView();
						  }
						  else {
							  alert("다시 시도해주세요.");
						  }
					  },
					  error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					  }
					  
				   });
			}
			
		});
		
	}); // end of $(document).ready -------------------------------------
	
	// 댓글 수정하러 가기 - 
	function goModifyComm(cno, content){
		
		$.ajax({
			  url:"<%= ctxPath%>/editComment.at",
			  data:{"cno":cno, "content":content},
			  type:"POST",
			  dataType:"JSON",
			  success:function(json){
				  if(json.result == 1){
					  goCommentListView();
				  }
				  else {
					  alert("다시 시도해주세요.");
				  }
			  },
			  
			  error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			  }
			  
		   });
	}
	
	/////////// 댓글 목록 불러오기 //////////////
	function goCommentListView(){
		
		   $.ajax({
			  url:"<%=ctxPath%>/getCommentList.at",
			  type:"GET",
			  data:{ "bno":"${previewDetailMap.SEQ}" },
		   	  dataType:"json",
		   	  success:function(json){
		   		  
				var html = "";
				
				if (json.length > 0) { 
					
					$.each(json, function(index, item){
						html += "<tr>"
							 + "<td class='comWriter' style='width:50px;'>"+item.NAME+"</td>"
							 + "<td class='commentWriteDate'>"+item.REGDATE;
						 
						 if(item.FK_IDX == '${loginuser.idx}'){
							 html += "<span class='commentModifyBtn' style='padding-left:10px; padding-bottom:1px; font-weight: bold;'>수정</span>&nbsp;|&nbsp;"
							 	  + "<span class='commentDeleteBtn' style='padding-bottom:1px; font-weight: bold;'>삭제</span>"
							 	  + "<span class='commentNo' style='display:none'>"+item.SEQ+"</span>";
						 }
						 else if(${loginuser.status == 2}){
							 html += "<span class='commentDeleteBtn' style='padding-left:10px; padding-bottom:1px; font-weight: bold;'>삭제</span>"
							 	  + "<span class='commentNo' style='display:none'>"+item.SEQ+"</span>";
						 }
							 
						 html += "</td><tr>"
							  + "<tr>"
							  + "<td class='commentContents' colspan='2' style='width:500px; padding-top:10px;'>"
							  + "<textarea readonly='readonly' class='commentContents' name='commentContents' style='resize:none; border:none !important;'>"+item.CONTENT+"</textarea>"
							  + "</td><tr>";
				
					});
	
				}
				
				$("#comArea").html(html);	 

		   	  },
		   	  error: function(request, status, error){
			  	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			   }
		   });
		   
	   } // end of function goCommentListView(){ -------------------

</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Membership</span>
			<span class="lt">Preview</span>
		</div>
		
		<div id="myPoster" align="center">
			<c:if test="${previewDetailMap.MAINPOSTER.contains('http://')}">
				<img onclick="location.href='<%=ctxPath %>/exhDetail.at?eno=${previewDetailMap.FK_ENO}'" src="${previewDetailMap.MAINPOSTER}"/>
			</c:if>
			<c:if test="${!previewDetailMap.MAINPOSTER.contains('http://')}">
				<img onclick="location.href='<%=ctxPath %>/exhDetail.at?eno=${previewDetailMap.FK_ENO}'" src="<%= ctxPath%>/resources/files/${previewDetailMap.MAINPOSTER}"/>
			</c:if>
		</div>
		
		<div id="detailContents">

			<table id="detailTable" style="margin-top:20px; margin-bottom:30px;">
				<tbody>
					<tr>
						<td colspan="4">
							<p style="font-size:30px; font-weight: bolder; padding-top:30px;">${previewDetailMap.TITLE}</p>
						</td>
					<tr>
					<tr>
						<td>작성자</td>
						<td>${previewDetailMap.NAME}</td>
						<td>작성일자</td>
						<td>${previewDetailMap.REGDATE}</td>
					<tr>
					<tr>
						<td colspan="4" style="padding-top:20px; padding-bottom: 30px;">${previewDetailMap.CONTENT}</td>
					<tr>
				</tbody>
			</table>
			
			<c:if test="${previewDetailMap.FK_IDX == loginuser.idx}">
				<div class="myBtns">
					<img id="modifyBtn" onclick="location.href='<%=ctxPath %>/addPreview.at?bno=${previewDetailMap.SEQ}'" src="<%= ctxPath %>/resources/images/board/modifyBtn.JPG" />
					<img id="deleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
				</div>
			</c:if>
			<c:if test="${ loginuser.status == 2 }">
				<div class="myBtns">
					<img id="deleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
				</div>
			</c:if>	
		</div>
		
		<div id="myComments">
			<table id="comArea">
			</table>
			
			<c:if test="${loginuser != null}">
			<form id="newComment" name="newComment">
				<input id="comWriter" name="comWriter" type="text" value="${loginuser.name}" readonly="readonly"/><br/>
				<textarea id="comContent" name="comContent" placeholder="댓글 내용을 입력하세요."></textarea>
				<input id="fk_seq" name="fk_seq" type="hidden" value="${previewDetailMap.SEQ}">
				<input id="fk_idx" name="fk_idx" type="hidden" value="${loginuser.idx}">
				<img id="addComment" src="<%= ctxPath %>/resources/images/board/registerBtn.JPG" />
			</form>
			</c:if>
		</div>
		
		<div id="preNext">
			<table>
				<tr>
					<td class="prev"><i class='fa fa-angle-up' style='font-size:32px'></i></td>
					<td class="prev">이전글</td>
					<c:if test="${not empty previewDetailMap.PREVTITLE}">
						<td class="prev">${previewDetailMap.PREVTITLE}</td>
					</c:if>
					<c:if test="${empty previewDetailMap.PREVTITLE}">
						<td class="prev" style="cursor: default;">이전글이 없습니다.</td>
					</c:if>
					<td class="prevno" style="display: none;">${previewDetailMap.PREVSEQ}</td>
				</tr>
				<tr>
					<td class="next"><i class='fa fa-angle-down' style='font-size:32px'></i></td>
					<td class="next">다음글</td>
					<c:if test="${not empty previewDetailMap.NEXTTITLE}">
						<td class="next">${previewDetailMap.NEXTTITLE}</td>
					</c:if>
					<c:if test="${empty previewDetailMap.NEXTTITLE}">
						<td class="next" style="cursor: default;">다음글이 없습니다.</td>
					</c:if>
					<td class="nextno" style="display: none;">${previewDetailMap.NEXTSEQ}</td>
				</tr>
			</table>
		</div>
		
		<div id="toListBtn" align="center">
			<img id="toListBtn" src="<%= ctxPath %>/resources/images/board/toListBtn.JPG" />
		</div>
	</div>
</body>
</html>