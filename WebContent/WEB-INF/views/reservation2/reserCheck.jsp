<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reserCheck = (Integer) request.getAttribute("reserCheck");
	
	if(reserCheck > 0){
%>
		{"flag" : "중복"}
<%
	}else{
%>
		{"flag" : "가능"}
<%
	}
%>