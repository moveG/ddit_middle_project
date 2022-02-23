<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cartNo = (Integer) request.getAttribute("reserCheck");
	
	if(cartNo > 0){
%>
		{"flag" : "존재",
		"cartNo" : cartNo}
<%
	}else{
%>
		{"flag" : "없음"}
<%
	}
%>