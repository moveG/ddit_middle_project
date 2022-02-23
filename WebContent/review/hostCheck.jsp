<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = (Integer) request.getAttribute("num");
	
	if(num > 0){
%>
		{"flag" : "호스트"}
<%
	}else{
%>
		{"flag" : "게스트"}
<%
	}
%>