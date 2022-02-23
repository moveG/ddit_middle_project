<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	int cnt = (Integer)request.getAttribute("result");
	int reno = (Integer)request.getAttribute("reno");	

	if(cnt > 0){
%>		
		
	{"flag" : "성공", "reno" : "<%=reno %>"}	
		
<%		
	}else{
%>		
		
	{"flag" : "실패"}	
<%	
	}
%>    