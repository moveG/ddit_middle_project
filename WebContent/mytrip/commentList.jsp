<%@page import="kr.or.ddit.mytrip.vo.MyTripCommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
 	String memId = (String)request.getAttribute("memId");
 	List<MyTripCommentVO> list = (List<MyTripCommentVO>)request.getAttribute("list");
 %>	
 	[
 <% 	 
 	for(int i = 0; i < list.size(); i++){
 		MyTripCommentVO vo = list.get(i);
 		if(i>0)out.print(",");
 %>		
		{
			"memId" : "<%=memId %>",
			"mem_id" : "<%=vo.getMem_id() %>",
			"mytripc_no" : "<%=vo.getMytripc_no() %>",
			"mytripc_content" : "<%=vo.getMytripc_content() %>"		
		} 	
 	
<% 		
 	}
 
 %>   
 	]