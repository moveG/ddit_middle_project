<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeVO vo = (NoticeVO)request.getAttribute("vo");

%>
	{
		"notice_no" : "<%=vo.getNotice_no() %>",
		"admin_id" : "<%=vo.getAdmin_id() %>",
		"notice_title" : "<%=vo.getNotice_title() %>",
		"notice_content" : "<%=vo.getNotice_content().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
		"notice_date" : "<%=vo.getNotice_date() %>",
		"notice_mod" : "<%=vo.getNotice_mod() %>"
	}



