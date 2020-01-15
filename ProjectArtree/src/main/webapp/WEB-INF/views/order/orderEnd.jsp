<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderEndBin</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.js"></script>							

<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	body{
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	th {
		width: 25%;				
	}
</style>
<script>
	$(function(){
		$("#accordion").accordion();
	})
		
	function goRefund() {
		var frm = document.refundBin;	
		frm.method="GET";
		frm.action="<%=ctxPath %>/refundBin.at";		
		frm.submit();
	}
</script>
<body>
	<form name="refundBin">
	<div style="width: 60%; margin: 0 auto;">
		<div>
			<div style="margin-bottom: 1%; font-weight: bold; font-size: 22px; padding-top: 5%;">주문 상품 정보</div>
			<table class="table table-hover">			
				<tr>
					<th>이미지</th>
					<td><img style="width: 100%;" src="<%=ctxPath%>/resources/images/order/base.jpg"></td>									
				</tr>				
				<tr>
					<th>상품정보</th>
					<td>KAWS: COMPANIONSHIP IN THE AGE OF LONELINESS</td>
				</tr>				
				<tr>
					<th>날짜</th>
					<td>Sunday 19 Jan 2020</td>
				</tr>				
				<tr>
					<th>수량</th>
					<td>1</td>
				</tr>										
				<tr>
					<th>예매취소</th>
					<td><div onclick="goRefund()" style="font-weight:bold; text-align:center; color:black; background:white; cursor:pointer; border: solid 1px black; border-radius: 4px; width: 5%;">취소</div></td>
				</tr>				
			</table>						
		</div>	
			
		<div>
			<div style="margin-bottom: 1%; font-weight: bold; font-size: 22px;">주문정보</div>
			<table class="table table-hover">
				<tr>
					<th>주문번호</th>
					<td>20200114001</td>
				</tr>
				<tr>
					<th>주문일자</th>
					<td>2020-01-14 18:53</td>
				</tr>
				<tr>
					<th>주문자</th>
					<td>정핫빈</td>
				</tr>
				<tr>
					<th>예약상태</th>
					<td>사용대기</td>
				</tr>
			</table>
		</div>
			
		<div>
			<div style="margin-bottom: 1%; font-weight: bold; font-size: 22px;">결제정보</div>
			<table class="table table-hover">
				<tr>
					<th>총 주문금액</th>
					<td>10000원</td>
				</tr>
				<tr>
					<th>총 할인금액</th>
					<td>2000원</td>
				</tr>
				<tr>
					<th>총 결제금액</th>
					<td>8000원</td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>신용카드</td>
				</tr>
			</table>
		</div>
		
		<div id="accordion">		
			<h3 style="text-align: left; font-size: 22px; font-weight: bold;">예매 취소 시 유의사항</h3>
			<div>
				<div>
					<div style="font-size: 14px; font-weight: bold;">유의사항<br><br></div>
					<div style="line-height:1.8; font-size: 14px;">
						예매티켓의 취소 및 변경은 전시 마감전일 18시가지 가능합니다.<br>
						취소마감시간 이후에는 티켓의 취소가 불가합니다.<br>
						고객 귀책 사유로 티켓 분실이나 파손이 될 경우에는 티켓은 재발행 되지 않으며, 취소도 불가합니다.<br>
						티켓 예매시 선택한 결제수단으로만 환불이 가능합니다.<br>
						Artree 이외의 외부 예매처에서 예매한 티켓은 직접 예매한 곳으로 환불 절차를 문의해주시기 바랍니다.<br>
						초대권으로 명시된 티켓은 화불이 불가합니다.<br><br><br>			
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
			<h3 style="text-align: left; font-size: 22px; font-weight: bold;">티켓 수령 안내</h3>
			<div>
				<div style="font-size: 14px; font-weight: bold;">현장수령<br><br></div>
				<div style="line-height:1.8; font-size: 14px;">					
					전시당일 뮤지엄 메인로비 '티켓 박스'에서 티켓을 발권 받을 수 있습니다.<br>
					입장은 전시 관람 종료 30분 이전까지만 가능합니다.<br>
					예매확인서 또는 신분증을 제시하시고 티켓을 수령하실 수 있습니다.
				</div>
			</div>			
		</div>		
		<div style="overflow: hidden; margin-bottom: 5%;">
			<div style="font-weight:bold; text-align:center; color:black; background:white; cursor:pointer; float: right; border: solid 2px black; border-radius: 4px; width: 10%; margin-top: 3%;">주문목록</div>					
		</div>				
	</div>
	</form>			
</body>
</html>