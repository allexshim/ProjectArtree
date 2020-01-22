<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
	.col-sm-3 {
		margin-top: 30px;
	}
</style>

<div class="row">
	<div class="col-sm-3">
		<a href="<%=ctxPath%>/mainartree.at">
			<img style="height: 70px;" alt="아트리로고" src="<%=ctxPath %>/resources/images/main/logo_black1.jpg">
		</a>
	</div>
	<div class="footer col-sm-6">
		ARTREE | 사업자등록번호 : 111-22-33333<br/>
		서울특별시 중구 남대문로 120 대일빌딩 2F<br/>
		Copyright ⓒ 1998-2019 ARTREE All Right Reserved<br/><br/>
	  	(사)KH정보교육원  |  사업자등록번호 : 118-82-02004 <br/>
		종로지원 : 서울특별시 중구 남대문로 120 대일빌딩 2F<br/>
		Copyright ⓒ 1998-2016 KH Information Educational Institute All Right Reserved
	</div>
	<div class="col-sm-3">
		<a href="https://www.iei.or.kr/main/main.kh">
			<img alt="kh로고" src="<%=ctxPath %>/resources/images/main/kh_logo.jpg">
		</a>
	</div>
	
</div>