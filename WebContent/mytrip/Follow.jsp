<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String stay_id = (String)request.getAttribute("stay_id");
		long atch_file_id = (long)request.getAttribute("atch_file_id");

%>    
		{"stay_id" : "<%=stay_id%>", "atch_file_id" : "<%=atch_file_id%>"}    
    