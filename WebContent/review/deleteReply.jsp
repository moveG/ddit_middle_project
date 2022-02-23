<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = (Integer) request.getAttribute("num");
	int review_no = (Integer) request.getAttribute("review_no");
	
	if(num > 0){
%>
		{"flag"      : "삭제 완료",
		 "review_no" : "<%= review_no %>"}
<%
	}else{
%>
		{"flag" : "삭제 실패"}
<%
	}
%>