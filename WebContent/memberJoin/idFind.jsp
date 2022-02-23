<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String result = (String)request.getAttribute("result");
	
	if(result != null){
%>

	{"result" : "<%=result%>",
	  "flag" : "성공" }
	  
<%		
	}else{
%>		

	{ "flag" : "실패"}	
		
<%		
	}
%> 







   