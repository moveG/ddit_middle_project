<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int memChk = (Integer)request.getAttribute("memChk");
	System.out.print(memChk);
	
	if(memChk == 1 || memChk == 0 || memChk == -1){
%>
	{ "flag" : "성공", "memChk" : "<%=memChk %>"}	
		
<%		
	}else{
%>	
	
	{ "flag" : "실패"}
		
<%		
	}

%>    