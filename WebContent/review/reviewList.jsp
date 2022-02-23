<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서블릿에서 수행한 결과를 가져온다.
	List<ReviewVO> list = (List<ReviewVO>) request.getAttribute("list");
%>
	[
<%
		for(int i = 0; i < list.size(); i++){
			ReviewVO vo = list.get(i);
			if(i > 0) out.print(",");
%>
			{
				"review_no"      : "<%= vo.getReview_no() %>",
				"reser_no"       : "<%= vo.getReser_no() %>",
				"review_content" : "<%= vo.getReview_content().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
				"review_date"    : "<%= vo.getReview_date() %>",
				"review_mod"     : "<%= vo.getReview_mod() %>",
				"mem_id"         : "<%= vo.getMem_id() %>"
			}
<% 		
		}
%>
	]
