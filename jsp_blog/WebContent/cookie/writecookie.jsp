<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	Cookie cookie = null;

	cookie = new Cookie("name", "User1"); // 한글 저장시 에러  
	cookie.setMaxAge(30); // 30초 
	response.addCookie(cookie); // 쿠키를 Client에 저장합니다. 

	cookie = new Cookie("kuk", "90");
	cookie.setMaxAge(30); // 30초 
	response.addCookie(cookie); // 쿠키를 Client에 저장합니다. 

	cookie = new Cookie("eng", "90");
	cookie.setMaxAge(30); // 30초 
	response.addCookie(cookie); // 쿠키를 Client에 저장합니다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키저장하기(쿠키객체의사용)</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<div class="content">
		<p>성적을 쿠키로 저장했다.</p>
		<p>
			<a href="./readCookie.jsp"> 쿠키로 저장된 성적 읽어오기</a>
		</p>
	</div>


</body>

</html>

