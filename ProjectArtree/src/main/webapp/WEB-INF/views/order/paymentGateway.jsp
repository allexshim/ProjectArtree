<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>	
	.imp-dialog {
		left:-15px !important;
		right:15px !important;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//	여기 링크를 꼭 참고하세용 http://www.iamport.kr/getstarted
   //var IMP = window.IMP;     // 생략가능
   IMP.init('imp67335466');  // 중요!!  아임포트에 가입시 부여받은 "가맹점 식별코드". 
	
   // 결제요청하기
   IMP.request_pay({
       pg : 'html5_inicis', // 결제방식 PG사 구분
       pay_method : 'card',	// 결제 수단
       merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
       name : '${exhibitionname}',	 // 코인충전 또는 order 테이블에 들어갈 주문명 혹은 주문 번호. (선택항목)원활한 결제정보 확인을 위해 입력 권장(PG사 마다 차이가 있지만) 16자 이내로 작성하기를 권장
       amount : sessionStorage.getItem("order") ,	  //  결제 금액 number 타입 
       buyer_email : '${email}',  // 구매자 email 여기랑
       buyer_name : '${name}',	  // 구매자 이름 여기만
       buyer_tel : '3',    // 구매자 전화번호 (필수항목)
       buyer_addr : '4',  
       buyer_postcode : '5',
       m_redirect_url : '6'  
    		// 휴대폰 사용시 결제 완료 후 action : 컨트롤러로 보내서 자체 db에 입력시킬것!
   }, function(rsp) {
	   
	   /*
	   msg += '고유ID : ' + rsp.imp_uid;
	   msg += '상점 거래ID : ' + rsp.merchant_uid;
	   msg += '결제 금액 : ' + rsp.paid_amount;
	   msg += '카드 승인번호 : ' + rsp.apply_num;
	   msg += '에러내용 : ' + rsp.error_msg;
	   */
	   
       // 결제시 
	   if ( rsp.success ) {
		   parent.orderEnd();
		   //parent.document.location.href="orderEnd.at";		   
		   //1 imp_101725519638 2merchant_1579246724245 353164033
	   }        
	   // 실패시
	   else {		  
		   parent.document.location.reload();		  
	   }   		       
   }); // end of IMP.request_pay()----------------------------
	   
}); // end of $(document).ready()-----------------------------
</script>
</head>	

<body>
</body>
</html>
