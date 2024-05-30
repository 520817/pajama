<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //1.session scope에 "id"라는 키값으로 저장된 값을 삭제한다.
	session.removeAttribute("id");
	session.removeAttribute("nn");
	session.removeAttribute("sn");
    //2. 응답(특정페이지로 요청을 다시 하라는 리다이렉트로 응답)
    String cPath = request.getContextPath();
    response.sendRedirect("Home.jsp");
%>