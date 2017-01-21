<%@page import="kr.co.bit.postkit.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	int chknum = dao.mypageDAO(id);
	
	out.print(chknum);
%>


