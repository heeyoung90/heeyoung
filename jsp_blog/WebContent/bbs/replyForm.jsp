<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<%	
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = dao.readReply(bbsno);
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
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function incheck(f){
	if(f.wname.value==""){
		alert("이름을 입력하세요");
		f.wname.focus();//커서를 옯긴다
		
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();//커서를 옯긴다
		
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();//커서를 옯긴다
		
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호을 입력하세요");
		f.passwd.focus();//커서를 옯긴다
		
		return false;
	}
	
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 <div class="container">
	<h2><span class="glyphicon glyphicon-pencil"></span>답변</h2>
</div>
 
<FORM name='frm' 
	method='POST' 
	action='./replyProc.jsp'
	onsubmit="return incheck(this)"
	enctype = "multipart/form-data"
	> 
	
	<input type="hidden" name="nowPage" value ="<%=request.getParameter("nowPage")%>">
	<input type="hidden" name="col" value ="<%=request.getParameter("col")%>">
	<input type="hidden" name="word" value ="<%=request.getParameter("word")%>">
	<input type="hidden" name="bbsno" value ="<%=bbsno%>">
	<input type="hidden" name="grpno" value ="<%=dto.getGrpno()%>">
	<input type="hidden" name="indent" value ="<%=dto.getIndent()%>">
	<input type="hidden" name="ansnum" value ="<%=dto.getAnsnum()%>">
  <TABLE class="table table-bordered">
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" ></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" name="content"></textarea></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" ></TD>
    </TR>
    <TR>
      <TH>파일명</TH>
      <TD><input type="file" name="filename" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답변'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

