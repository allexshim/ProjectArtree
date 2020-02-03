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
	
	#memberinfo-container {
		padding-bottom : 100px;
		width: 70%;
		margin: 0 auto;
	}
	
	img#boardtop {
		position : absolute;
		width : 96vw;
		height : 540px;
	}
	
	div#topText {
		padding-top : 610px;
		width : 40vw;
		text-align: left;
		padding-left : 60px;
	}
	
	div#topText > h1 {
		font-size: 50px;
	}
	
	div#middleText {
		padding-top : 8vh;
		width : 40vw;
		text-align: left;
		padding-left : 60px;
	}
	
	div#middleText > h1 {
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
	
	div#searchContainer #searchCondition {
		font-size : 12pt;
		height : 30px;
		margin-right : 10px;
	}
	
	div#searchContainer #searchicon {
		cursor : pointer;
	}
	
	/* == table 부분 == */
	
	#orderContents {
		clear:both;
		margin-top : 10vh;
		text-align: center !important;
	}
	
	th {text-align: center !important;}
	
	#orderContents > tbody > tr:hover {
		cursor: pointer;
		box-shadow: 3px 3px 3px 3px grey;
	}
	
	/* == ul 부분 == */
	
	#infos {
		margin-top: 10vh;
	}
	
	#infos > ul > li {
		line-height: 300%;
		font-size: 1.3em;
	}
	
	#infos > ul > li > label {
		width: 100px;
		
	}
	
	/* == 페이징 버튼 == */
	#morebtn {
		width: 120px;
		height: 50px;
		font-weight: bold;
		font-size: 1.3em;
		background-color: black;
		color: white;
		border: none;
		margin-top: 5vh;
	}
	
	#myModal {
		margin-top: 200px;
	}
	
	#orderInfoTable td:nth-child(2) {
		width: 150px;
		overflow: visible;
	}
	
</style>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){ 
		
		$("#orderContents tbody tr").click(function(){
			
			let reserno = $(this).find(".reserno").text();
			
			$("#myModal").modal('show');
			
			$.ajax({
				
				url: "<%= request.getContextPath() %>/orderInfo.at",
				type: "GET",
				data: {"reserno" : reserno},
				dataType: "JSON",
				success: function(json) {
					
					$("#orderInfoTable").empty();
					
					let html = "";
					let modalheader = "";
					let total = "";
					
					html += "<thead style='font-weight: bold'>";
					html += "<tr>";
					html += "<td>no</td>";
					html += "<td>전시회명</td>";
					html += "<td>관람일자</td>";
					html += "<td>티켓종류</td>";
					html += "<td>수량</td>";
					html += "<td>사용여부</td>";
					html += "<td>가격</td>";
					html += "</tr>";
					html += "</thead>";
				
					html += "<tbody>";

					if(json.length == 0) {
						html += "<tr class='' style='cursor: pointer;'>";
						html += "<td colspan='4'>";
						html += "조회된 주문의 정보가 없습니다.";
						html += "</td>";
						html += "</tr>";
					} else {
						
						$.each(json, function(index, item) {
							
							if(index == 1) {
								modalheader += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
								modalheader += "<p class='modal-title'>예매번호 : " + item.reserno + " </p>";
								modalheader += "<p class='modal-title'>주문일자 : " + item.reserdate + " </p>";
								modalheader += "<p class='modal-title'>주문자명 : " + item.name + " </p>";
								
								total += "<p>총 금액 : " + item.resertotal + "</p>";
							}
							
							html += "<tr>";
							html += "<td>" + item.reserno + "</td>";
							html += "<td>" + item.exname + "</td>";
							html += "<td>" + item.dday + "</td>";
							html += "<td>" + item.purtype + "</td>";
							html += "<td>" + item.qt + "</td>";
							html += "<td>" + item.price + "</td>";
							html += "<td>" + item.reserstat + "</td>";
							html += "</tr>";
						
						});
						
					}
					
					html += "</tbody>";
					
					$("#modalheader").html(modalheader);
					$("#orderInfoTable").html(html);
					$("#totalprice").html(total);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
				
			});
			
		});
		
	});

</script>
</head>
<body>

	<div id="imgcontainer">	
	  	<img id="boardtop" src="<%= ctxPath %>/resources/images/board/boardImage1.jpg" />
	</div>

	<div id="memberinfo-container">

		<div id="topText">
			<h1 style="margin:0;">Member Info</h1>
		</div>
		
		<div id="infos">
		
			<ul style="list-style-type: none;">
			
				<li><label>No.</label><span>${ memberInfo.idx }</span></li>
				<li><label>EMAIL</label><span>${ memberInfo.email }</span></li>
				<li><label>NAME</label><span>${ memberInfo.name }</span></li>
				<li><label>GENDER</label><span>${ memberInfo.gender }</span></li>
				<li><label>AGELINE</label><span>${ memberInfo.agegroup }</span></li>
				<li><label>AREA</label><span>${ memberInfo.area }</span></li>
				<li><label>PHONE</label><span>${ memberInfo.hp }</span></li>
				<li><label>STATUS</label><span>${ memberInfo.status }</span></li>
			
			</ul>
		
		</div>
		
		<hr style="border-bottom: 1px solid grey; margin-top: 10vh;">
		
		<div id="middleText">
			<h1 style="margin:0;">Order Info</h1>
		</div>
		
		<div id="contentContainer" class="container">
			<table id="orderContents" class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>DATE</th>
						<th>PRICE</th>
						<th>NAME</th>
						<th>PHONE</th>
					</tr>	
				</thead>
				
				<tbody>
					<c:if test="${ not empty orderList }">
					<c:forEach var="order" items="${ orderList }">
					<tr>
						<td class="reserno">${ order.reserno }</td>
						<td>${ order.reserdate }</td>
						<td>${ order.resertotal }</td>
						<td>${ order.name }</td>
						<td>${ memberInfo.hp }</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${ empty orderList }">
					<tr>
						<td colspan="5">주문내역이 없습니다.</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			<div style="margin: 0 auto" align="center">
				<!-- <button type="button" id="morebtn">MORE</button> --><!-- 차트하고 시간나면 하자 -->
			</div>
		</div>
		
		<div class="container" id="modalContainer">
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
					    
						<!-- Modal content-->
						<div class="modal-content" id="orderModal" style="width: 150%">
							<div class="modal-header" id="modalheader" style="font-size: 11pt; line-height: 150%;">
								
							</div>
							<div class="modal-body">
							
								<div id="listArea" style="margin-top: 5vh">
									<table id="orderInfoTable" class="table">
										
									</table>
								</div>
							</div>
							<div class="modal-footer">
								<div id="totalprice" style="height:50px; border-bottom: 1px solid lightgrey; font-weight: bold; font-size: 14pt; text-align: right;">
									
								</div>
							
								<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-top: 30px">Close</button>
							</div>
						</div>
					      
					</div>
				</div>
			</div>
		
	</div>

</body>
</html>