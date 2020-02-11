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
	
	div#detailContents {
		width: 70%;
		margin: 0 auto;
		padding-bottom: 20px;
		border-bottom : solid 2px lightgray;
		overflow: hidden; /* div밖으로 이미지가 넘칠 때 해결 방법! 기억해둘것! */
		padding-top : 50px;
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
		width : 97%;
		border : 1px solid lightgray;
	}
	
	table#detailTable > tbody > tr:nth-child(8) > td {
		/* width : 100%; */
		font-weight: normal;
		padding-top : 20px;
	}

	div#myBtns {
		float : right;
		padding-right : 50px;
	}
	
	div#myBtns img {
		padding : 10px;
		cursor : pointer;
	}
	
	/* div#preNext {
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
	} */
	
	div#toListBtn {
		padding-top : 20px;
		padding-bottom : 20px;
		overflow : hidden;
		cursor : pointer;
	}
	
	div#detailContainer input, div#detailContainer textarea {
		border-radius: 5px;
	}
	
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.js"></script>							

<script type="text/javascript">
	$(document).ready(function(){ 
		$("#period").datepicker({			
			dayNamesMin : ['월','화','수','목','금','토','일'],			
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			altField: '#calendar-date',
			dateFormat: 'yy-mm-dd'
		});	
		
		$("#periodEnd").datepicker({			
			dayNamesMin : ['월','화','수','목','금','토','일'],			
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			altField: '#calendar-date',
			dateFormat: 'yy-mm-dd'
		});	
		
		$("#name").focus(function(){

			$("#myModal").modal('show');
			$("searchWord").focus();
			
		});
		
		// 이전글 클릭시 이벤트
		$(".prev").click(function(){
			
		}) // 이전글 클릭시 이벤트 -------------
		
		
		// 다음글 클릭시 이벤트
		$(".next").click(function(){
			
			
		}) // 다음글 클릭시 이벤트 --------------
		
		$("#searchWord").keydown(function(){
			if(event.keyCode==13) {
				event.preventDefault();
				searchExhibition($("#searchWord").val());
			}	
		});
		
		$(".searchBtn").click(function(){
			searchExhibition($("#searchWord").val());
		});

		
		// 글목록으로 돌아가기
		$("#toListBtn").click(function(){
			window.location.href="/artree/event.at";
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
				var frm = document.addEvent;
				frm.method = "GET";
				frm.action = "addEventEnd.at";
				frm.submit();
			}
		});
		
		
	}); // end of $(document).ready -------------------------------------

	function searchExhibition(searchWord) {
		$.ajax({
			url: "<%= ctxPath %>/searchExhibitInModal.at",
			type: "GET",
			data: { "searchWord":searchWord },
			dataType: "JSON",
			success: function(json){
				$("#galleryListTable").empty();				
				
				let html ="";
				html += "<thead>";
				html += "<tr>";
				html += "<th>번호</th>";
				html += "<th>전시회 이름</th>";
				html += "<th>작가</th>";
				html += "<th>장소</th>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				
				if(json.length == 0) {
					html += "<tr class='' style='cursor: pointer;'>";
					html += "<td colspan='4'>";
					html += "조회된 갤러리가 없습니다.";
					html += "</td>";
					html += "</tr>";
				}
				
				else {	
					$.each(json, function(index, item) {
						html += "<tr style='cursor: pointer;' onclick='selectedExhibition()' class='selectedExhibition'>";
						html += "<td style='width: 5px !important;' class='exhibitno'>" + item.exhibitionno + "</td>";
						html += "<td style='width: 300px !important' class='exhibitionname'>" + item.exhibitionname + "</td>";
						html += "<td style='width: 50px !important'>" + item.author + "</td>";
						html += "<td style='width: 80px !important'>" + item.galleryname + "</td>";
						html += "</tr>";
					});					
				}
				
				html += "</tbody>";
				
				$("#exhibitionListTable").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	} // end of searchExhibition ----------------------------------------
	
	
	function selectedExhibition(){
		$(document).on("click", ".selectedExhibition", function() {
			
			/*exhibitionno, exhibitionname, author, galleryname*/
			let exhibitionname = $(this).find(".exhibitionname").text();
			let exhibitionno = $(this).find(".exhibitno").text();
			// sessionStorage에 데이터 저장
			sessionStorage.setItem("exhibitionname", exhibitionname);
			sessionStorage.setItem("exhibitionno", exhibitionno);
			$("#myModal").modal('hide');
			
			writeExhibition();		
		});
	} // end of selectedExhibition -----------------------------------------
	
	
	function writeExhibition() {
		
		let exhibitionname = sessionStorage.getItem("exhibitionname");
		let exhibitionno = sessionStorage.getItem("exhibitionno");
		
		if( (exhibitionname != null) && (exhibitionname != "" )) {
		    $("#name").val(exhibitionname);
		    $("#no").val(exhibitionno);
		    
		    // modal에 남아있는 검색 데이터를 초기화한다.
		    sessionStorage.removeItem("exhibitionname");
		    $("#searchWord").val("");
		    searchExhibition("");
		}	
	} // end of writeExhibition ----------------------------------------
	
</script>

</head>
<body>
	<div id="detailContainer">
		<div class="Title_Area">
			<span class="st">Membership</span>
			<span class="lt">Event</span>
		</div>
		
	<%-- 	<div id="myPoster" align="center">
			<img src="<%= ctxPath %>/resources/images/exhibition/poster1.JPG" />
		</div>
		 --%>
		<div id="detailContents">
		<form name="addEvent">
			<table id="detailTable">
				<tr>
					<td>전시회명</td>
					<td>
						<input id="name" name="name" type="text" placeholder="전시회 이름을 입력해주세요." autocomplete="off" />
						<input id="no" name="no" type="hidden"/>
					</td>
				<tr>
			
				<tr>
					<td>제목</td>
					<td><input id="title" name="title" type="text" placeholder="제목을 입력해주세요."/></td>
				<tr>
				<tr>
					<td>작성자</td>
					<td>${loginuser.name}</td>
				<tr>
				<tr>
					<td>기간</td>
					<td>
						<input style="width: 10%; text-align: center;" size="2" id="period" name="period" type="text"/>
						~ <input style="width: 10%; text-align: center;" size="2" id="periodEnd" name="periodEnd" type="text"/>
					</td>					
				<tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" style="resize:none; border:solid 1px lightgray; font-weight:normal !important;" rows="10" cols="120">
						</textarea>
					</td>
				<tr>
			</table>
	</form>
			<div id="myBtns">
				<img id="registerBtn" src="<%= ctxPath %>/resources/images/board/registerBtn.JPG" />
			</div>
		</div>
		
		<!-- <div id="preNext">
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
		</div> -->
		<div id="toListBtn" align="center">
			<img id="toListBtn" src="<%= ctxPath %>/resources/images/board/toListBtn.JPG" />
		</div>
	</div>
	
	<!-- ==================== 전시회 검색 모달 =================================== -->
	<div class="container" id="modalContainer">
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
			    
				<!-- Modal content-->
				<div class="modal-content" id="exhibitionModal">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">전시회 검색</h4>
					</div>
					<div class="modal-body">
					
						<div id="searchArea" align="center" style="margin-top: 3vh">
							<input type="text" name="searchWord" id="searchWord" style="width: 60%; margin: 0 auto;" autocomplete="off" placeholder="전시회 이름으로 검색" /><i class="fas fa-search searchBtn" style="font-size:15pt; padding-left:10px; cursor:pointer;"></i>
						</div>
						
						<div id="listArea" style="margin-top: 5vh">
							<table id="exhibitionListTable" class="table" style="cursor:pointer;">
								<thead style="font-weight: bold">
									<tr>
										<td>번호</td>
										<td>전시회 이름</td>
										<td>작가</td>
										<td>장소</td>
									</tr>
								</thead>
								
								<tbody>
									<c:if test="${ not empty exhibitionList  }">
									<c:forEach var="exhibit" items="${ exhibitionList }" varStatus="status">
										<tr onclick='selectedExhibition()' class="selectedExhibition">
											<td style='width: 5px !important;' class='exhibitno'>${ exhibit.exhibitionno }</td>
											<td style="width: 300px !important" class="exhibitionname">${ exhibit.exhibitionname }</td> 
											<td style="width: 50px !important">${ exhibit.author }</td>
											<td style="width: 80px !important">${ exhibit.galleryname }</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${ empty exhibitionList }">
										<tr><td>결과가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			      
			</div>
		</div>
	</div>
		
		
</body>
</html>