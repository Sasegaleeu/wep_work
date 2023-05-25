<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// MemberDao 객체의 참조값 얻어오기
	MemberDao dao = MemberDao.getInstance();
	// 회원 목록 얻어오기
	List<MemberDto> list = dao.getList();
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
		background-color: #0A6EFF;
		color: #fff;
	}
	.text-end {
		 position: relative;
		 right: 250px;
		 bottom: 30px;
		 
	}
</style>
</head>
<body>
	<div class="container">
		<h1 class="center-heading">회원 목록</h1>
		<div class="text-end">
			<a href="insertform.jsp">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
				    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
				    <path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
				</svg>
			</a>
		</div>
		<table class="custom-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for(MemberDto tmp : list) { %>
					<tr class="table-active">
						<td class="table-active"><%= tmp.getNum() %></td>
						<td class="table-active"><%= tmp.getName() %></td>
						<td class="table-active"><%= tmp.getAddr() %></td>
						<td>
							<a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
						</td>
						<td>
						<a href="delete.jsp?num=<%=tmp.getNum() %>">
						
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
  								<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
							</svg>
							<span class="visually-hidden">삭제</span>
						</a>
						</td>
						
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
