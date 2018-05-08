<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
	String title = "HeeYoung";
	if(id != null && grade.equals("A")){
		title = "관리자 페이지 입니다";
	}
	
	String str = null;
	if (id == null) {
		str = "메인 페이지 입니다.";
	} else {
		str = "안녕하세요 " + id + "님!";
	}http://localhost:8000/jsp_blog/menu/images/handsome2.jpg
%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/menu/top.jsp"></jsp:include>
	<div class="title"><%=title %></div>

	<div class="content">
		<h1><%=str%></h1>
		<img src="menu/images/handsome2.jpg" width="50%"><br>

		<%
			if (id == null) {
		%>

		<input type="button" class="btn btn-warning"  value="로그인"
			onclick="location.href='member/loginForm.jsp'">

		<%
			} else {
		%>

		<input type="button" value="로그아웃"
			onclick="location.href='member/logout.jsp'">

		<%
			}
		%>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
