<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
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
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="content">
평창 동계올림픽<br><br>
생방송 시청하세요<br><br>


 
<FORM name='frm' method='POST' action='./notice_cookie.jsp'>
 
  
  
<input type="checkbox" value='close' onclick="document.frm.submit();">1분간 창 열지않기

</FORM>
 </DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 

