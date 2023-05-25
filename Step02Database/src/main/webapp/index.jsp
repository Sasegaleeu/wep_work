<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<!-- 커스텀 CSS -->
<style>
	body {
		background: #4B79A1;
		background: -webkit-linear-gradient(to left, #4B79A1 , #283E51);
		background: linear-gradient(to left, #4B79A1 , #283E51);        
		}
	h1 {
		text-align: center;
		font-size: 2.5em;
		color: #f2f2f2;
		font-family: Arial, sans-serif;
		}
	.center-align {
       	text-align: center;
    	}
		
	.center-heading {
		text-align: center;			
		font-size: 18px;
		margin-top: 20px;
		margin-bottom: 20px;
		font-family: Arial, sans-serif; /* 글꼴 설정 */
	}
    .container {
        margin-top: 50px;
        text-align: center;
    }
    h1 {
        margin-bottom: 30px;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        display: inline-block;
        margin-right: 10px;
    }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <a class="navbar-brand" href="index.jsp" style="margin-left: 15px;" >인덱스</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      		<span class="navbar-toggler-icon"></span>
	    	</button>
	    	<div class="collapse navbar-collapse" id="navbarNav">
	      		<ul class="navbar-nav">
	        		<li class="nav-item active">
	        		    <a class="nav-link" href="member/list.jsp">회원</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="guest/list.jsp">방명록</a>
	        		</li>
	      		</ul>
	    	</div>
	</nav>

<div class="container">
    <h1 class="center-heading">인덱스 페이지 입니다.</h1>
    <!-- <ul>
        <li><a href="member/list.jsp">회원</a></li>
        <li><a href="guest/list.jsp">방명록</a></li>
    </ul> -->
</div>
</body>
</html>
