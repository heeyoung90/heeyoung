
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	boolean flag = dao.create(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* {
	font-size: 25px;
}
</style>
</head>
<body>
	<div style="text-align: center">
		<%
			if (flag) {
				out.print("메모를 등록했습니다.");
			} else {
				out.print("메모등록을 실패했습니다.");
			}
		%>
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./memoCreate.jsp'"><br>
		<button type="button" onclick="location.href='./list.jsp'">목록</button>
		<br> 제목:<%=dto.getTitle()%>
		<br> 내용:<%=dto.getContent()%>
	</div>
</body>
</html>