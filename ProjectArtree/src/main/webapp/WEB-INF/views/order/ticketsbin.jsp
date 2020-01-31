<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TICKETS</title>
</head>

<!-- 카카오 채팅 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.12.1.custom/jquery-ui.js"></script>							

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

	.linebin {
	 	line-height: 250% !important;
	 }
	 
	.ui-widget {
		font-family: 'Noto Sans Kr', sans-serif;
	}

	.ui-datepicker {
		width: 52em;
		line-height: 3;
	}	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#testDatepicker").datepicker({			
			dayNamesMin : ['월','화','수','목','금','토','일'],			
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			altField: '#calendar-date',
			dateFormat: 'yy-mm-dd'
		});					
				
		$("#nextBin").click(function(){
			
			var loginuser = "${sessionScope.loginuser}";
			
			if(loginuser == "") {
				location.href="javascript:layer_open('layer')";
			}
			
			else if($("input[name=totalBin]").val()!=""){
				goCtrl()	
			}			
			else {
				alert("수량을 입력해주세요.")
			}
		})
		
		var string1 = "${bin}"; 		
		var split =  string1.split(',');			
		var totalB = 0;		
		if (split != "") {
			$.each(split, function(index,item){			
				$(".qtBin:eq("+index+")").val(item);			
				var totalA = item*$(".pribin:eq("+index+")").val();
				totalB += totalA;
				if(totalA != 0) {
					$(".qtResult:eq("+index+")").html("&#8361;"+totalA.toLocaleString());
				}
				else { 
					$(".qtResult:eq("+index+")").html("");
				}
			});
		}
		
		if(totalB != 0) {
				$(".totalBin").html("&#8361;"+totalB.toLocaleString());
				$(".totalBin").val(totalB);
			}
			
		else {
				$(".totalBin").html("");
			}
		
		$(".qtBin").spinner();			
		
		$(".qtBin").bind("spinstop",function(event){
			
			// 음수, 100이상 처리
			var num = $(".qtBin").index(this);
			if($(".qtBin:eq("+num+")").val()>99) {
				$(".qtBin:eq("+num+")").val(99);
			}
			else if($(".qtBin:eq("+num+")").val()<0) {
				$(".qtBin:eq("+num+")").val(0);
			}
			
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
				$(".totalBin").val(totalP);
			}
			
			else {
				$(".totalBin").html("");
			}
		});
		
		
	});			
	
	function goCtrl() {
		var frm = document.reposiBin;	
		frm.method="POST";
		frm.action="<%=ctxPath %>/insertCart.at";		
		frm.submit();
	}
	
	//카카오 상담
	window.kakaoAsyncInit = function () {
	    Kakao.Channel.createChatButton({
	      container: '#kakao-talk-channel-chat-button'
	    });
	  };
	
	(function (d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//developers.kakao.com/sdk/js/kakao.plusfriend.min.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'kakao-js-sdk'));	  
	
</script>

<body>	
	
	
	
	
	<form name="reposiBin">
	<div style="padding-right:60px; width: 100%; margin: 0 auto;" align="center">
	<div style="padding: 3%;">	
		<div style="padding-top: 1%; font-size: 25px;">
			TICKETS	<div id="kakao-talk-channel-chat-button" data-channel-public-id="_DxkEZxb" data-title="question" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
		</div>	
		
		<hr>
		
		<div style="padding:1% 0 1% 0; text-align:left; font-size: 16px; font-weight: bold;">
			${startdate } - ${enddate }
		</div>
		
		<div style="width: 80%; height: 400px;"><img style="border-radius: 15px; width: 40%; height: 100%;" src="${mainposter}"></div>
		
		<div style="margin:2% 0; font-size: 22px; font-weight: bold; text-align: left;">
			${exhibitionname}<input hidden="hidden" name="exhibitionname" value="${exhibitionname}">
		</div>
		
		<hr>
		
		<div>
			<div id="testDatepicker"></div>
			<input id="calendar-date" name="dateBin" hidden="hidden" value="">
		</div>
		
		<hr>
		
		<div style="padding-top: 2%;">
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
						<td class="linebin">성인<input hidden="hidden" name="type" value="성인"></td>						
						<td class="linebin pricebin">&#8361;<fmt:formatNumber value="${price}" pattern="#,###" /></td>
						<td><input name="price" class="pribin" hidden="hidden" value="${price}"/><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" id="test1" class="qtBin"/></td>						
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">청소년 20% 할인 / 만 13세 ~ 18세<input hidden="hidden" name="type" value="청소년 20% 할인 / 만 13세 ~ 18세"></td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price20}" pattern="#,###" /></td>						
						<td><input name="price" class="pribin" hidden="hidden" value="${price20}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">어린이 50% 할인 / 만 4세 ~ 12세<input hidden="hidden" name="type" value="어린이 50% 할인 / 만 4세 ~ 12세"></td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price50}" pattern="#,###" /></td>
						<td><input name="price" class="pribin" hidden="hidden" value="${price50}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">만 65세 이상 20% 할인<input hidden="hidden" name="type" value="만 65세 이상 20% 할인"></td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price20}" pattern="#,###" /></td>
						<td><input name="price" class="pribin" hidden="hidden" value="${price20}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">만 4세 미만 무료<input hidden="hidden" name="type" value="만 4세 미만 무료"></td>
						<td class="linebin">&#8361;0</td>
						<td><input name="price" class="pribin" hidden="hidden" value="0"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
					<tr>
						<td class="linebin">단체 30% 할인 / 10인 이상<input hidden="hidden" name="type" value="단체 30% 할인 / 10인 이상"></td>
						<td class="linebin">&#8361;<fmt:formatNumber value="${price30}" pattern="#,###" /></td>
						<td><input name="price" class="pribin" hidden="hidden" value="${price30}"><input style="text-align: center;" max="99" min="0" value="0" size="1" name="qt" type="text" class="qtBin groupBin"/></td>
						<td class="qtResult linebin"></td>					
					</tr>
				</tbody>
			</table>
		</div>
				
		<hr>
		
		<div style="overflow: hidden;">
			<div style="float: left;">총 결제금액</div>
			<div class="totalBin" style="float: right;"></div>
			<input class="totalBin" hidden="hidden" value="" name="totalBin">		
		</div>
		
		<div style="overflow: hidden;">						
			<div id="nextBin" style="color:black; background:white; cursor:pointer; float: right; border: solid 1px black; border-radius: 4px; width: 5%; margin-top: 1%; padding: 0.3%;">다음</div>
		</div>
	</div>	
	</div>		
	</form>
</body>
</html>
