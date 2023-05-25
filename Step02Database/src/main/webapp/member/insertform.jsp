<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/insertform.jsp</title>
<!-- Bootstrap CSS 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
	.input {
			font-size: 24px;
			margin-top: 20px;
			margin-bottom: 20px;
			font-family: Arial, sans-serif; /* 글꼴 설정 */
		}

</style>
</head>
<body>
<div class="container">
    <h1 class ="input">회원정보 입력</h1>
    <form action="insert.jsp" method="post"> 
       <div class="mb-5">
       		<label class="form-label" for="name">이름</label>
       		<input class="form-control" type="text" id="name" name="name">
       </div>
       <div class="mb-5">
        	<label class="form-label" for="addr">주소</label>
        	<input class="form-control" type="text" id="addr" name="addr">
       </div>
       <div>
       <button class="btn btn-outline-primary" type="submit">추가</button>
       </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
