<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num1 = (Integer) request.getAttribute("num1");
	int num2 = (Integer) request.getAttribute("num2");
	int review_no = (Integer) request.getAttribute("review_no");
	
	if(num1 > 0 && num2 > 0){
%>
		{"flag"      : "삭제 완료",
		 "review_no" : "<%= review_no %>"}
<%
	}else{
%>
		{"flag"     : "삭제 완료",
		"review_no" : "<%= review_no %>"}
<%
	}
%>