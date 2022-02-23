<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	String selectId = (String)request.getAttribute("id");
	
	if(selectId == null){
%>
	{
		"flag" : "사용 가능한 ID입니다."
	}
<%		
	}else{
%>		
	{
		"flag" : "이미 사용중인 ID 입니다."
	}
<%		
	}

%>
