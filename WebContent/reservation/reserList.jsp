<%@page import="kr.or.ddit.reser.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationVO> list = (List<ReservationVO>) request.getAttribute("rList");

%>

[
	<%
		for(int i = 0; i < list.size(); i++){
			ReservationVO vo = list.get(i);
			if(i > 0) out.print(",");
	%>
			{
				"title" : "예약완료",
				"start" : "<%= vo.getReser_ckin() %>",
				"end"   : "<%= vo.getReser_ckout() %>",
				"allDay" : "true"
			}
	<% 		
		}
	%>

]