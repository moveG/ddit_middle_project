<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	MemberVO vo = (MemberVO)request.getAttribute("result");
	
	if(vo.getMem_id() != null){
%>

	{ "mem_id" : "<%=vo.getMem_id() %>",
	  "mem_tel" : "<%=vo.getMem_tel() %>",
	  "flag" : "성공" }
	  
<%		
	}else{
%>		

	{ "flag" : "실패"}	
		
<%		
	}
%> 


