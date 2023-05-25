<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao=MemberDao.getInstance();
	//회원 목록얻어오기
	List<MemberDto> list=dao.getList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>

	.center-heading {
		text-align: center;
		font-size: 24px;
		margin-top: 20px;
		margin-bottom: 20px;
		font-family: Arial, sans-serif; /* 글꼴 설정 */
		
	}
	.custom-table {
		border: 1px solid #dee2e6;
		border-collapse: collapse;
		width: 100%;
		max-width: 800px;
		margin: 0 auto;
		border-radius: 10px; /* 셀 둥글기 설정 */
		
	}
	.custom-table th,
	.custom-table td {
		padding: 10px;
		border: 1px solid #dee2e6;
		border-radius: 10px; /* 셀 둥글기 설정 */
		text-align: center;
		
		
	}
	.custom-table thead {
		background-color: #212529;
		color: #fff;
	}
</style>
</head>
<body>
	<div class="container">
	
		<h1 class="center-heading">회원 목록</h1>
		
		<table class="custom-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDto tmp:list){ %>
				<tr class="table-active">
					<td class="table-active"><%=tmp.getNum() %></td>
					<td class="table-active"><%=tmp.getName() %></td>
					<td class="table-active"><%=tmp.getAddr() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>