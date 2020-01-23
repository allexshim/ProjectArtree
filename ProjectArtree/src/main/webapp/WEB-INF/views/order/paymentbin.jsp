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
	var total = 0;
	$(function(){
		
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
			
		cartList();
		
		// 장바구니 삭제		
		$(document).on("click",".delCart",function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/delCart.at",				
				type:"POST",					
				data:{"delCartNo":$(this).find("input[name=delCartNo]").val()},
				async:false,
				dataType:"JSON",
				success:function(json){																
					cartList();
					totalpri(); 			
					orderpri();
					discount();
					if (total == 0) {
						$("#order").hide();
					}					
				}, 
				error:function(request,status,error) {
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}				
			});										
		}); 
		
		totalpri(); 			
		orderpri();		
		
		$("#promo").keydown(function(key){			
			if(key.keyCode==13){
				$("#submit").click();
			}
		});
		 
		$("#submit").click(function(a){	
			discount();			
		});	
		
		if(total = 0) {
			$("#order").hide();
			$("#Discount").html("&#8361;"+total.toLocaleString());
			$("#total").html("&#8361;"+total.toLocaleString());
		}
		
	});	// ready
	
	function discount() {
		var habin = $("#habin").val()
		if($("#promo").val()=="하빈"){			
			if ( habin != 0) {					
				var totalbin = habin;					
				var discount = totalbin * 0.5;				
				$("#Discount").html("&#8361;"+discount.toLocaleString());
				var totala = totalbin - discount;
				$("#total").html("&#8361;"+totala.toLocaleString());		
				sessionStorage.setItem("order", totala)				
				$("#inSubtotal ").val(habin);
				$("#inDiscount ").val(discount);
				$("#orderpri").val(totala);
			}
			else {
				$("#Discount").html("&#8361;"+habin.toLocaleString());
				$("#total").html("&#8361;"+habin.toLocaleString());
				$("#inSubtotal ").val(habin);
				$("#inDiscount ").val(0);
				$("#orderpri").val(habin);	
			}
		}	
	}
	
	function orderpri() {		
		if ( total != 0) {
			var totalbin = total;
			$("#Subtotal").html("&#8361;"+totalbin.toLocaleString());
			$("#total").html("&#8361;"+totalbin.toLocaleString());
			$("#inSubtotal ").val(totalbin);
			$("#inDiscount ").val(0);
			$("#orderpri").val(totalbin);		
			sessionStorage.setItem("order", totalbin)
		} 
		
		else {
			var totalbin = total;
			$("#Subtotal").html("&#8361;"+totalbin.toLocaleString());
			$("#total").html("&#8361;"+totalbin.toLocaleString());
			$("#inSubtotal ").val(totalbin);
			$("#inDiscount ").val(0);
			$("#orderpri").val(totalbin);		
			sessionStorage.setItem("order", totalbin)
		}	
	}	
	
	function orderEnd() {
		var frm = document.order;		
		frm.method="POST";
		frm.action="<%=ctxPath%>/orderEnd.at";		
		frm.submit();				
	}
	
	function totalpri() {
		total = 0;
		$(".n").each(function(){			
			value = Number($(this).find($("input[name=n]")).val());			
			total += value;			
		});		
		$("#habin").val(total);
	}	
	
	function cartList() {		
		// 장바구니 리스트 출력
		var formdata = $("form[name=order]").serialize();	
		$.ajax({
			url:"<%=request.getContextPath()%>/cartList.at",			
			type:"POST",							
			data:formdata,	
			async:false,
			dataType:"JSON",
			success:function(json){
				var html = "";
				var n = 0;								
				$.each(json, function(index, item){
					var cartNo = item.cartNo;					
					var dday = item.dday;
					var exnameList = item.exname;
					$("#cartNo").val(cartNo);	
					
					var formdata2 = $("form[name=order]").serialize();
					$.ajax({
						url:"<%=request.getContextPath()%>/cartDetailList.at",
						type:"POST",							
						data:formdata2,
						async:false,
						dataType:"JSON",
						success:function(json3){    
							$.each(json3, function(index3, item3){								
								var qtList = item3.qt;								
								var priceList = item3.price;																	
								n += qtList * priceList;								
							});																	
						},
						error:function(request,status,error) {
							alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						}				
					});	
					html += "<div style=\"overflow: hidden;\">";
					html += "<div style=\"float: left; font-weight: bold;\">"+exnameList+"</div>";
					html += "<div class=\"delCart\" style=\"float: right; cursor:pointer; margin-left: 2%; line-height: 1;\"><img style=\"width: 25px; height: 25px;\" src=\"<%=ctxPath%>/resources/images/order/clear.png\"><input hidden=\"hidden\" value=\""+cartNo+"\" name=\"delCartNo\"></div>";							
					html += "<div class=\"n\" style=\"float: right; font-weight: bold;\">&#8361;"+n.toLocaleString()+"<input hidden=\"hidden\" value=\""+n+"\" name=\"n\"></div>";
					html += "";					
					n=0;
					html += "</div>	";
					html += "<div style=\"padding: 1% 0;\">"+dday+"</div>";
					html += "<div style=\"margin: 1% 0 3% 0;\">";					
					html += "";
					
					var formdata3 = $("form[name=order]").serialize();
					$.ajax({
						url:"<%=request.getContextPath()%>/cartDetailList.at",
						type:"POST",								
						data:formdata3,
						async:false,
						dataType:"JSON",
						success:function(json2){    
							$.each(json2, function(index2, item2){									
								var qtList = item2.qt;
								var typeList = item2.purtype;
								var priceList = Number(item2.price);									
								html += "<div style='border-bottom: 1px solid white; color:#666; font-size:14px; padding:4px 10px; overflow: hidden; background-color: #f3f3f4;'>";
								html += "<div style='float: left; width: 25%; text-align: left;'>"+typeList+"</div>";
								html += "<div style='float: left;'>"+qtList+"&nbsp;Item(s)</div>";
								html += "<div style='float: right;'>&#8361;"+priceList.toLocaleString()+"</div>";								
								html += "</div>	";								
							});																	
						},
						error:function(request,status,error) {
							alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						}				
					});							
					html += "</div>";					
				});									
				$("#cartList").html(html);	
				
			},
			error:function(request,status,error) {
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}				
		});	
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
			<div id="submit" style="color:black; background:white; cursor:pointer; float: right; border: solid 2px #EDEBEB; text-align:center; padding:6px 12px; border-radius: 4px; width: 10%; font-size: 15px;">Submit</div>
			<div style="margin-right:1%; font-size:15px; float:right;"><input id="promo" style="width:10em; padding:6px 12px;" type="text" size="2" placeholder="Promo code"></div>			
		</div>
			
		<hr>
		
		<div style="font-size: 25px; text-align: left;">CART</div>					
		
		<div style="margin-top:2%; text-align:left; font-size:18px; padding: 27px; border: 1px solid #EDEBEB;">
			
			<div id="cartList">							
			</div>	
			<input id="cartNo" hidden="hidden" value="" name="cartNo">
			<input id="habin" hidden="hidden" value="" name="habin">																			
			
			<div style="overflow: hidden;">								
				<div id="Subtotal" style="float: right; width: 10%; text-align: right;"></div>
				<div style="margin-right:5%; float:right;">Subtotal</div>
				<input hidden="hidden" id="inSubtotal" name="Subtotal" value="">		
			</div>
			
			<div style="overflow: hidden;">								
				<div id="Discount" style="float: right; width: 10%; text-align: right;">&#8361;0</div>
				<div style="margin-right:5%; float:right;">Discount</div>	
				<input hidden="hidden" id="inDiscount" name="Discount" value="">	
			</div>
			
			<div style="overflow: hidden;">								
				<div id="total" style="font-weight:bold; float: right; width: 10%; text-align: right;"></div>
				<div style="margin-right:5%; font-weight:bold; float:right;">Total</div>
				<input hidden="hidden" id="orderpri" name="orderpri" value="">		
			</div>
			
		</div>					
		<div style="overflow: hidden;">
			<div onclick="location.href='<%= ctxPath %>/ticketsbin.at'" style="color:black; background:white; cursor:pointer; float: left; border: solid 1px black; border-radius: 4px; width: 5%; margin-top: 1%; padding: 0.3%;">이전</div>
			<div id="order" data-target="#myModal" data-bmdSrc="<%=ctxPath%>/paymentGatebin.at" data-toggle="modal" class="bmd-modalButton" style="color:black; background:white; cursor:pointer; float: right; border: solid 1px black; border-radius: 4px; width: 5%; margin-top: 1%; padding: 0.3%;">결제하기</div>			 			
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
