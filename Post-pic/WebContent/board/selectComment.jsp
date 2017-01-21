<%@page import="java.util.List"%>
<%@page import="kr.co.bit.board.dao.BoardDAO"%>
<%@page import="kr.co.bit.board.vo.BoardVO"%>
<%@page import="kr.co.bit.board.vo.BoardCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	BoardDAO dao = new BoardDAO();		
 	List<BoardCommentVO> list = dao.selectByComment(board_no);
	pageContext.setAttribute("list",list);

%>
[
<c:forEach var="board" items="${ list }" varStatus="loop">
	<c:if test="${loop.count ne 1}">,</c:if>
	{
		no:'${ board.no }',
		board_no:'${ board.board_no }',
		writer:'${ board.writer }',
		content:'${ board.content }',
		regdate:'${ board.regdate }'
	}
</c:forEach>
]