<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
        이 페이지에 요청이 될 때 <a href="delete.jsp?num=x"></a> 형식의 링크를 눌러서 
        GET 방식 요청이 되는 것입니다.
        따라서 GET 방식 요청 파라미터로 삭제할 회원의 번호가 전달됩니다.
        해당 파라미터를 추출해서 DB에서 삭제하면 됩니다.
    */

    //1. 삭제할 회원의 번호와 비밀번호를 얻어냅니다.
    int num = Integer.parseInt(request.getParameter("num"));
    String password = request.getParameter("pwd");

    //2. DB에서 데이터를 삭제하고, 비밀번호 일치 여부를 확인합니다.
    GuestDao dao = GuestDao.getInstance();
    GuestDto dto = dao.getData(num);

    if (dto != null && dto.getPwd().equals(password)) {
        // 비밀번호가 일치하면 삭제 수행
        dao.delete(num);
        response.sendRedirect(request.getContextPath() + "/guest/list.jsp");
    } else {
        // 비밀번호가 일치하지 않을 경우
        response.sendRedirect(request.getContextPath() + "/guest/list.jsp");
    }
%>
