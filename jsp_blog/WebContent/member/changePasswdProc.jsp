<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	String newpasswd = request.getParameter("newpasswd");
	String id = request.getParameter("id");
	Map map = new HashMap();
	map.put("newpasswd", newpasswd);
	map.put("id", id);
	
	
	boolean flag=dao.go(map);
	
	

	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
	function glist() {
		var url = "./list.jsp"
		location.href = url;
	}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비번변경확인</DIV>
<% if(flag) { %> 
<div class="content">비밀번호 변경이 완료되었습니다. </div>
  <%}else{ %>
<div class="content">비밀번호 변경이 실패다. </div>
<%} %>
  <DIV class='bottom'>
 
    <input type='button' value='돌아가기' onclick="glist()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

