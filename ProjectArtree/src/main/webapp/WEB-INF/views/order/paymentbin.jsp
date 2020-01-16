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
		if ( ${totalBin != null}) {
			var totalbin = ${totalBin};
			$(".totalBin").html("&#8361;"+totalbin.toLocaleString());
		}				
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
		<hr>
		 
		<div style="overflow:hidden; text-align: right;">
			<div onclick="location.href='<%= ctxPath %>/detailsbin.at'" style="color:black; background:white; cursor:pointer; float: right; border: solid 2px #EDEBEB; text-align:center; padding:6px 12px; border-radius: 4px; width: 10%; font-size: 15px;">Submit</div>
			<div style="margin-right:1%; font-size:15px; float:right;"><input style="width:10em; padding:6px 12px;" type="text" size="2" placeholder="Promo code"></div>
			<div style="width:9%; padding:6px 12px; font-weight:bold; margin-right:3%; overflow:hidden; font-size:15px; border:2px solid black; float:right;">
				<div style="float:left;" >Cart</div>
				<div style="float:right;"><img style="width: 15px; height: 15px;" src="<%=ctxPath%>/resources/images/order/cart.png"></div>
			</div>		
		</div>	
		
		<div style="margin-top:3%; text-align:left; font-size:18px; padding: 27px; border: 1px solid #EDEBEB;">
		
			<div style="overflow: hidden;">
				<div style="float: left;">KAWS: COMPANIONSHIP IN THE AGE OF LONELINESS</div>
				<div style="float: right;">$138.00</div>
			</div>
				
			<div>Sunday 19 Jan 2020</div>
			
			<div style="color:#666; margin:3% 0; font-size:14px; padding:4px 10px; overflow: hidden; background-color: #f3f3f4;">
				<div style="float: left;">갯수</div>
				<div style="float: right;">개당가격</div>
			</div>							
			
			<div style="overflow: hidden;">								
				<div class="totalBin" style="font-weight:bold; float: right;"></div>
				<div style="margin-right:5%; font-weight:bold; float:right;">Total</div>		
			</div>
		
		</div>			
		
		<div style="overflow: hidden;">	
			<div onclick="location.href='<%= ctxPath %>/detailsbin.at'" style="color:black; background:white; cursor:pointer; float: left; border: solid 2px black; border-radius: 4px; width: 10%; margin-top: 3%;">이전</div>
			<div data-target="#myModal" data-bmdSrc="<%=ctxPath%>/paymentGatebin.at" data-toggle="modal" class="bmd-modalButton" style="color:black; background:white; cursor:pointer; float: right; border: solid 2px black; border-radius: 4px; width: 10%; margin-top: 3%;">결제하기</div>			 			
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
