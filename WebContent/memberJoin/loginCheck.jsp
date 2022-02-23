<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cnt = (Integer)request.getAttribute("cnt");
	String division = (String)request.getAttribute("division");	

	if(cnt > 0 || division !=null){
%>
	{ "flag" : "성공", "division" : "<%=division %>"}	
		
<%		
	}else{
%>	
	
	{ "flag" : "실패"}
		
<%		
	}

%>    
    