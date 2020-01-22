<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	/* 기본 */
	body {
		font-family: 'Noto Sans Kr', sans-serif;
	}
	
	/* 기본 div */
	div.pwdFind_container {
		width: 658px;
		margin: 0 auto;
		text-align: center;
		border: 1px solid #dcdcdc;
		height: 470px;
		border-radius: 10px;
		margin-top: 185px;
		margin-bottom: 56px;
	}
	
	div.pwdFind_container h2 {
		margin-top: 65px;
	}
	
	div.pwdFind_wrap {
		width: 400px;
		margin: 0 auto;
	}
	
	/* 이메일 */
	div.input_email {
		border-bottom: 1px solid #DDD;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	input#find_email {
		border: none;
		width: 95%;
		padding: 8px;
		font-size: 14px;
	}
	
	/* 성함 */
	div.input_name {

		border-bottom: 1px solid #DDD;
		margin: 0 auto;
		margin-top: 20px;
	}
	
	input#find_name {
		border: none;
		width: 95%;
		padding: 8px;
		font-size: 14px;
	}
	
	/* 전화번호 */
	div.input_hp {
		border-bottom: 1px solid #DDD;
		margin: 0 auto;
		margin-top: 20px;
		margin-bottom: 40px;
	}
	
	input#find_hp {
		border: none;
		width: 95%;
		padding: 8px;
		font-size: 14px;
	}
	
	/* 확인버튼 */
	button.submit_btn {
		background: #000;
		width: 250px;
		padding: 10px 40px;
		color: #fff;
		font-size: 18px;
		border-radius: 5px;
		margin: 0 auto;
		border: 0;
		cursor: pointer;
		outline: none;
	}
	
	/* 비밀번호 찾기  메일 전송 팝업 레이어 */
	div.pw_layer {
		position: fixed;
		top: 0;
	    left: 0;
		width: 100%;
		height: 100%;
		z-index: 1000;
	}
	
	div.bg {
		width: 100%;
		height: 100%;
		background: #000;
		opacity: 0.5;
	}
	
	div#pw_layer {
		margin-top: -80px;
		margin-left: -200px;
		width: 400px;
		height: 160px;
		background: #fff;
		position: absolute;
		top: 50%;
		left: 50%;
		z-index: 100;
	}
	
	div.pop-conts {
		text-align: center;
	}
	
	div.pop-conts span {
		display: block;
		margin-top: 32px;
		font-size: 16px;
	}
	
	button#pw_layer_btn {
		background: #000;
		width: 120px;
		margin: 0 auto;
		margin-top: 27px;
		padding: 10px 40px;
		color: #fff;
		font-size: 18px;
		border-radius: 5px;
		border: 0;
		cursor: pointer;
		outline: none;
	}
	
</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".pw_layer").css("display","none"); 
	});
	
	function find_pw() {
		
		if($("#find_name").val().trim() == "") {
			alert("성함을 입력해 주세요.");
			$("#find_name").focus();
			return;
		}
		else if($("#find_email").val().trim() == "") {
			alert("이메일을 입력해 주세요.");
			$("#find_email").focus();
			return;
		}
		
		var name = $("#find_name").val();
		var email = $("#find_email").val();
		var hp = $("#find_hp").val();
		   
	    $.ajax({
		  url:"<%= request.getContextPath()%>/passwordFindEnd.at",
		  data:{"name":name,
			    "email":email,
			    "hp":hp},
		  type:"POST",
		  dataType:"JSON",
		  success:function(json){
			  
			  layer_open('pw_layer');
			  
			  if(json.n == 1) {
				  // 메일 전송과 임시 비밀번호로 업데이트 성공
				  $("#updateMsg").html("해당 메일로 임시 비밀번호가 전송되었습니다.");
			  }
			  if(json.n == -1) {
				  $("#updateMsg").html("해당 메일로 임시 비밀번호 전송이 실패했습니다. 관리자에게 문의해 주세요.");
			  }
			  else {
				  $("#updateMsg").html("입력하신 정보로 가입된 회원은 존재하지 않습니다.");
			  }
		  },
		  
		  error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		  }

	   }); // end of ajax

	}
	
	function layer_open(el) {
		$("."+el).css("display", "");
		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');
		if(bg){
			$('.'+el).fadeIn(); 
		} 
		$('.'+el+' .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			
				$('.'+el).fadeOut();
				e.preventDefault();
			
		});
	}
</script>
 
<body>
	<div class="pwdFind_container">
		<h2>비밀번호 찾기</h2>
		<span>회원가입 시 가입한 항목을 입력해 주세요.</span>
	
		<div class="pwdFind_wrap">
		<form name="pwdFindForm" id="pwdFindForm">
			<div class="input_email">
				<input type="text" id="find_email" name="find_email" placeholder="이메일"/>
			</div>
			<div class="input_name">
				<input type="text" id="find_name" name="find_name" placeholder="성함"/>
			</div>
			<div class="input_hp">
				<input type="text" id="find_hp" name="find_hp" placeholder="전화번호"/>
			</div>
		</form>
		</div>
		<div class="btn_div">
			<button type="button" class="submit_btn" onClick="find_pw();">확인</button>
		</div>
	</div>
	
	<%-- 비밀번호 찾기 메일 전송 팝업 레이어  --%>
	<div class="pw_layer">
		<div class="bg"></div>
		<div id="pw_layer" class="pop">
			<div class="pop-container">
				<div class="pop-conts">
					<span id="updateMsg"></span>
					<div class="pop_btn">
						<button type="button" class="chgPwd_btn" id="pw_layer_btn" onClick="$('.pw_layer').fadeOut();">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>