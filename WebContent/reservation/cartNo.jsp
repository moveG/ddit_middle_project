<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cartNo = (Integer) request.getAttribute("reserCheck");
	
	if(cartNo > 0){
%>
		{"flag" : "์กด์ฌ",
		"cartNo" : cartNo}
<%
	}else{
%>
		{"flag" : "์์"}
<%
	}
%>