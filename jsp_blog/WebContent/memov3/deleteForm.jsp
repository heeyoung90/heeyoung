<%@ page contentType="text/html; charset=UTF-8" %> 

<%
request.setCharacterEncoding("utf-8");
int memono = Integer.parseInt(request.getParameter("memono"));
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href = "../css/style.css" rel = "stylesheet">
<script type="text/javascript">
function mlist() {
	var url = "list.jsp";
	location.href=url;
}
</script>
</head> 
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<div class="title">삭제확인</div>

<div class="content">
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memonooo" value="<%=memono%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<br>
삭제하면 복구 될 수 없습니다. <br>
삭제하려면 삭제버튼을 클릭하삼. <br>
목록 버튼으로 돌아갈 수 있어. <br>
<br>
<button>삭제</button>
<button type="button" onclick="mlist()">목록</button>
</form> 
</div>

<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 