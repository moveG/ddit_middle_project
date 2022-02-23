<%@page import="kr.or.ddit.review.vo.ReviewAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿에서 수행한 결과를 가져온다.
	ReviewAVO vo = (ReviewAVO) request.getAttribute("ravo");
%>
		{
			"review_no"       : "<%= vo.getReview_no() %>",
			"reviewa_content" : "<%= vo.getReviewa_content().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
			"reviewa_date"    : "<%= vo.getReviewa_date() %>"
		}
