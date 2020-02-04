<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderEndBin</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.js"></script>							

<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	body{
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	th {
		width: 30%;				
	}
	
	#ui-id-1, #ui-id-3, #ui-id-1:focus, #ui-id-3:focus, #ui-id-1:hover, #ui-id-3:hover { 
		outline: none; 
		border: none;
	}

/* 슬라이드 시작 */
.mySlides {display: none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: black;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: black;
  font-size: 11px;
  display: inline-block;
  margin-left: 1%;
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
/* 슬라이드 끝 */
</style>

<script>
	$(function(){		
		$("#accordion").accordion();
		
		$("#cancelB").click(function(){
			if(${cancelB==1}){				
				cancelPay();
			}
			else {
				alert("관람일자가 지난표가 포함되어 있어 취소가 불가합니다.");
			}
		});
	})		
		
</script>
<body>

	<input id="cancle" type="text" hidden="hidden" value="${reserNo}" name="cancle">
		
	<div style="width: 60%; margin: 0 auto;">
		
		<div>
			<div style="padding-top:15%; margin-bottom: 1%; font-weight: bold; font-size: 22px;">주문정보</div>
			<table class="table table-hover">
				<tr>
					<th>예매번호</th>
					<td>${RESERNO }</td>
				</tr>
				<tr>
					<th>예매일자</th>
					<td>${RESERDATE }</td>
				</tr>
				<tr>
					<th>주문자</th>
					<td>${loginuser.name }</td>
				</tr>
				<tr>
					<th>예매상태</th>
					<td>${RESERSTAT }</td>
				</tr>
				<tr>
					<th>예매취소</th>
					<td><div id="cancelB" style="text-align:center; color:black; background:white; cursor:pointer; border: solid 1px black; border-radius: 4px; width: 5%;">취소</div></td>
				</tr>	
			</table>
		</div>
			
		<div>
			<div style="margin-bottom: 1%; font-weight: bold; font-size: 22px;">결제정보</div>
			<table class="table table-hover">
				<tr>
					<th>총 주문금액</th>
					<td>&#8361;<fmt:formatNumber value="${RESERSUBTOTAL }" pattern="#,###"/></td>
				</tr>
				<tr>
					<th>총 할인금액</th>
					<td>&#8361;<fmt:formatNumber value="${RESERDISCOUNT }" pattern="#,###"/></td>
				</tr>
				<tr>
				
					<th>총 결제금액</th>
					<td>&#8361;<fmt:formatNumber value="${RESERTOTAL }" pattern="#,###"/></td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>${PAYMENTOP }</td>
				</tr>
			</table>
		</div>
		
		${html }				
		
		<div style="margin-top: 5%;" id="accordion">		
			<h3 style="padding:2%; text-align: left; font-size: 22px; font-weight: bold;">예매 취소 시 유의사항</h3>
			<div style="height:325px !important;">
				<div>
					<div style="font-size: 14px; font-weight: bold;">유의사항<br><br></div>
					<div style="line-height:1.8; font-size: 14px;">
						예매티켓의 취소는 관람일 전일까지 가능합니다.<br>
						취소마감시간 이후에는 티켓의 취소가 불가합니다.<br>
						고객 귀책 사유로 티켓 분실이나 파손이 될 경우에는 티켓은 재발행 되지 않으며, 취소도 불가합니다.<br>
						티켓 예매시 선택한 결제수단으로만 환불이 가능합니다.<br>
						Artree 이외의 외부 예매처에서 예매한 티켓은 직접 예매한 곳으로 환불 절차를 문의해주시기 바랍니다.<br>
						초대권으로 명시된 티켓은 환불이 불가합니다.<br><br>			
					</div>
				</div>
				<div>
					<div style="font-size: 14px; font-weight: bold;">취소수수료<br><br></div>
					<div style="line-height:1.8; font-size: 14px;">
						취소일 : 예매 후 7일 이내<br>
						취소수수료 : 없음
					</div>
				</div>		
			</div>
			<h3 style="padding:2%; text-align: left; font-size: 22px; font-weight: bold;">티켓 수령 안내</h3>
			<div style="height:400px !important;">
				<div style="font-size: 14px; font-weight: bold;">현장수령<br><br></div>
				<div style="line-height:1.8; font-size: 14px;">					
					전시당일 뮤지엄 메인로비 '티켓 박스'에서 티켓을 발권 받을 수 있습니다.<br>
					입장은 전시 관람 종료 30분 이전까지만 가능합니다.<br>
					예매확인서 또는 신분증을 제시하시고 티켓을 수령하실 수 있습니다.
				</div>
			</div>			
		</div>		
		<div style="overflow: hidden; margin-bottom: 5%;">
			<div onclick="goList()" style="text-align:center; color:black; background:white; cursor:pointer; float: right; border: solid 1px black; border-radius: 4px; width: 8%; margin-top: 1%; padding: 0.3%;">주문목록</div>					
		</div>				
	</div>	
	
<script>
	
	function goList() {
		location.href="<%=ctxPath%>/mypage_order.at";
	}
	
	function cancelPay() {
		// 해당 주문내역 삭제하고 주문내역으로 보내기  
		$.ajax({
			url:"<%=request.getContextPath()%>/delReser.at",				
			type:"POST",					
			data:{"reserNo":$("#cancle").val()},
			async:false,
			error:function(request,status,error) {
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}	
		});				
		location.href="<%=ctxPath%>/mypage_order.at";
	}
	
	/* 슬라이드 */ 
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}
	/* 슬라이드 끝 */
</script>
		
</body>
</html>