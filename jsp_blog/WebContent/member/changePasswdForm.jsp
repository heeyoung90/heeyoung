<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO" />

<%
String id = request.getParameter("id");
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function passCheck(f) {
	
	if(f.newpasswd.value == ""){
	alert("비번입력해야함");
	return false;
	}
	
	if(f.newpasswd.value != f.renewpasswd.value){
		alert("비밀번호가 일치하지않는다 다시입력");
		f.renewpasswd.focus();
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호 수정</DIV>
 
<FORM name='frm' method='POST' action='./changePasswdProc.jsp' onsubmit="return passCheck(this)">
<input type="hidden" name="id" value="<%=id%>" >

  <TABLE>
    <TR>
      <TH>id</TH>
      <TD><%=id %></TD>
    </TR>
    
    <TR>
      <TH>변경할password</TH>
      <TD><input type="password" name="newpasswd"></TD>
    </TR>
    
    <TR>
      <TH>한번 더쳐봐라</TH>
      <TD><input type="password" name="renewpasswd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경' >
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

