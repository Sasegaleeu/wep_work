<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   //한글 깨지지 않도록
   request.setCharacterEncoding("utf-8");
   //1. 폼 전송되는 수정할 회원의 정보를 얻어온다.
   int num=Integer.parseInt(request.getParameter("num"));
   String password = request.getParameter("pwd");

   GuestDao dao = GuestDao.getInstance();
   GuestDto dto = dao.getData(num);

   if (dto != null && dto.getPwd().equals(password)) {
       // 비밀번호가 일치하면 삭제 수행
       dao.update(dto);
       response.sendRedirect(request.getContextPath() + "/guest/list.jsp");
   } else {
       // 비밀번호가 일치하지 않을 경우
       response.sendRedirect(request.getContextPath() + "/guest/list.jsp");
   }
%>
