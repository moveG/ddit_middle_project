<%@page import="kr.or.ddit.stay.vo.StayVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="../js/jquery-3.6.0.min.js"></script>

    	
    <%
    
    	//서블리에서 저장된 값 가져오기
    	StayVO vo = (StayVO)request.getAttribute("stay");
    	int cnt = (Integer)request.getAttribute("codetail");
    %>
      
    
    <%
    if(cnt>0){
    
      out.print("<script>alert(' 숙소이름  : " + vo.getStay_name()+ " 업데이트 성공!');</script>"); 
    
     response.sendRedirect("/FireMoth/ListStay.do");
    
    %>
    
     
    
    
    
   
	<%}else{%>    
	
	
    	<h2>등록실패</h2>
    
	
	
	<% }%>
    