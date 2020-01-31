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
		border-radius: 15px;
		box-shadow: 5px 5px 5px grey;
		width: 300px;
		height: 400px;
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
	}
	
	table#detailTable tr td:first-child {
		width : 20px;
		font-weight: bold;
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
	
	.commentWriter {
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
	
	input#commentWriter {
		border:none;
		width:120px; 
		font-weight:bold;
		font-size : 12pt;
		padding-bottom : 5px;
	}
	
	textarea#commentContents {
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
		
		// 글 수정 하기
		$("#modifyBtn").click(function() {
			window.location.href="modifyReview.at?revno=${revo.revno}";	
		});
		
		// 글 삭제하기
		$("#deleteBtn").click(function() {
			var bool = confirm('해당 글을 삭제하시겠습니까?');
			
			if (bool) {
				window.location.href="delReview.at?revno=${revo.revno}";	
			}
		});
		
		// 이전글 클릭시 이벤트
		$(".prev").click(function(){
			window.location.href="reviewDetail.at?revno=${revo.previousno}";
		}); // 이전글 클릭시 이벤트 -------------
	
		// 다음글 클릭시 이벤트
		$(".next").click(function(){
			window.location.href="reviewDetail.at?revno=${revo.nextno}";
		}); // 다음글 클릭시 이벤트 --------------
		
		
		// 글목록으로 돌아가기
		$("#toListBtn").click(function(){
			window.location.href="/artree/reviewList.at";
		});
		
		// 댓글 ------------------------------------------------
		
		// 새 댓글 등록하기
		$("img#addComment").click(function(){
			
			if($("#commentContents").val().trim() == ""){
				alert("댓글 내용을 입력하세요!");
				$("#commentContents").focus();
			}
			else {
				var form_data = $("form[name=newComment]").serialize();
				$.ajax({
					  url:"<%= request.getContextPath()%>/addRevComment.at",
					  data:form_data,
					  type:"POST",
					  dataType:"JSON",
					  success:function(json){
						  showCommentList(json);
						  location.reload();
					  },
					  
					  error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					  }
					  
				   });
			}
			
		});
		
		// 댓글 수정하기
		$(".commentModifyBtn").click(function(){
			var commentno = $(this).next().next().text();
			
			var content = $(this).parent().parent().next().children().text().trim();
		    
			var text = "<textarea id='commentContents' class='newContent' name='commentContents'>"+content+"</textarea>";
			text += '<img id="modifyComment" onclick="goRevModifyComm('+commentno+');" src="/artree/resources/images/board/registerBtn.JPG" />';

		    $(this).parent().parent().next().children().html(text);
			
		});
		
		// 댓글 삭제하기
		$(".commentDeleteBtn").click(function(){
			var commentno = $(this).next().text();
			
			var bool = confirm('해당 댓글을 삭제하시겠습니까?');
			
			if (bool) {
				$.ajax({
					  url:"<%= request.getContextPath()%>/delRevComment.at",
					  data:{"commentno":commentno, "fk_revno":$("#fk_revno").val()},
					  type:"POST",
					  dataType:"JSON",
					  success:function(json){
						  showCommentList(json);
					  },
					  
					  error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					  }
					  
				   });
			}
			
		});

		//----------------------------------------------------
		
	}); // end of $(document).ready -------------------------------------

	// 댓글 수정
	function goRevModifyComm(commentno) {
		$.ajax({
			  url:"<%= request.getContextPath()%>/modifyRevComment.at",
			  data:{"commentno":commentno, "content":$(".newContent").val(), "fk_revno":$("#fk_revno").val()},
			  type:"POST",
			  dataType:"JSON",
			  success:function(json){
				  showCommentList(json);
			  },
			  
			  error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			  }
			  
		   });
	}
	
	function showCommentList(json) {
		var html = "";
		  if(json.length > 0) {
		  $.each(json, function(index, item){
				html += "<tr>";
				html += "<td class='commentWriter' style='width:50px;'>"+item.name+"</td>";
				html += "<td class='commentWriteDate'>"+item.comwriteday;
				
				if(item.fk_idx == "${loginuser.idx}"){
					html += "<span class='commentModifyBtn' style='padding-left:10px; padding-bottom:1px; font-weight: bold;'>수정</span>&nbsp;|&nbsp;"	;
					html += "<span class='commentDeleteBtn' style='padding-bottom:1px; font-weight: bold;'>삭제</span>";					
					html += "<span class='commentNo' style='display:none'>"+item.commentno+"</span>";		
				}
				
				if(${ loginuser.status == 2 }){
					html += "<c:if test='${ loginuser.status == 2 }'>";
					html += "<span class='commentDeleteBtn' style='padding-left:10px; padding-bottom:1px; font-weight: bold;'>삭제</span>";	
					html += "<span class='commentNo' style='display:none'>"+item.commentno+"</span>";	
					html += "</c:if>";
				}
				
				html += "</td></tr><tr>";
				html += "<td class='commentContents' colspan='2' style='width:500px; padding-top:10px;'>";
				html += "<textarea readonly='readonly' id='commentContents' name='commentContents' style='border:none !important;'>"+item.comcontent+"</textarea>";	
				html += "</td></tr>";
			});
		} 
		else {
			html += "<tr><td colspan='2'>작성된 댓글이 없습니다.</td></tr>";
		}
		  
		$("#myComments > table").html(html);
		frm.commentContents.value = "";
		
	}
</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Membership</span>
			<span class="lt">Review</span>
		</div>
		
		<div id="myPoster" align="center">
			<img src="${poster}" />
		</div>
		
		<div id="detailContents">

			<h3>${revo.exhibitionname}</h3>
			<table id="detailTable">
				<tr>
					<td>제목</td>
					<td>${revo.revTitle}</td>
				<tr>
				<tr>
					<td>작성자</td>
					<td>${revo.fk_name}</td>
				<tr>
				<tr>
					<td>작성일자</td>
					<td>${revo.revWriteday}</td>
				<tr>
				<tr>
					<td colspan="2" style="padding: 50px 0;">
					${revo.revContent}
					</td>
				<tr>
			</table>
			
			<c:if test="${revo.fk_idx == loginuser.idx}">
				<div class="myBtns">
					<img id="modifyBtn" src="<%= ctxPath %>/resources/images/board/modifyBtn.JPG" />
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
			<table>
				<c:if test="${commentList != null}">
					<c:forEach var="item" items="${commentList}">
						<tr>
							<td class="commentWriter" style="width:50px;">${item.name}</td>
							<td class="commentWriteDate">
								${item.comwriteday}
								<c:if test="${item.fk_idx == loginuser.idx}">
									<span class="commentModifyBtn" style="padding-left:10px; padding-bottom:1px; font-weight: bold;">수정</span>&nbsp;|
									<span class="commentDeleteBtn" style="padding-bottom:1px; font-weight: bold;">삭제</span>
									<span class="commentNo" style="display:none">${item.commentno}</span>
								</c:if>
								<c:if test="${ loginuser.status == 2 }">
									<span class="commentDeleteBtn" style="padding-left:10px; padding-bottom:1px; font-weight: bold;">삭제</span>
									<span class="commentNo" style="display:none">${item.commentno}</span>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="commentContents" colspan="2" style="width:500px; padding-top:10px;">
								<textarea readonly="readonly" id='commentContents' name='commentContents' style="border:none !important;">${item.comcontent}</textarea>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${commentList == null}">
					<tr>
						<td colspan="2">작성된 댓글이 없습니다.</td>
					</tr>
				</c:if>
			</table>
			
			<c:if test="${loginuser != null}">
			<form id="newComment" name="newComment">
				<input id="commentWriter" name="commentWriter" type="text" value="${loginuser.name}" readonly="readonly"/><br/>
				<textarea id="commentContents" name="commentContents" placeholder="댓글 내용을 입력하세요."></textarea>
				<input id="fk_revno" name="fk_revno" type="hidden" value="${revo.revno}">
				<img id="addComment" src="<%= ctxPath %>/resources/images/board/registerBtn.JPG" />
			</form>
			</c:if>
		</div>
		
		<div id="preNext">
			<table>
				<c:if test="${not empty revo.previousno}">
				<tr>
					<td class="prev"><i class='fa fa-angle-up' style='font-size:32px'></i></td>
					<td class="prev">이전글</td>
					<td class="prev">${revo.previoustitle}</td>
				</tr>
				</c:if>
				<c:if test="${empty revo.previousno}">
				<tr>
					<td style="cursor: default;"><i class='fa fa-angle-up' style='font-size:32px'></i></td>
					<td style="cursor: default;">이전글</td>
					<td style="cursor: default;">이전글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${not empty revo.nextno}">
				<tr>
					<td class="next"><i class='fa fa-angle-down' style='font-size:32px'></i></td>
					<td class="next">다음글</td>
					<td class="next">${revo.nexttitle}</td>
				</tr>
				</c:if>
				<c:if test="${empty revo.nextno}">
				<tr>
					<td style="cursor: default;"><i class='fa fa-angle-down' style='font-size:32px'></i></td>
					<td style="cursor: default;">다음글</td>
					<td style="cursor: default;">다음글이 없습니다.</td>
				</tr>
				</c:if>
			</table>
		</div>
		<div id="toListBtn" align="center">
			<img id="toListBtn" src="<%= ctxPath %>/resources/images/board/toListBtn.JPG" />
		</div>
	</div>
</body>
</html>