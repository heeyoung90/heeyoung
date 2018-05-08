<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
String windowOpen  = "open";

Cookie[] cookies = request.getCookies();
Cookie cookie = null;

if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		cookie = cookies[i];
		
		if(cookie.getName().equals("windowOpen")){
			windowOpen = cookie.getValue();
		}
	}
}


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
window.onload = function () {
	notice();
}

function notice() {
	if("<%=windowOpen%>" == "close"){
		
	}else{
		var url = "./notice.jsp";
		window.open(url, '공지사항', "left=10,top=40,width=450,height=300");
	}
	
}
function openNotice() {
	var url = "./notice.jsp";
	window.open(url, '공지사항', "left=10,top=40,width=450,height=300");
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
오늘은 목요일입니다<br><br>
평창동계올림픽 하고있음<br><br>
가고싶다<br><br>
[<a href='javascript:openNotice()'>새로운 공지보기</a>]
</DIV>
 
<FORM name='frm' method='POST' action='./.do'>
  <TABLE>
    <TR>
      <TH></TH>
      <TD></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

