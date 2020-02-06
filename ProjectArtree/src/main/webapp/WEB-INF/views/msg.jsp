<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
    if(${msg != null}) {
		alert("${msg}");
    }
    
    if(${loc != null}) {
    	location.href="${loc}";
    }

    if(${confirm != null}){
    	var bool = confirm("${confirm}"); 
    	if(bool){
    		location.href="/artree/mypage_set.at"
    	}
    }
</script> 
