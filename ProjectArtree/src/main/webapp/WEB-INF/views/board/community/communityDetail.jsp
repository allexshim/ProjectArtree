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
		width : 300px;
		height : 400px;
		border-radius: 15px;
		box-shadow: 5px 5px 5px grey;
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
	
	div#preNext table {
		margin-top: 30px;
	}
	
	div#preNext:before {
		content: "";
	  	display: block;
		width : 100%;		
		padding-top : 10px;
		border-bottom : solid 2px lightgray;
	}
	
	div#preNext table tr td:first-child {
		font-weight: bold;
		width : 50px;
		text-align: center;
	}
	}
	
	div#preNext table tr td:nth-child(2) {
		font-weight: bold;
		width : 50px;
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
	}
	
	.commentWriter {
		width:120px; 
		font-weight:bold;
		font-size : 12pt;
	}
	
	.commentContents {
		padding-bottom : 10px;
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
	
	img#addComment, img#modifyComment {
		padding-top : 5px;
		padding-right : 0px;
		float : right;
		cursor : pointer;
	}
	
	.commentModifyBtn, .commentDeleteBtn {
		cursor : pointer;
	}
	
	a.detailLink {text-decoration: none; color:black; font-weight: normal;}
	a.detailLink:hover {text-decoration: none;}
	
	a.prenext {text-decoration: none; color:black; font-weight: normal;}
	a.prenext:hover {text-decoration: none;}

	textarea:focus {
        outline: none;
   	}

</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/v4-shims.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 

		// 글목록으로 돌아가기
		$("#toListBtn").click(function(){
			window.location.href="/artree/communityList.at";
		});
		
		
		// 글 삭제, 수정 ------------------------------------------
		$("#modifyBtn").click(function(){
			window.location.href="modifyCommunity.at?no="+${communityDetail.no};
		}); // 글 수정 --------------------------------------------
		
		$("#deleteBtn").click(function(){
			window.location.href="deleteCommunity.at?no="+${communityDetail.no};	
		}); // 글 삭제 --------------------------------------------
		
		// ---------------------------------------------------
		
		// 댓글 ------------------------------------------------
		
		// 댓글 수정, 삭제하기
		$(".commentModifyBtn").click(function(){
			var commentNo = $(this).next().next().text();
			//window.location.href="/artree/modifyComment.at?commentNo="+commentNo+"no="+"no="+${communityDetail.no};
			
			//#myComments > table > tbody > tr:nth-child(2) > td
		    var content = $(this).parent().parent().next().children().text().trim();
		    
			let text = "<textarea id='commentContents' class='newContent' name='commentContents'>"+content+"</textarea>";
			text += '<img id="modifyComment" onclick="goModifyComm('+commentNo+');" src="/artree/resources/images/board/registerBtn.JPG" />';

		    $(this).parent().parent().next().children().html(text);
		    
		});
		
		
		$(".commentDeleteBtn").click(function(){
			var commentNo = $(this).next().text();
			$.ajax({
			  url:"<%=request.getContextPath()%>/goDeleteComm.at",
	          type:"GET",
	          data : {"commentNo":commentNo,"no":${communityDetail.no}
			  },
	          dataType:"JSON",
	          success: function(json) { 
	        	  // 수정한 댓글을 update하고, 다시 해당 글의 댓글을 불러와서 뿌린다.
	        	  makeCommentList(json);	  
	          },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
			}); // end of ajax ------------------------------------------
		});

		// 새 댓글 등록하기
		$("img#addComment").click(function(){
			
			if($("#commentContents").val().trim() == ""){
				alert("댓글 내용을 입력하세요!");
				$("#commentContents").focus();
			}
			else {
				let form_data = $("form[name=newComment]").serialize();
				$.ajax({
					  url:"<%=request.getContextPath()%>/addComment.at",
			          type:"POST",
			          data : form_data,
			          dataType:"JSON",
			          success: function(json) { 
			        	  // 새로 입력한 댓글을 insert하고, 다시 해당 글의 댓글을 불러와서 뿌린다.
			        	  makeCommentList(json);	
			        	  $("#newComment #commentContents").val("");  
			          },
			          error: function(request, status, error){
			                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			          }
				});
				
			}
			
		});
		//----------------------------------------------------
		
	}); // end of $(document).ready -------------------------------------

	// 댓글 수정 제출하기 (ajax로 새 댓글 내용, 수정한 댓글 번호, 원글번호 보내기..)
	function goModifyComm(commentNo){
		$.ajax({
			  url:"<%=request.getContextPath()%>/goModifyComm.at",
	          type:"GET",
	          data : {"commentNo":commentNo,"content":$(".newContent").val(), "no":${communityDetail.no}
			  },
	          dataType:"JSON",
	          success: function(json) { 
	        	  // 수정한 댓글을 update하고, 다시 해당 글의 댓글을 불러와서 뿌린다.
	        	  makeCommentList(json);	  
	          },
	          error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
		}); // end of ajax ------------------------------------------
	} // end of goModifyComm --------------------------------------
	
	function makeCommentList(json){
		
		var html = "";

		if(json.length > 0){ // 해당 글에 댓글이 존재할 때
			$.each(json, function(index, item){
				html += "<tr>";
				html += "<td class='commentWriter' style='width:50px;'>"+item.name+"</td>";
				html += "<td class='commentWriteDate'>"+item.comwriteDay;
				
				if(item.fk_idx == "${loginuser.idx}"){
					html += "<span class='commentModifyBtn' style='padding-left:10px; padding-bottom:1px; font-weight: bold;'>수정</span>&nbsp;|&nbsp;"	;
					html += "<span class='commentDeleteBtn' style='padding-bottom:1px; font-weight: bold;'>삭제</span>";					
					html += "<span class='commentNo' style='display:none'>"+item.commentNo+"</span>";		
				}
				
				if(${ loginuser.status == 2 }){
					html += "<c:if test='${ item.fk_idx != loginuser.idx && loginuser.status == 2 }'>";
					html += "<span class='commentDeleteBtn' style='padding-left:10px; padding-bottom:1px; font-weight: bold;'>삭제</span>";	
					html += "<span class='commentNo' style='display:none'>"+item.commentNo+"</span>";	
					html += "</c:if>";
				}
				
				html += "</td></tr><tr>";
				html += "<td class='commentContents' colspan='2' style='width:500px; padding-top:10px;'>";
				html += "<textarea readonly='readonly' id='commentContents' name='commentContents' style='border:none !important;'>"+item.comContent+"</textarea>";	
				html += "</td></tr>";
			});
		} 
		else {
			html += "<tr><td colspan='2'>작성된 댓글이 없습니다.</td></tr>";
		}

		$("#myComments > table").html(html);
	} // end of makeCommentList --------------------------------------
	
</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Membership</span>
			<span class="lt">Community</span>
		</div>
		
		<div id="myPoster" align="center" style="padding-top:25px;"><!-- 클릭하면 상세페이지로 이동 exhibitionno -->
			<a class="detailLink" href='/artree/exhDetail.at?eno=${communityDetail.exhibitionno}' ><img src="${communityDetail.mainposter}" /></a>
			<h3><a class="detailLink" href='/artree/exhDetail.at?eno=${communityDetail.exhibitionno}' >${communityDetail.exhibitionname}</a></h3>
		</div>
		
		<div id="detailContents">		
			
			<table id="detailTable" style="margin-top:20px; margin-bottom:30px;">
				<tr><!-- mainposter, exhibitionname, title, name, fk_idx, writeday, content -->
					<td colspan="4">
						<p style="font-size:30px; font-weight: bolder; padding-top:30px;">${communityDetail.title}</p>
					</td>
				<tr>
				<tr>
					<td>작성자</td>
					<td>${communityDetail.name}</td>
					<td>작성일자</td>
					<td>${communityDetail.writeday}</td>
				<tr>
				<tr>
					<td colspan="4" style="padding-top:20px; padding-bottom: 30px;">${communityDetail.content}</td>
				<tr>
			</table>
			
			<!-- 자기가 쓴 글만 수정,삭제 버튼이 보인다. / 관리자는 삭제 버튼을 볼 수 있다. -->
			<c:if test="${(communityDetail.fk_idx == loginuser.idx)}">
				<div id="myBtns">
					<img id="modifyBtn" src="<%= ctxPath %>/resources/images/board/modifyBtn.JPG" />
					<img id="deleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
				</div>
			</c:if>
			<c:if test="${ loginuser.status == 2 }">
				<div id="myBtns">
					<img id="deleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
				</div>
			</c:if>
		</div>
		
		<div id="myComments">
			<table style="width:100%;">
				<c:if test="${commentList != null}">
					<c:forEach var="item" items="${commentList}">
						<tr>
							<td class="commentWriter" style="width:50px;">${item.name}</td>
							<td class="commentWriteDate">
								${item.comwriteDay}
								<c:if test="${item.fk_idx == loginuser.idx}">
									<span class="commentModifyBtn" style="padding-left:10px; padding-bottom:1px; font-weight: bold;">수정</span>&nbsp;|
									<span class="commentDeleteBtn" style="padding-bottom:1px; font-weight: bold;">삭제</span>
									<span class="commentNo" style="display:none">${item.commentNo}</span>
								</c:if>
								<c:if test="${item.fk_idx != loginuser.idx && loginuser.status == 2 }">
									<span class="commentDeleteBtn" style="padding-left:10px; padding-bottom:1px; font-weight: bold;">삭제</span>
									<span class="commentNo" style="display:none">${item.commentNo}</span>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="commentContents" colspan="2" style="width:500px; padding-top:10px;">
								<textarea readonly="readonly" id='commentContents' name='commentContents' style="border:none !important;">${item.comContent}</textarea>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${commentList == null || commentList == ''}">
					<tr>
						<td colspan="2">작성된 댓글이 없습니다.</td>
					</tr>
				</c:if>
			</table> 
			
			<c:if test="${loginuser != null}">
				<form id="newComment" name="newComment" style="padding-top:20px;">
					<input id="commentWriter" name="commentWriter" type="text" value="${loginuser.name}" readonly="readonly"/><br/>
					<textarea id="commentContents" name="commentContents" placeholder="댓글 내용을 입력하세요."></textarea>
					<img id="addComment" src="<%= ctxPath %>/resources/images/board/registerBtn.JPG" />
					<input id="fk_no" name="fk_no" type="hidden" value="${communityDetail.no}" />
				</form>
			</c:if>
		</div>
		
		<div id="preNext" >
			<table>
				<tr>
					<td class="prev"><i class='fa fa-angle-up' style='font-size:32px'></i></td>
					<td class="prev">이전글</td>
					<td class="prev">
						<c:if test="${communityDetail.previousno != null}">
							<a class="prenext" style="padding-left:5px;" href='/artree/communityDetail.at?no=${communityDetail.previousno}'>${communityDetail.previoustitle}</a>
						</c:if>
						<c:if test="${communityDetail.previousno == null}">
							<span style="padding-left:5px; color:black;">이전 글이 없습니다.</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="next"><i class='fa fa-angle-down' style='font-size:32px'></i></td>
					<td class="next">다음글</td>
					<td class="next">
						<c:if test="${communityDetail.nextno != null}">
							<a class="prenext" style="padding-left:5px;" href='/artree/communityDetail.at?no=${communityDetail.nextno}'>${communityDetail.nexttitle}</a>
						</c:if>
						<c:if test="${communityDetail.nextno == null}">
							<span style="padding-left:5px; color:black;">다음 글이 없습니다.</span>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div id="toListBtn" align="center">
			<img id="toListBtn" src="<%= ctxPath %>/resources/images/board/toListBtn.JPG" />
		</div>
	</div>
</body>
</html>