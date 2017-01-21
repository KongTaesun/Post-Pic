<%@page import="java.util.List"%>
<%@page import="kr.co.bit.board.dao.BoardDAO"%>
<%@page import="kr.co.bit.board.vo.BoardVO"%>
<%@page import="kr.co.bit.board.vo.BoardCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	String writer = request.getParameter("writer");
	
	/*
		1. t_board_like에 해당 아이디로 좋아요를 누른 적이 있는지 확인
		2. 누른 적이 없다면 t_board 에 like_cnt 수를 증가, t_board_like에 데이터 저장
		3. 누른 적이 있다면 그냥 취소!
	*/
	
	BoardDAO dao = new BoardDAO();
	int chkcnt = dao.selectlike(board_no, writer);
	
	if(chkcnt>0){	// 이미 좋아요를 눌렀을 경우
		out.print("N");
		//out.print(chkcnt);
	}else{
		dao.likecnt(board_no);
		dao.updatelike(board_no, writer);
		out.print("Y");
		//out.print(chkcnt);
	}
%>