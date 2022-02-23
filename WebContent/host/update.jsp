<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    	int cnt = Integer.parseInt(request.getParameter("cnt"));
    
    
    
    %>
    
    
    
    <%
       if(cnt==1){
    %>
     
     	{ "flag" : "성공" }
     
    <%
       }else if(cnt==0){
    %>
    
    	{ "flag" : "실패" }
    
       
    <%
       }
    %>
  