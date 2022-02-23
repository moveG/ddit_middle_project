<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = (Integer) request.getAttribute("num");
	
	if(num > 0){
%>
		{"flag" : "수정 완료"}
<%
	}else{
%>
		{"flag" : "수정 실패"}
<%
	}
%>