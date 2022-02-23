<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = (Integer) request.getAttribute("num");
	int num2 = (Integer) request.getAttribute("num2");
	
	if(num > 0 && num2 > 0){
%>
		{"flag" : "성공"}
<%
	}else{
%>
		{"flag" : "실패"}
<%
	}
%>