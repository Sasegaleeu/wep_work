<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] fortunes={"동쪽으로 가면 귀인을 만나요", 
        "오늘은 집에만 계세요", 
        "너무 멀리가지 마세요",
        "오늘은 뭘해도 되는 날이에요",
        "로또가 당첨되요"};
// Random 객체를 생성해
Random ran = new Random();
// 0~4 사이의 랜덤한 정수를 얻어내
int ranNum = ran.nextInt(5);
%>
	<p> <% out.print(fortunes[ranNum]); %> </p>
</body>
</html>