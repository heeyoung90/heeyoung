<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<% 
	UploadSave upload = new UploadSave(request, -1,-1, tempDir);
	String id = upload.getParameter("id");
	String email = upload.getParameter("email");
	
	String str="";
	
	if(dao.duplicateId(id)){
		str="중독된아이디입니다. 아이디중복확인하세요";
	}else if(dao.duplicateEmail(email)){
		str="중독된이메일입니다. 이메일중복확인하세요";
	}else{
		
		request.setAttribute("upload", upload);//request
%>
		<jsp:forward page="/member/createProc.jsp" />

<% 	
	return;
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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이메일아이디 중복확인</DIV>
<div class="content">
<%=str %>
</div> 

  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

