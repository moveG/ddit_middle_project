<%@page import="kr.or.ddit.stay.vo.StayCalVO"%>
<%@page import="kr.or.ddit.reser.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<StayCalVO> calVO = (List<StayCalVO>)request.getAttribute("calList");
	
%>

[
	<%
		for(int i = 0; i < calVO.size(); i++){
			StayCalVO vo = calVO.get(i);
			if(i > 0) out.print(",");
	%>
			{
				"title" : "<%=vo.getStay_name() %>",
				"start" : "<%= vo.getReser_ckin() %>",
				"end"   : "<%= vo.getReser_ckout() %>",
				"allDay" : "true"
			}
	<% 		
		}
	%>

]