<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link href="../css/style.css" rel="stylesheet"> -->
<script type="text/javascript">
	function incheck(f) {
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
	}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
	<h2><span class="glyphicon glyphicon-pencil"></span>등록</h2>
	<form method='post' action='createProc.jsp' onsubmit="return incheck(this)">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="50" name="content"></textarea></td>
			</tr>
		</table>
		<div class="bottom">
			<button>전송</button>
		</div>
	</form>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>