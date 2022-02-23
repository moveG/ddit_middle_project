<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = (String) request.getAttribute("num");

	if(num != "0"){
%>
		{"flag" : "성공",
		 "num"  : "<%= num %>"
		}
<%
	}else{
%>
		{"flag" : "실패"}
<%
	}
%>