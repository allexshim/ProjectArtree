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
	
	$(function(){			
		
		if ( ${totalBin != null}) {
			var totalbin = ${totalBin};
			$("#Subtotal").html("&#8361;"+totalbin.toLocaleString());
			$("#total").html("&#8361;"+totalbin.toLocaleString());		
			$("#orderpri").val(totalbin);		
			sessionStorage.setItem("order", totalbin)
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
	
	function discountBin() {		
		if($("#promo").val()=="하빈"){			
			if ( ${totalBin != null}) {
				var totalbin = ${totalBin};
				var discount = totalbin * 0.5;
				$("#Discount").html("&#8361;"+discount.toLocaleString());
				var total = totalbin - discount;
				$("#total").html("&#8361;"+total.toLocaleString());		
				sessionStorage.setItem("order", total)							
			}	
		}				
	}	
	
</script>
<body>
	<form name="order">
	<div style="padding-right:60px; width: 100%; margin: 0 auto;" align="center">
	<div style="padding: 3%;">
	
		<div style="padding-bottom:2%; padding-top: 1%; font-size: 25px;">
			PAYMENT
		</div>			
		 
		<div style="overflow:hidden; text-align: right;">
			<div onclick="discountBin()" style="color:black; background:white; cursor:pointer; float: right; border: solid 2px #EDEBEB; text-align:center; padding:6px 12px; border-radius: 4px; width: 10%; font-size: 15px;">Submit</div>
			<div style="margin-right:1%; font-size:15px; float:right;"><input id="promo" style="width:10em; padding:6px 12px;" type="text" size="2" placeholder="Promo code"></div>
			<div style="width:9%; padding:6px 12px; font-weight:bold; margin-right:3%; overflow:hidden; font-size:15px; border:2px solid black; float:right;">
				<div style="float:left;" >Cart</div>
				<div style="float:right;"><img style="width: 15px; height: 15px;" src="<%=ctxPath%>/resources/images/order/cart.png"></div>
			</div>		
		</div>
			
		<hr>
		
		<div style="font-size: 25px; text-align: left;">CART</div>
		
		<div style="margin-top:2%; text-align:left; font-size:18px; padding: 27px; border: 1px solid #EDEBEB;">
		
			<div style="overflow: hidden;">
				<div style="float: left; font-weight: bold;">${exhibitionname }</div>
				<div style="float: right; font-weight: bold;">${n }</div>
			</div>
				
			<div style="padding: 1% 0;">${dateBin}</div>
			
			<div style="margin: 1% 0 3% 0;">	
				${html}										
			</div>
			
			<div style="overflow: hidden;">								
				<div id="Subtotal" style="float: right; width: 10%; text-align: right;"></div>
				<div style="margin-right:5%; float:right;">Subtotal</div>		
			</div>
			
			<div style="overflow: hidden;">								
				<div id="Discount" style="float: right; width: 10%; text-align: right;">&#8361;0</div>
				<div style="margin-right:5%; float:right;">Discount</div>		
			</div>
			
			<div style="overflow: hidden;">								
				<div id="total" style="font-weight:bold; float: right; width: 10%; text-align: right;"></div>
				<div style="margin-right:5%; font-weight:bold; float:right;">Total</div>
				<input hidden="hidden" id="orderpri" name="orderpri" value="">		
			</div>
		
		</div>			
		
		<div style="overflow: hidden;">
			<div onclick="location.href='<%= ctxPath %>/ticketsbin.at'" style="color:black; background:white; cursor:pointer; float: left; border: solid 1px black; border-radius: 4px; width: 5%; margin-top: 1%; padding: 0.3%;">이전</div>
			<div data-target="#myModal" data-bmdSrc="<%=ctxPath%>/paymentGatebin.at" data-toggle="modal" class="bmd-modalButton" style="color:black; background:white; cursor:pointer; float: right; border: solid 1px black; border-radius: 4px; width: 5%; margin-top: 1%; padding: 0.3%;">결제하기</div>			 			
		</div>	
	</div>
	</div>		
    </form>
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
