<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    	List<EventVO> list = (List<EventVO>)request.getAttribute("eventList");
    
    	
    	
    
    
    
    %>

    
    
    [
    
    	<% 
    		for(int i =0;i<list.size(); i++){
    	
    			
    			EventVO vo = list.get(i);
    			
  
    			if(i>0) out.print(",");
    	%>		
    			
    
    		{
    			
    			"event_no" = "<%=vo.getEvent_no()%>",
    			"admin_id" = "<%=vo.getAdmin_id()%>",
    			"event_title" = "<%=vo.getEvent_title()%>",
    			"event_date" = "<%=vo.getEvent_date()%>",
    			"event_content" = "<%=vo.getEvent_content()%>",
    			"event_mod" = "<%=vo.getEvent_mod()%>"
    			
    		
    		
    		
    		}
    	
    
    		
      	<%	
      	
      	
    		}
    	
    	%>
    
    
    
    
    
    ]
    