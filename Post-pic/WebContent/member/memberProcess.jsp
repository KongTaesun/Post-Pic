<%@page import="kr.co.bit.postkit.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	alert('가입이 완료 하였습니다.');
	location.href = "<%= request.getContextPath()%>/main.do";
</script>
