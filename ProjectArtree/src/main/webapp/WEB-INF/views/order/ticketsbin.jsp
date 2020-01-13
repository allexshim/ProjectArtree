<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TicketsBin</title>
</head>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.js"></script>							

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

	 .linebin {
	 	line-height: 250% !important;
	 }
</style>

<script type="text/javascript">
	$(document).ready(function(){					
		
		$(".qtBin").spinner();		
		$(".qtBin").bind("spinstop",function(event){
			
			// 단체 할인 1~9명 처리 
			var groupqt = $(".groupBin").val();
			if(groupqt<=8 && groupqt>=1) {
				$(".groupBin").val(10);
			}
			else if (groupqt==9) {
				$(".groupBin").val(0);
			}			
						
			var totalP = 0;
			$(".qtBin").each(function(){  
				var num = $(".qtBin").index(this);	
				totalP += $(".pribin:eq("+num+")").val()*$(this).val(); // 각각 5개의 총 가격				 
			}); 
			
			var num = $(".qtBin").index(this);								
			var pri = $(".pribin:eq("+num+")").val()*$(this).val();		
			var pric = pri.toLocaleString();
			var price = "&#8361;"+pric;	
			
			if(pri != 0 ) {
				$(".qtResult:eq("+num+")").html(price);	
			}	
			
			else {
				$(".qtResult:eq("+num+")").html("");	
			}
			
			if(totalP != 0) {
				$(".totalBin").html("&#8361;"+totalP.toLocaleString());
			}
			
			else {
				$(".totalBin").html("");
			}
			
			
		});
	});			
	
	function goCtrl() {
		var frm = document.reposiBin;	
		frm.method="GET";
		frm.action="<%=ctxPath %>/datebin.at";		
		frm.submit();
	}
</script>

<body>
	<div style="width: 60%; margin: 0 auto;" align="center">
		<div style="padding-top: 5%;">
			<ul style="border-radius:4px; border-top: solid 1px black; list-style-type: none; display: inline-flex; padding: 0;
			border-bottom: solid 1px black; border-left: solid 1px black; width: 100%;">
				<li class="menubin" style="background-color: black; color: white;">1.Ticket</li>
				<li class="menubin">2.Date</li>
				<li class="menubin">3.Detail</li>
				<li class="menubin">4.Payment</li>			
			</ul>		
		</div>
		
		<form name="reposiBin">
		<div style="padding-top: 5%;">
			<table class="table table-hover" style="width: 100%;">
				<thead>
					<tr>
						<th>Select your tickets</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="linebin">성인</td>
						<td class="linebin pricebin">&#8361;<fmt:formatNumber value="${price}" pattern="#,###" /></td>
						<td><input class="pribin" hidden="hidden" value="${price}"/><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" id="test1" class="qtBin"/></td>						
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">청소년 20% 할인 / 만 13세 ~ 18세</td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price20}" pattern="#,###" /></td>						
						<td><input class="pribin" hidden="hidden" value="${price20}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">어린이 50% 할인 / 만 4세 ~ 12세</td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price50}" pattern="#,###" /></td>
						<td><input class="pribin" hidden="hidden" value="${price50}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">만 65세 이상 20% 할인</td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price20}" pattern="#,###" /></td>
						<td><input class="pribin" hidden="hidden" value="${price20}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">만 3세 이하 무료</td>
						<td class="linebin">&#8361;0</td>
						<td><input class="pribin" hidden="hidden" value="0"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">단체 30% 할인 / 10인 이상</td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price30}" pattern="#,###" /></td>
						<td><input class="pribin" hidden="hidden" value="${price30}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin groupBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		
		<hr style="border: 2px solid black">
		
		<div style="overflow: hidden;">
			<div style="float: left;">총 결제금액</div>
			<div class="totalBin" style="float: right;"></div>		
		</div>
		
		<div style="overflow: hidden;">						
			<div onclick="goCtrl()" style="color:white; background:black; cursor:pointer; float: right; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">다음</div>
		</div>
		
	</div>		
	
</body>
</html>
