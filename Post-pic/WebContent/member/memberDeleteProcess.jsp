<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var chk = '${param.chk}';
	
	if(chk=="t"){
		alert("탈퇴가 완료 되었습니다.");
		location.href="<%=request.getContextPath() %>/main.do";	
	}else{
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	}
	

</script>
