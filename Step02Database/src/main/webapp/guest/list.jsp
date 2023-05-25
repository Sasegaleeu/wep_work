<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<%
    //GuestDao 객체의 참조값 얻어오기.
    GuestDao dao = GuestDao.getInstance();
    //회원 목록 얻어오기
    List<GuestDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>/guest/list.jsp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
    @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';
    * {font-family: 'Open Sans', sans-serif;}
	
	@media (max-width: 600px) {
  	thead tr {
    white-space: nowrap;
  	}
	}
    .rwd-table {
 		 margin: auto;
		  min-width: 300px;
		  max-width: 100%;
		  border-collapse: collapse;
		}
		.rwd-table tr:first-child {
  			border-top: none;
  			background: #428bca;
  			color: #fff;
		}
		.rwd-table tr {
		  border-top: 1px solid #ddd;
		  border-bottom: 1px solid #ddd;
		  background-color: #f5f9fc;
		}
		
		.rwd-table tr:nth-child(odd):not(:first-child) {
		  background-color: #ebf3f9;
		}
		
		.rwd-table th {
		  display: none;
		}
		
		.rwd-table td {
		  display: block;
		}
		
		.rwd-table td:first-child {
		  margin-top: .5em;
		}
		
		.rwd-table td:last-child {
		  margin-bottom: .5em;
		}
		
		.rwd-table td:before {
		  content: attr(data-th) ": ";
		  font-weight: bold;
		  width: 120px;
		  display: inline-block;
		  color: #000;
		}
		
		.rwd-table th,
		.rwd-table td {
		  text-align: left;
		}
		
		.rwd-table {
		  color: #333;
		  border-radius: .4em;
		  overflow: hidden;
		}
		
		.rwd-table tr {
		  border-color: #bfbfbf;
		}
		
		.rwd-table th,
		.rwd-table td {
		  padding: .5em 1em;
		}
		@media screen and (max-width: 601px) {
		  .rwd-table tr:nth-child(2) {
		    border-top: none;
		  }
		}
		@media screen and (min-width: 600px) {
		  .rwd-table tr:hover:not(:first-child) {
		    background-color: #d8e7f3;
		  }
		  .rwd-table td:before {
		    display: none;
		  }
		  .rwd-table th,
		  .rwd-table td {
		    display: table-cell;
		    padding: .25em .5em;
		  }
		  .rwd-table th:first-child,
		  .rwd-table td:first-child {
		    padding-left: 0;
		  }
		  .rwd-table th:last-child,
		  .rwd-table td:last-child {
		    padding-right: 0;
		  }
		  .rwd-table th,
		  .rwd-table td {
		    padding: 1em !important;
		  }
		}
		
		
		/* THE END OF THE IMPORTANT STUFF */
		
		/* Basic Styling */
		body {
			background: #4B79A1;
			background: -webkit-linear-gradient(to left, #4B79A1 , #283E51);
			background: linear-gradient(to left, #4B79A1 , #283E51);        
		}
		h1 {
		  text-align: center;
		  font-size: 2.4em;
		  color: #f2f2f2;
		}
		.center-align {
        	text-align: center;
    	}
		.container {
	        height: 10vh;
    	}
		.center-heading {
			text-align: center;
			font-size: 24px;
			margin-top: 20px;
			margin-bottom: 20px;
			font-family: Arial, sans-serif; /* 글꼴 설정 */
		}
        .date-gray {
            color: #999;
        }
        
        .delete-form {
            display: inline-block;
        }
        
        .delete-input {
            width: 120px;
            margin-right: 10px;
        }
        
        .content {
            white-space: pre-wrap;
            word-wrap: break-word;
        }
      
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <a class="navbar-brand" href="/Step02Database/index.jsp">인덱스</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      		<span class="navbar-toggler-icon"></span>
	    	</button>
	    	<div class="collapse navbar-collapse" id="navbarNav">
	      		<ul class="navbar-nav">
	        		<li class="nav-item active">
	        		    <a class="nav-link" href="insertform.jsp">방명록 쓰기</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="updateform.jsp">수정</a>
	        		</li>
	      		</ul>
	    	</div>
	</nav>
  
    <div class="container">
        <h1 class="center-heading"></h1>
        <div class="text-end">
			<a href="insertform.jsp">
			 	<button type="submit" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
						<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
					</svg>
				</button>
			</a>
			<a href="updateform.jsp">
			 	<button class="btn btn-primary" type="submit">
					  수정
				</button>
			</a>
		</div>
			
		</div>
    
        <table class="rwd-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>글내용</th>
                    <th>날짜</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
            	<tr></tr>
                <% for(GuestDto tmp : list){ %>
				
                <tr>
                	
                    <td data-th="번호"><%= tmp.getNum() %></td>
                    <td data-th="작성자"><%= tmp.getWriter() %></td>
                    <td data-th="글내용" style="width: 400px;"class="content"><%= tmp.getContent() %></td>
                    <td data-th= "날짜" style="width: 120px;"class="date-gray"><%= tmp.getRegdate() %></td>
                    <td data-th="pwd">
                        <form class="delete-form" action="delete.jsp" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                            <input type="hidden" name="num" value="<%= tmp.getNum() %>">
                            <input class="delete-input" type="password" name="pwd" placeholder ="password" required>
                            <button type="submit" class="btn btn-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                </svg>
                            </button>
                        </form>
                    </td>
                </tr>
			<% } %>                
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>












