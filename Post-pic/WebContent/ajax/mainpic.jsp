<%@page import="java.util.List"%>
<%@page import="kr.co.bit.board.dao.BoardDAO"%>
<%@page import="kr.co.bit.board.BoardVO"%>
<%@page import="kr.co.bit.board.vo.BoardCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String types = request.getParameter("types");
	String q = request.getParameter("q");
	if(q.equals(null)){
		q = "";
	}

	BoardDAO dao = new BoardDAO();


 	List<BoardVO> list = dao.selectTypeBoard(types,q);
	pageContext.setAttribute("list",list);

%>
[
<c:forEach var="board" items="${ list }" varStatus="loop">
	<c:if test="${loop.count ne 1}">,</c:if>
	{
		
		no:'${ board.no }',
		title:'${ board.title }',
		writer:'${ board.writer }',
		content:'${ board.content }',
		regdate:'${ board.reg_date }',
		imgs:'${ board.imgs }',
		types:'${ board.types }',
		tags:'${ board.tags }'
	}
</c:forEach>
]