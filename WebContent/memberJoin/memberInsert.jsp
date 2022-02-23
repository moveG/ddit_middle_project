<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	String id = (String)request.getAttribute("id");

	if(id != null){
%>		
	
	
	{ "flag" : "성공"}
			
		
<% 	
	}else{
%>		
		
	{ "flag" : "실패"}
	
		
<%		
	}

%>    