<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	int cnt = (Integer)request.getAttribute("cnt") == null ? 999999999
			: (Integer)request.getAttribute("cnt");
	System.out.print(cnt);
	
	String msg = request.getAttribute("msg") == null ? "" 
			 : (String)request.getAttribute("msg");		
			
	System.out.print(msg);
%>
			
				<%
					if(cnt==0){
				%>		
					{ "flag" : "<%=msg%>를 장바구니에 담았습니다."}	
				
	
				<% 
				}else{
				%>
					{ "flag" : "<%=msg%>"}
				
				<%
				}
				%>
				
				<%
	//석기현 작성
				%>


