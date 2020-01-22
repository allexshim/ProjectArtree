<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

/* 기본  */
body {
	font-family: 'Noto Sans Kr', sans-serif;
}

textarea {
	font-family: 'Noto Sans Kr', sans-serif;
}

div#container_join {
	display: block;
	width: 658px;
	margin: 0 auto;
	margin-top: 70px;
}

button {
	outline: none;
}

/* 회원가입 입력  */
div#join_input {
	border: solid 1px #b7b7b7;
	border-radius: 5px;
	padding: 40px 0 30px 0;
	margin-bottom: 20px;
}

div#join_txt {
	font-size: 25pt;
}

form#joinForm {
	margin-top: 50px;
}

table#join_tbl {
	/* border: solid 1px black; */
	width: 500px;
}

table#join_tbl td{
	border-bottom: 1px solid #b7b7b7;
	padding-top: 20px;
}

table#join_tbl td input{
	width: calc(100% - 5px);
	padding-left: 5px;
	height: 36px;
    float: left;
    font-size: 14px;
    border-radius: 3px;
    border-style: none;
}

button#gender_1 {
	float: left;
	width: 50%;
	cursor: pointer;
	font-weight: bold;
	height: 40px;
	background-color: #fff;
	color: #757575;
	border: 1px solid #e7e7e7;
}

button#gender_2 {
	float: right;
	width: 50%;
	cursor: pointer;
	font-weight: bold;
	height: 40px;
	background-color: #fff;
	color: #757575;
	border: 1px solid #e7e7e7;
}

button.ageGroup {
	float: left;
	width: 16.6%;
	cursor: pointer;
	font-weight: bold;
	height: 40px;
	background-color: #fff;
	color: #757575;
	border: 1px solid #e7e7e7;
}

.on {
	color: #612581 !important; 
	border: 2px solid black !important;
}

select#area_select{
	width: 500px;
    float: left;
    text-align-last: center;
    font-size: 12px;
    height: 40px;
}

/* 약관동의  */
div#join_agree {
	float: left;
	display: block;
	width: 658px;
	text-align: left;
}

div#agree1, div#agree2 {
	margin-bottom: 20px;
}

div#join_agree h2 {
	display: block;
	float: left;
	font-weight: 400;
	font-size: 16px;
	margin: 30px 0 0 0;
}

div#join_agree textarea {
	color: #818181;
	width: 100%;
    height: 150px;
    padding: 15px;
    resize: none;
    margin: 10px 0px;
    padding: 15px;
    text-align: left;
}

label.check_icon {
	display: inline-block;
	width: 28px;
	height: 28px;
	cursor: pointer;
	background: url(http://www.art-map.co.kr/img/input.png) no-repeat;
	background-size: 57px;
}

span.check_txt {
	font-size: 18px;
	vertical-align: top;
}

div#allCheck {
	border: 1px solid #b7b7b7;
	padding: 30px;
	margin: 50px 0 30px 0;
}

span#allCheck_txt {
	font-size: 20px;
}

/* 회원가입 버튼 */
#join_submit {
	padding: 10px 40px;
    background: black;
    color: #fff;
    font-size: 18px;
    border-radius: 5px;
    margin: 0 auto;
    border: 0;
    cursor: pointer;
   	font-weight: 600;
   	margin-bottom: 50px;
}

/* 로그인 스타일 적용 */

	.layer {
		position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    z-index: 1000;
	}
	
	.layer .bg {
		width: 100%;
		height: 100%;
		background-color: black;
		opacity: 0.8;
	}
	
	.pop {
	    position: absolute;
	    top: 33%;
	    left: 38%; 
	    width: 400px;
	    height: auto;
	    z-index: 100;
	}
	
	.pop .pop-conts input {
	
	    width: 380px;
	    float: left;
	    height: 60px;
	    background-color: transparent;
	    text-align: center;
	    border: 1px solid #fff;
	    margin-bottom: 10px;
	    font-size: 16px;
	    color: white;
	}
	
	.pop .pop-conts input::placeholder {
		color: white;
	}
	
	a.find_btn {
		float: left;
	    margin-top: 5px;
	    font-size: 14px;
	    color: #fff;
	    text-decoration: none;
	}
	
	input#login_btn {
		float: left;
		width: 380px;
	    cursor: pointer;
	    background-color: #fce373;
	    color: black;
	    font-weight: bold;
	    height: 60px;
	    margin-top: 15px;
	    font-size: 16px;
	    border: none !important;
	}

</style>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		console.log('${loginuser}');
		
		/* 로그인 제이쿼리 */
		$(".layer").css("display", "none");
		
		$("#gender").val("1");
		$("#agegroup").val("10");
		
		// select 선택 시 값 input 에 저장
		$("#area_select").change(function() {
			$("#area").val($("#area_select option:selected").val());
		});
		
		/* 회원가입 제이쿼리 */
		/* 체크박스 선택하면  이미지 바뀜 */
		$("input:checkbox[class=agree_chx]").css("display", "none");
		
		$("input:checkbox[class=agree_chx]").click(function() {
			var bool = $(this).is(":checked");
			
			if(!bool) {
				$(this).next().css("background-position", "");
			}
			else {
				$(this).next().css("background-position", "-29px 0px");
			}
		}); 
		
		// 체크박스 전체 선택 / 전체 해제
		$("input:checkbox[id=all_chx]").click(function(){
			
			var bool = $(this).is(":checked");
			
			$("input:checkbox[class=agree_chx]").prop("checked", bool);
	
			if(!bool) {
				$(".check_icon").css("background-position", "");
			}
			
			else {
				$(".check_icon").css("background-position", "-29px 0px");
			}
			
		}); // end of checkbox[id=all_chx].click
		
		
		// 체크박스 전체선택에서 하나라도 선택 해제되면 전체선택 해제
		// 전체선택하지 않았더라도 두 개 다 선택되면 자동으로 전체선택
		$("input:checkbox[class=agree_chx]").click(function(){
			
			$("input:checkbox[class=agree_chx]").each(function(){
				var bool = $(this).prop("checked");
				
				if(!bool) {
					$("input:checkbox[id=all_chx]").prop("checked", false);
					$("input:checkbox[id=all_chx]").next().css("background-position", "");
					$(this).next().css("background-position", "");
					return false;
				}
				
				else {
					$("input:checkbox[id=all_chx]").prop("checked", true);
					$("input:checkbox[id=all_chx]").next().css("background-position", "-29px 0px");
					$(this).next().css("background-position", "-29px 0px");
				}
			}); // end of checkbox[class=agree_chx].each
		
		}); // end of checkbox[class=agree_chx].click
		
		// email 중복 확인
		$("#email").keyup(function() {
			var email = $("#email").val().trim();
			
			$.ajax({
				url:"<%= request.getContextPath()%>/duplicateCheck.at",  
				data: {"email" : email},
				dataType:"json",
				success: function(json) {  
					
					$("#error").css("display","");
					$("#error").children("span").html(json.msg);
					
					$("#duplicate").val(json.bool);
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});
		
	}); // end of function()
	
	// 뒤로가기 막기
	window.history.forward();

	function noBack() {
		window.history.forward();
	}
	
	// 성별 선택하면 border 변경
	function gender_chg(g) {
		$(".gender").removeClass("on");
		$("#gender_"+g).addClass("on");
		$("#gender").val(g);
	}
	
	// 연령대 선택하면 border 변경
	function age_chg(a) {
		$(".ageGroup").removeClass("on");
		$("#age_"+a).addClass("on");
		$("#agegroup").val(a);
	}
	
	// 회원가입	
	function goRegister() {
		
		var email = document.getElementById("email");
		var email_bool = myEmailCheck(email.value);
		
		var pwd = document.getElementById("password");
		var pwd_bool = myPasswdCheck(pwd.value);
		
		var pwdCheck = document.getElementById("passwordCheck");
		var pwdCheck_bool = myPasswdCheck2(pwd, pwdCheck);
		
		var hp = document.getElementById("hp");
		var hp_bool = myHpCheck(hp.value);
		
		var duplicate = document.getElementById("duplicate");
		
		if( $("#email").val().trim() == "" ) {
			  alert("이메일을 입력해 주세요.");
			  $("#email").focus();
			  return;
		  }
		 else if (!email_bool) {
			  alert("올바른 형식의 이메일을 입력하세요.");
			  $("#email").val("").focus();
			  return;
		  } 	
		 else if (duplicate) {
			  alert("이미 사용중인 이메일입니다.");
			  $("#email").val("").focus();
			  return;
		 } 
		  else if ( $("#name").val().trim() == "" ) {
			  alert("이름을 입력해 주세요.");
			  $("#name").focus();
			  return;
		  } 
		  else if ( $("#password").val().trim() == "" ||  $("#passwordCheck").val().trim() == ""  ) {
			  alert("비밀번호를 입력해 주세요.");
			  $("#password").val("");
			  $("#passwordCheck").val("");
			  $("#password").focus();
			  return;
		  }
		  else if ( !pwd_bool ) {
			  alert("비밀번호는 8글자 이상 16자 이하로 영문 대/소문자, 숫자, 특수문자를 포함하여야 합니다.");
			  $("#password").val("").focus();
			  return;
		  } 
		  else if ( !pwdCheck_bool ) {
			  alert("비밀번호와 비밀번호 확인 값이 동일하지 않습니다.");
			  $("#password").val("").focus();
			  $("#passwordCheck").val("")
			  return;
		  }
		  else if ( $("#hp").val().trim() == "" ) {
			  alert("휴대폰 번호를 입력해 주세요.");
			  $("#hp").focus();
			  return;
		  }
		  else if ( !hp_bool ) {
			  alert("올바른 형식의 휴대폰 번호를 입력하세요.");
			  $("#hp").val("").focus();
			  return;
		  }	
		  else if ( $("#area_select").val().trim() == "" ) {
			  alert("지역을 선택해 주세요.");
			  return;
		  }
		  else if( !$("input:checkbox[id=privacy_chx]").is(":checked") ) {
			  alert("개인정보 수집/이용 약관에 동의 하세요.");
			  return;
		  } 
		  else if( !$("input:checkbox[id=use_chx]").is(":checked") ) {
			  alert("이용약관에 동의 하세요.");
			  return;
		  } 
		
		  var frm = document.joinForm;
		  frm.method = "POST";
		  frm.action = "<%= request.getContextPath()%>/joinInsert.at";
		  frm.submit();
	}
	
	// 이메일 정규식
	function myEmailCheck(email) {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		var bool = regExp.test(email);  // 리턴타입은 boolean 
		return bool;
	}
	
	// 비밀번호 정규식
	function myPasswdCheck(pwd) {
		// 영문 대소문자/숫자/특수문자 조합, 8자~16자
		var regExp = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
		var bool = regExp.test(pwd);
		return bool;
	}
	
	//  비밀번호 확인
	function myPasswdCheck2(pwd, pwdCheck) {
		var pwd = document.getElementById("password");
		var pwdCheck = document.getElementById("passwordCheck");
		var bool = true;
		if( pwd.value != pwdCheck.value ){
			bool = false;
		}
		return bool;
	}; 
	
	// 휴대폰번호 확인
	function myHpCheck(hp) {
		if(hp.length==11 || hp.length==10) {
			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			var bool = regExp.test(hp);
			return bool;
		}
	}; 
	
	// ============================ 로그인 스크립트 ============================
	// 클릭하면 로그인 창 띄우기
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
	
	// 로그인 버튼 클릭하면 로그인
	function goLogin() {
		// 빈 칸 있는지 검사
		if( $("#email_login").val().trim() == "" ) {
			  alert("이메일을 입력해 주세요.");
			  $("#email_login").focus();
			  return;
		  }
		else if( $("#password_login").val().trim() == "" ) {
			 alert("비밀번호를 입력해 주세요.");
			 $("#password_login").focus();
			 return;
		}
		
		var frm = document.loginForm;
		  frm.method = "POST";
		  frm.action = "<%= request.getContextPath()%>/loginEnd.at";
		  frm.submit();
	}
	
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div id="container_join" align="center">
		<div id="join_input">
			<div id="join_txt">
				회원가입
			</div>
			<form name="joinForm" id="joinForm">
			<table id="join_tbl">
				<tr>
					<td>
						<input type="text" placeholder="이메일" name="email" id="email" />
					</td>
				</tr>
				<tr>
					<td class="error" id="error" style="border: none; padding-top: 5px; text-align: right; color: gray; display: none;">
						<span ></span>
						<input type="hidden" id="duplicate"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="성함" name="name" id="name" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" placeholder="비밀번호" name="password" id="password" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" placeholder="비밀번호 확인" id="passwordCheck" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="'-' 없이 휴대폰 번호만 입력해 주세요" name="hp" id="hp" />
					</td>
				</tr>
				<tr>
					<td style="border: 0px;">
						<button type="button" id="gender_1" class="gender on" onclick="javascript:gender_chg('1')">남</button>
						<button type="button" id="gender_2" class="gender" onclick="javascript:gender_chg('2')">여</button>
						<input type="hidden" id="gender" name="gender"/>
					</td>
				</tr>
				<tr>
					<td style="border: 0px;">
						<button type="button" class="ageGroup on" id="age_10" onclick="javascript:age_chg('10')">10대</button>
						<button type="button" class="ageGroup" id="age_20" onclick="javascript:age_chg('20')">20대</button>
						<button type="button" class="ageGroup" id="age_30" onclick="javascript:age_chg('30')">30대</button>
						<button type="button" class="ageGroup" id="age_40" onclick="javascript:age_chg('40')">40대</button>
						<button type="button" class="ageGroup" id="age_50" onclick="javascript:age_chg('50')">50대</button>
						<button type="button" class="ageGroup" id="age_60" onclick="javascript:age_chg('60')">60대이상</button>
						<input type="hidden" id="agegroup" name="agegroup"/>
					</td>
				</tr>
				<tr>
					<td style="border: 0px;">
						<select id="area_select">
							<option value="">지역선택</option>
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="세종">세종</option>
							<option value="강원">강원</option>
							<option value="경기">경기</option>
							<option value="경남">경남</option>
							<option value="경북">경북</option>
							<option value="전남">전남</option>
							<option value="전북">전북</option>
							<option value="제주">제주</option>
							<option value="충남">충남</option>
							<option value="충북">충북</option>
						</select>
						<input type="hidden" name="area" id="area"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
		
		<div id="join_agree">
			<div id="agree1">
				<h2>개인정보 수집 / 이용 동의 (필수)</h2>
				
				<textarea readonly>
개인정보취급방침안내
아트맵(이하 "회사"라 합니다.)은 이용자들의 개인정보를 중요시하며, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보 보호법 등 관련법상 개인정보 보호규정을 준수하고, "회원"의 개인정보를 보호하기 위해 지속적으로 노력합니다. "회사"는 이 개인정보 취급방침을 통하여 이용자들의 개인정보가 남용 되거나 유출되지 않도록 최선을 다할 것이며, 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있고, 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고자 합니다. 단, 이 개인정보 취급방침은 정부의 법령 및 지침의 변경, 또는 보다 나은 서비스의 제공을 위하여 그 내용이 변경 될 수 있으니, 이용자들께서는 사이트 방문 시 수시로 그 내용을 확인하여 주시기 바라며, "회사"는 개인정보 취급방침을 개정하는 경우 웹사이트 공지사항 또는 개별공지를 통하여 공지할 것입니다. 단, "회사"의 공식사이트 이외의 웹에서 링크된 사이트에서는 "회사"의 개인정보 취급방침 정책이 적용되지 않으며 "회사"는 "회원"의 귀책사유로 인해 노출된 정보에 대해서는 일체의 책임을 지지 않습니다. 
1. 수집하는 개인정보 항목 및 이용목적
"회사"는 회원가입, 미술전시회,작품 관람의 편의 및 각종 서비스의 제공을 위해 이용자의 개인정보를 수집하고 있습니다. 개인정보는 다음의 수집·이용목적 이외의 용도로는 활용되지 않으며, 수집·이용목적이 변경되는 경우에는 개인정보보호법에 따라 별도의 동의를 받는 등 필요한 조치를 이행합니다.a. 회원가입 과정에서 수집하는 정보 수집방법 : 회원가입 시 화면  수집항목 : 이메일, 비밀번호, 이용자 이름(닉네임), 프로필 사진(선택), 주소(선택), 이동전화번호(선택) 이용목적 : 회원제 서비스 제공, 마케팅 활동, 업데이트 및 고지사항 안내b. 주소 등록 시  수집방법 : 주소 등록 메뉴  수집항목 : 현재 거주 주소지  이용목적 : 미술작품 구매 추천 (큐레이션) 서비스 이용을 위해c. 결제카드 등록 시  수집방법: 결제카드 등록 메뉴  수집항목: 신용카드번호, 카드유효기간, 카드 비밀번호 앞 2자리, 카드소유주 생년월일, 카드소유주 성명  이용목적: 결제 간편등록 용d. 유료서비스 이용 과정에서 수집하는 정보  수집방법 : 결제 및 결제정보 등록화면  수집항목 : 이메일, 이동전화번호, 주소  이용목적 : 유료서비스 이용에 따른 고객관리 및 협력업체 정보제공e. 그외, 서비스 이용과정에서 자동적으로 생성되어 수집되는 개인정보 수집방법 : 자동생성  수집항목 : 접속 IP정보, 접속 로그, 쿠키, 서비스 이용기록, 기기고유번호, 방문 기록 등  이용목적 : 본인식별, 부정이용 방지, 서비스 향상을 위한 이용실적 분석f. 그 외, 마케팅 이벤트 및 행사에 참여하는 과정에서 이용자 선택에 의해 닉네임, 이름, 생년월일, 성별, 이메일 주소, 블로그 주소, 학교, 회사, 기타 경품 제공 및 배송을 위해 필요한 정보 등이 수집 될 수 있습니다. 이 경우, 수집항목 및 이용목적을 별도로 회원에게 고지하여 동의를 구합니다. 
2. 개인정보의 제 3자 제공
 회사는 이용자의 개인정보를 개인정보 수집·이용 목적에서 명시한 범위 내에서 사용하며, 이용자의 사전 동의 없이 개인정보 수집·이용 목적 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다. 다만 양질의 서비스 제공을 위해 이용자의 개인정보를 협력 업체와 공유할 필요가 있는 경우에는 최소한의 범위 내에서 아래와 같이 제3자에게 정보를 제공합니다. 그리고 제공 받는 자, 제공목적, 제공정보 항목, 이용 및 보유기간 등을 회원에게 고지하여 동의를 구합니다. 하지만 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우는 예외로 합니다.a. 이용자가 큐레이션 서비스를 이용하는 경우  제공받는자 : 회원이 서비스 가입 후 관람을 하게 될 각 갤러리 운영 주체 또는 갤러리 관장  제공목적 : 미술 전시회 초대,미술품 큐레이션 서비스 제공, 신원 확인 및 조대장 발송 제공항목 : 주소, 이동전화번호(미술품 큐레이션 서비스를 제공하는 작품구매 예약 건에 한함) 보유·이용기간 : 각 갤러리 운영 주체 내규에 따름b. 그 외 각종 마케팅 이벤트 및 행사에 참여하는 이용자의 개인정보가 해당 전시회의 주최자에게 제공될 수 있습니다. 이 경우, 별도로 회원에게 고지 여 동의를 구합니다. 
3. 개인정보의 보유 및 이용기간
"회사"는 기본적으로 이용자가 서비스를 제공하는 기간에 한하여 이용자의 개인정보를 보유 및 이용합니다. 회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업폐지 등의 사유발생시 당해 개인정보를 지체 없이 파기합니다. 단, 서비스의 부정한 이용으로 인한 분쟁을 방지하기 위한 내부방침 또는 관계 법령의 규정에 따라 필요한 경우에 일정 기간 보유합니다. 보관하는 개인정보 및 해당 법령은 아래와 같습니다.ID, 이메일, 비밀번호, 이용자 이름(닉네임), 프로필 사진, 주소, 이동전화번호 회원가입 남용 등 서비스 부정이용 방지를 위한 회사 내부정책  보존기간 : 회원 탈퇴 후 1년 로그기록, IP 등  근거법령 : 통신비밀보호법  보존기간 : 3개월 세법이 규정하는 모든 거래에 관한 장부 및 증빙서류 근거법령: 국세기본법  보존 기간: 5년 표시/광고에 관한 기록  근거법령 : 전자상거래 등에서의 소비자 보호에 관한 법률  보존기간 : 6개월 계약 또는 청약철회에 관한 기록  근거법령 : 전자상거래 등에서의 소비자 보호에 관한 법률  보존기간 : 5년 대금결제 및 재화 등의 공급에 관한 기록 근거법령 : 전자상거래 등에서의 소비자 보호에 관한 법률  보존기간 : 5년 소비자의 불만 또는 분쟁처리에 관한 기록  근거법령 : 전자상거래 등에서의 소비자 보호에 관한 법률  보존기간 : 3년 기타 이용자의 개별동의가 있는 경우, 개별 동의에 따른 기간만큼 보존 합니다. 
4. 개인정보 파기절차 및 방법
"회사"는 개인정보의 수집 및 이용목적이 달성되고, 보유 및 이용기간에 명시한 기간이 경과한 경우, 개인정보를 지체 없이 파기합니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다. 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다. 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다. 종이에 출력된 개인정보 및 접수된 서류는 분쇄하거나 소각을 통하여, 전자적 파일 형태로 저장된 개인정보는 복구할 수 없는 기술적 방법을 사용하여 삭제합니다. 
5. 개인정보 취급(처리)방침의 변경
"회사"는 개인정보 취급방침의 변경(내용 추가, 삭제 및 수정)이 있을 경우 7일전 웹사이트 또는 어플리케이션 내 공지사항을 통해 고지하고 있습니다. 또한 변경된 내용을 고객이 쉽게 확인할 수 있도록 변경 전∙후를 비교하여 공개하고 있습니다. 
6. 고지의 의무
 현 개인정보 취급방침의 내용 추가, 삭제 및 수정 등의 변경이 있을 시에는 시행일의 7일 전부터 홈페이지의 공지사항을 통하여 고지할 것입니다.최초 공고 일자 : 2016년 12월 15일  최종 변경 및 시행 일자 : 2016년 12월 21일
				</textarea>
				
				<input type="checkbox" class="agree_chx" name="agree_chx" id="privacy_chx"/>
				<label class="check_icon" for="privacy_chx" id="privacy_ico"></label>
				<span class="check_txt">위의 이용약관에 동의합니다.</span>
				
			</div>
			
			<div id="agree2">
				<h2>이용 약관 동의 (필수)</h2>
				<textarea readonly>
이용약관안내
제1장 총칙제1조
[목적]이 약관은 아트맵 모바일 어플리케이션 아트맵 ART.Map(이하 “당사”)이 제공하는 미술전시회,미술행사,미술체험,아트 페스티벌 등 기타 미술 관련 정보 등을 제공하는 문화적 목적의 전시회조직업/정보제공업 서비스(이하 “서비스”라고 합니다)에 대한 당사와 회원간의 권리와 의무, 책임사항 및 회원의 서비스 이용절차에 관한 사항을 규정함을 목적으로 합니다.본 약관은 회사와 회원 및 이용자 간 웹 서비스 외 모바일 서비스 에 관하여도 적용 할 수 있습니다. 
제2조 [용어의 정의]
가. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 그 외 용어에 대해서는 관련 법령에서 정하는 대로 따르는 것을 원칙으로 합니다.1) ART.Map : "회사"가 컴퓨터, 스마트폰, 정보 통신 설비를 이용하여 “서비스”를 제공할 수 있도록 설정한 가상의 영업장을 말합니다. 1)-1.회원: 이 약관을 승인하고 "회사"에 개인정보를 제공하여 회원 등록을 한 자로서, 본 약관에 따라 회사와 `서비스 이용계약`을 체결하고 아이디를 받은 자를 말합니다. 2)회원 : "회사"에 개인정보를 제공하여 회원 등록을 한 자로서, 본 약관에 따라 회사와 `서비스 이용계약`을 체결하고 아이디를 받은 자를 말합니다. 3)이용자:“회사”에 개인정보를 제공하고 본 약관에 따라 서비스를 일회성으로 이용하되, 별도의 회원 가입을 하지 않은 자를 말합니다. 4)아이디(ID): 회원의 식별과 서비스 이용을 위하여 회원이 설정하고 당사가 승인한 문자와 숫자의 조합을 말합니다.5) 비밀번호(PASSWORD): 회원의 동일성 확인과 회원정보의 보호를 위하여 회원이 설정하 고 당사가 승인한 문자와 숫자의 조합을 말합니다.6) 위탁자(갤러리회원,전시주관자): 작품을 홍보 또는 판매, 전시회 광고 의뢰를 할 의사가 있는, 당사가 온라인으로 제공하는 양식에 맞추어 해당 전시회 관련 정보 등을 등록 한 회원을 말합니다.7) 유료 서비스 : "회사"가 제공하는 `서비스` 중에서 "회원"이 금전적인 대가를 지불하고 이용할 수 있는 재화 또는 용역을 말합니다. 8) 직접결제 : “회사”의 “유료서비스”를 이용하기 위해 “회원” 및 “이용자”가 “ART.Map”내에서 금전적인 대가를 지불하는 행위를 말합니다.9) 구매문의: 판매자(갤러리)가 표시한 즉시구매가격에 동의함으로써 즉시 연락이 이루어지는 회원간-작품 등록자간 상호 연락을 말합니다.10) 피연결회사: 당사의 서비스 화면과 링크 등으로 연결된 사이트를 운영하는 회사를 말합 니다.11) 월정액 서비스: 온라인 큐레이션 서비스 중 조건에 맞는 작품전시회에 관한 초대, 콘텐츠알림, 우편물 브로슈어를 받는 서비스를 말합니다.12) 개인정보 : 정보통신망 이용촉진 및 정보보호에 관한 법률 (이하 `정보통신망법`) 제2조 제1항 제6호의 `개인정보`를 말합니다. 
제3조 [약관의 명시, 효력 및 변경]
가. 당사는 이 약관에 대한 서비스를 이용하고자 하는 자와 회원이 알 수 있도록 서비스가 제공되는 아트맵 화면에 게시합니다.나. 당사가 이 약관을 개정하는 경우에는 개정된 약관의 적용일자 및 개정 사유를 명시하며 그 적용일자 7일 이전부터 적용일자 전일까지 위 항의 방법으로 공지합니다. 이 경우에 당사는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원 이 알기 쉽도록 표시합니다.다. 이 약관은 당사와 회원간에 성립되는 서비스 이용계약의 기본약정입니다. 당사는 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 “개별약관”이라고 합니다)을 정하여 미리 공지 할 수 있습니다. 회원이 이러한 개별약관에 동의하고 특정 서비스를 이용하는 경우에는 개 별 약관이 우선적으로 적용되고, 이 약관은 보충적인 효력을 갖습니다.1. "회원" 및 “이용자"는 “사이트”와 애플리케이션을 비롯한 서비스에서 법적으로 보호되는 부분에 대한 저작권, 2차적 저작권, 특허권 등 모든 지식재산권을 포함한 모든 권리를 “회사”가 소유하고 있음을 인정합니다. 2. 본 약관에서 명시적으로 정하는 경우를 제외하고 "회원" 및 “이용자"는 "사이트" 및 애플리케이션을 비롯한 서비스에서 회사"의 권리임이 법적으로 보호되는 부분에 대해 어떤 권리도 취득하지 않을 것에 동의합니다. 3. "회원" 및 “이용자"는 "사이트" 및 애플리케이션상의 컨텐츠를 “회사”에서 명시적으로 허용한 방식에 따라 개인적인 용도로만 열람, 다운로드, 출판, 수정 혹은 다른 방식으로 배포할 수 있습니다. 이 조항상의 제한적 사용허락이나 다른 조항에서의 사용 허을 "사이트" 및 애플리케이션상의 컨텐츠에 대해 다른 어떤 권리 내지 특별한 권한을 부여하는 것으로 해석할 수 없습니다. 4. "회원" 및 “이용자"는 "사이트" 및 애플리케이션상의 컨텐츠 혹은 이들의 소프트웨어나 문서를 변경, 적용, 번역, 2차저작물 작성, 디컴파일, 리버스 엔지니어링, 디스어셈블 혹은 다른 방식으로 소스 코드를 추출하지 않을 것에 동의합니다. 또한 "사이트" 및 애플리케이션상의 컨텐츠 혹은 이들에 존재하는 독점적인 정보에 접근하여 이들의 대체물이나 유사 서비스 혹은 제품을 제작하지 않을 것에 동의합니다. 5. "회원" 및 “이용자"가 "사이트" 및 애플리케이션상의 컨텐츠를 이용하고자 하는 경우에는 사전에 그 컨텐츠의 소유자에게 허락을 얻어야 합니다.6. "회원" 및 “이용자"는 "회사"의 서비스, 소프트웨어 혹은 문서에 부착되거나 포함되어 있는 저작권 공지 표시나 다른 독점적 권리에 대한 공지를 제거, 훼손 혹은 변경하지 않을 것에 동의합니다. 
제4조(기록 보존)
1. "회사"는 전자상거래 등에서의 소비자보호에 관한 법률에 따라 다음 각 호에 대한 기록은 법령에서 정한 기간 동안 보존합니다. 1.1 이용계약 또는 청약철회 등에 관한 기록 1.2 대금결제에 관한 기록(성명, 주소, 주민등록번호 등 거래의 주체를 식별할 수 있는 정보에 한함) 
제5조(분쟁 해결)
1. "회사"는 "회원"이 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위해서 고객센터 또는 그에 준하는 조직을 설치, 운영합니다. 2. "회사"는 "회원"이 제기하는 불만사항 및 의견을 우선적으로 처리합니다. 다만 신속한 처리가 곤란한 경우에는 "회원"에게 그 사유와 처리일정을 즉시 통보합니다. 
본 약관 적용일자: 2016년 12월15일
				</textarea>
				<input type="checkbox" class="agree_chx" name="agree_chx" id="use_chx"/>
				<label class="check_icon" for="use_chx" id="use_ico"></label>
				<span class="check_txt">위의 이용약관에 동의합니다.</span>
			</div>
			
			<div id="allCheck">
				<input type="checkbox" class="agree_chx" id="all_chx" name="agree_chx"/>
				<label class="check_icon" for="all_chx" id="all_ico"></label>
				<span class="check_txt" id="allCheck_txt">모두동의</span>
			</div>
		</div>
		
		<button type="button" id="join_submit" onClick="goRegister()">회원가입</button>
		
		<%-- 로그인 버튼 --%>
		<br/>
		<a href="javascript:layer_open('layer')" id="login_main_btn" class="login_btn">로그인</a>
		<input type="button" id="logout_btn" value="로그아웃" onClick="javascript:location.href='/artree/logout.at'"/>
		</div>
	
	
	
   
   	<%-- 로그인 레이어 --%>
   	<div class="layer">
   	<div class="bg"></div>
	<div id="layer" class="pop">
		<div class="pop-container">
		<div class="pop-conts">
		<div class="login_wrap">
			<form name="loginForm" id="loginForm">
			<div class="login_box">
				<input type="text" placeholder="이메일로 로그인" name="email_login" id="email_login" class="login_input"/>
				<input type="password" placeholder="비밀번호" name="password_login" id="password_login" class="login_input"/>
				
				<div class="login_find">
					<a href="/artree/idFind.at" class="find_btn">아이디 찾기&nbsp;&nbsp;|&nbsp;&nbsp;</a>
					<a href="/artree/passwordFind" class="find_btn">비밀번호 찾기</a>
				</div>
				<input type="button" id="login_btn" value="로그인" onClick="goLogin()"/>
			</div>
			</form>
		</div>
		</div>
		</div>
	</div>
</div> 


	
</body>