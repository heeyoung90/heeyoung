<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
 <%
	 int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	 String passwd = request.getParameter("passwd");
	 String oldfile = request.getParameter("oldfile");
	 System.out.print(oldfile);
	 Map map = new HashMap();
	 map.put("bbsno", bbsno);
	 map.put("passwd", passwd);
	 boolean pflag= dao.passcheck(map);
	 boolean flag = false;
	 if(pflag){
		 flag = dao.delete(bbsno);
	 }
 	if(flag)UploadSave.deleteFile(upDir2, oldfile);
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function blist() {
	var url = "./list.jsp";
	url +="?col=<%=request.getParameter("col")%>";
	url +="&word=<%=request.getParameter("word")%>";
	url +="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">삭제확인</DIV>
<DIV class="content">
<%
if(pflag==false){
	out.print("잘못된 비번입니다");
	out.print("<button type='button' onclick='history.back()'>다시시도</button>");
}else if(flag){
	out.print("글을 삭제했어요");
}else{
	out.print("삭제실패.");
}

%>

</DIV>
 

 
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
  </DIV>

 
<!-- ***********************************************-->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- ***********************************************-->
</html> 

