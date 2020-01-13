<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PaymentBin</title>
</head>

<!-- 결제 : 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>   	
	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	body{
		font-family: 'Noto Sans Kr', sans-serif;
		font-size: 250%;
	}
	
	.menubin {
		border-right: solid 1px black;
		width: 100%;
		padding: 1%;
	}
	
/* 모달 */ 

.bmd-modalContent {
  box-shadow: none;
  background-color: transparent;
  border: 0;
}

.bmd-modalContent iframe {
  display: block;
  margin: 0 auto;
}
	
</style>

<script>			
	
	$(document).ready(function(){
		$.fn.bmdIframe = function( options ) {
	        var self = this;
	        var settings = $.extend({
	            classBtn: '.bmd-modalButton'            
	        }, options );      
	      
	        $(settings.classBtn).on('click', function(e) {        
	          var dataVideo = {
	            'src': $(this).attr('data-bmdSrc'),
	            'height': $(this).attr('data-bmdHeight'),
	            'width': $(this).attr('data-bmdWidth')
	          };                        
	          $(self).find("iframe").attr(dataVideo);
	        });
	      
	        this.on('hidden.bs.modal', function(){
	          $(this).find('iframe').html("").attr("src", "");
	        });
	      
	        return this;
	 	};  
	  
		$("#myModal").bmdIframe();		
		
	});
	
	
</script>
<body>
	<div style="width: 60%; margin: 0 auto;" align="center">
		<div style="padding-top: 5%;">
			<ul style="border-radius:4px; border-top: solid 1px black; list-style-type: none; display: inline-flex; padding: 0;
			border-bottom: solid 1px black; border-left: solid 1px black; width: 100%;">
				<li class="menubin" style="background-color: black; color: white;">1.Ticket</li>
				<li class="menubin" style="background-color: black; color: white;">2.Date</li>
				<li class="menubin" style="background-color: black; color: white;">3.Detail</li>
				<li class="menubin" style="background-color: black; color: white;">4.Payment</li>			
			</ul>		
		</div>
		<div style="padding: 5% 0%;">	
			<form name="pgForm">
			<input type="hidden" name="Amt" value="1000">
			<input type="hidden" name="BuyerName" value="홍길동">
			<input type="hidden" name="OrderName" value="결제테스트">
			</form>			
		</div>
		
		<hr style="border: 2px solid black">
		
		<div style="overflow: hidden;">
			<div style="float: left;">총 결제금액</div>
			<div style="float: right;">0원</div>		
		</div>
		
		<div style="overflow: hidden;">	
			<div onclick="location.href='<%= ctxPath %>/detailsbin.at'" style="color:white; background:black; cursor:pointer; float: left; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">이전</div>
			<div data-target="#myModal" data-bmdSrc="<%=ctxPath%>/paymentGatebin.at" data-toggle="modal" class="bmd-modalButton" style="color:white; background:black; cursor:pointer; float: right; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">결제하기</div>			 			
		</div>		
	</div>
    
    <div class="modal fade" id="myModal" style="background-color: transparent;">
		<div class="modal-dialog" style="width: 880px;">
			<div class="modal-content bmd-modalContent">
				<div class="modal-body"> 
			          <div style="height: 630px;" class="embed-responsive embed-responsive-16by9">
						    <iframe frameborder="0"></iframe>
			          </div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
    
</body>
</html>
