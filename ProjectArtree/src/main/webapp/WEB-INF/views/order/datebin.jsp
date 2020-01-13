<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DateBin</title>
</head>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	
	.ui-widget {
		font-family: 'Noto Sans Kr', sans-serif;
	}

	.ui-datepicker {
		width: 32em;
		line-height: 3;
	}	
	
</style>
<script>
	$(document).ready(function(){					
		$("#testDatepicker").datepicker({			
			dayNamesMin : ['월','화','수','목','금','토','일'],			
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});		
	});
	

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
	<div style="width: 60%; margin: 0 auto;" align="center">
		<div style="padding-top: 2.5%;">
			<ul style="border-radius:4px; border-top: solid 1px black; list-style-type: none; display: inline-flex; padding: 0;
			border-bottom: solid 1px black; border-left: solid 1px black; width: 100%;">
				<li class="menubin" style="background-color: black; color: white;">1.Ticket</li>
				<li class="menubin" style="background-color: black; color: white;">2.Date</li>
				<li class="menubin">3.Detail</li>
				<li class="menubin">4.Payment</li>			
			</ul>		
		</div>
		<div style="padding-top: 2.5%;">
			<div id="testDatepicker"></div>									
		</div>		
		
		<div style="overflow: hidden; padding-top: 1%">	
			<div onclick="location.href='<%= ctxPath %>/ticketsbin.at'" style="color:white; background:black; cursor:pointer; float: left; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">이전</div>
			<div onclick="location.href='<%= ctxPath %>/detailsbin.at'" style="color:white; background:black; cursor:pointer; float: right; border: solid 2.5px black; border-radius: 4px; width: 10%; margin-top: 3%;">다음</div>
		</div>
		
		<div style="padding-top: 5%;">
			<div id="kakao-talk-channel-chat-button" data-channel-public-id="_DxkEZxb" data-title="question" data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
			<div><span>여기에 환불 만들겁니다.</span></div>	
		</div>
		
	</div>
</body>
</html>
