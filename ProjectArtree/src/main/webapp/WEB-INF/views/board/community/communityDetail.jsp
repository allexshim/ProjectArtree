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
	
	img#addComment {
		padding-top : 5px;
		padding-right : 0px;
		float : right;
		cursor : pointer;
	}
	
	#commentModifyBtn, #commentDeleteBtn {
		cursor : pointer;
	}
	
</style>

<script src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
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
			window.location.href="/artree/communityList.at";
		});
		
		// 댓글 ------------------------------------------------
		
		// 댓글 수정, 삭제하기
		$("#commentModifyBtn").click(function(){
			var commentNo = $(this).next().next().text();
			window.location.href="*.at?commentNo="+commentNo;
		});
		
		$("#commentDeleteBtn").click(function(){
			var commentNo = $(this).next().text();
			window.location.href="*.at?commentNo="+commentNo;
		});

		// 새 댓글 등록하기
		$("img#addComment").click(function(){
			
			if($("#commentContents").val().trim() == ""){
				alert("댓글 내용을 입력하세요!");
				$("#commentContents").focus();
			}
			else {
				var frm = document.newComment;
				frm.method = "POST";
				frm.action = "*.at";
				frm.submit();
			}
			
		});
		//----------------------------------------------------
		
	}); // end of $(document).ready -------------------------------------

</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Membership</span>
			<span class="lt">Community</span>
		</div>
		
		<div id="myPoster" align="center">
			<img src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
		</div>
		
		<div id="detailContents">		
			<h3>예술섬의 사색 Ⅰ : 이배경 작가전</h3>
			<table id="detailTable">
				<tr>
					<td>제목</td>
					<td>예술섬의 사색을 보고온 리뷰글</td>
				<tr>
				<tr>
					<td>작성자</td>
					<td>심예은</td>
				<tr>
				<tr>
					<td>작성일자</td>
					<td>2020-01-07 21:21</td>
				<tr>
				<tr>
					<td colspan="2">글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용
									글내용글내용글내용
									글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용
									글내용글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용
									글내용글내용글내용
									글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용글내용글내용글내용글내용글내용
									글내용글내용글내용글내용
									글내용글내용글내용
									글내용글내용
					</td>
				<tr>
			</table>
	
			<div id="myBtns">
				<img id="modifyBtn" src="<%= ctxPath %>/resources/images/board/modifyBtn.JPG" />
				<img id="deleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
			</div>
		</div>
		
		<div id="myComments">
			<table>
			<!--  이 부분이 c:foreach로 묶이게 됩니다. -->
				<tr>
					<td class="commentWriter">댓글작성자이름</td>
					<td class="commentWriteDate">댓글작성일자</td>
				</tr>
				<tr>
					<td class="commentContents" colspan="2">
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						<%-- <c:if test="${댓글작성자아이디 == 현재로그인한회원 아이디 }"> --%>
						<div align="right">
							<img id="commentModifyBtn" src="<%= ctxPath %>/resources/images/board/modifyBtn.JPG" />
							<img id="commentDeleteBtn" src="<%= ctxPath %>/resources/images/board/deleteBtn.JPG" />
							<span class="commentNo" style="display:none">댓글번호</span>
						</div>
						<%-- </c:if> --%>
					</td>
				</tr>
			<!--  이 부분이 c:foreach로 묶이게 됩니다. -->	
				<tr>
					<td class="commentWriter">댓글작성자이름</td>
					<td class="commentWriteDate">댓글작성일자</td>
				</tr>
				<tr>
					<td class="commentContents" colspan="2">
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					</td>
				</tr>
				<tr>
					<td class="commentWriter">댓글작성자이름</td>
					<td class="commentWriteDate">댓글작성일자</td>
				</tr>
				<tr>
					<td class="commentContents" colspan="2">
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					</td>
				</tr>
			</table>
			
			<form id="newComment" name="newComment">
				<input id="commentWriter" name="commentWriter" type="text" value="심예은" readonly="readonly"/><br/>
				<textarea id="commentContents" name="commentContents" placeholder="댓글 내용을 입력하세요."></textarea>
				<img id="addComment" src="<%= ctxPath %>/resources/images/board/registerBtn.JPG" />
			</form>
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