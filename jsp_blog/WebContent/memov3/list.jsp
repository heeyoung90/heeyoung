
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<jsp:useBean id="dao" class="memo.MemoDAO" />


<%
	//검색관련
	String col= Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word="";
	
	//페이징관련
	int nowPage = 1;
	int recordPerPage = 5;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<MemoDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.search{
	width: 80%;
	text-align = center;
	margin: 2px auto;
}
</style>

<!-- <link href="../css/style.css" rel = "stylesheet"> -->
<script>
	function read(memono) { //자바스크립트의 메소드는 매개변수 타입을 쓰지 않는다. 들어간 것은 memono의 값(int)
		//alert(memono); //얘는 경고창으로 그 값을 보여준다.
		var url = "read.jsp";
		url += "?memono=" + memono; //get방식으로 간다. 주소창에 다 보임.
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	
	<div class="search">
		<form action="./list.jsp" method="post">
		<select name="col">
			<option value="title"
			<%if(col.equals("title")) out.print("selected"); %>
			>제목</option>
			<option value="content"
			<%if(col.equals("content")) out.print("selected"); %>
			>내용</option>
			<option value="tatal">전체출력</option>
		</select>
		<input type="search" name="word" value="<%=word %>" required>
		<button>검색</button>
		<button type="button" onclick="location.href='memoCreate.jsp'">등록</button>
	</div>
	
	<DIV class="container-fluid">
	<h2><span class="glyphicon glyphicon-th-list"></span>메모목록</h2>

	<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th> 
			<th>날짜</th>
			<th>조회수</th>
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
		</tr>
		</thead>
		<%
			if (list.size() == 0) {
		%>
		<tbody>
		<tr>
			<td colspan="7">등록된 메모가 없습니다.</td>
		</tr>
		</tbody>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					MemoDTO dto = list.get(i);
		%>
		<tbody>
		<tr>
			<td><%=dto.getMemono()%></td>
			<td>
			<%if(dto.getIndent()>0){ 
				for(int r=0; r<dto.getIndent();r++){
					out.print("&nbsp;&nbsp;");
				}
				out.print("<img src='../images/re2.jpg' width='20'>");
			} %>
			
			<a href="javascript:read('<%=dto.getMemono()%>')"><%=dto.getTitle()%></a>
			<%
			if(Utility.compareDay(dto.getWdate())) {%>
			<img src ='../images/new.gif'>
			<%}%>
			</td>
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
		</tr>
		</tbody>
		<%
			}
		}
		%>
	</table>
	<div class="bottom">
		<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
	</div>
	
	</DIV>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body>
</html>
