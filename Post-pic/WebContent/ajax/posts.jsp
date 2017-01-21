<%@page import="java.util.List"%>
<%@page import="kr.co.bit.board.dao.BoardDAO"%>
<%@page import="kr.co.bit.board.BoardVO"%>
<%@page import="kr.co.bit.board.vo.BoardCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();

	dao.viewcnt(no);

 	List<BoardVO> list = dao.selectPost(no);
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
		view_cnt:'${ board.view_cnt }',
		like_cnt:'${ board.like_cnt }',
		tags:'${ board.tags }'
	}
</c:forEach>
]