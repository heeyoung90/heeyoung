<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	String id = request.getParameter("id");//list.jsp에서 들어왔을때
 	if(id==null)
	id = (String)session.getAttribute("id");//메뉴에서 들어왔을때
	MemberDTO dto = dao.read(id);
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mdelete() {
	var f= document.frm;
	if(f.passs.value != <%=dto.getPasswd()%>){    //폼에서 입력한값이랑 dto에넣은 값이랑 비교
		alert("비밀번호가 일치하지않는다 다시입력");
		f.passs.focus();
		return false;
	}
	var url = "./deleteForm.jsp"
	url += "?id=<%=id%>";
	location.href = url;
	
}
	function mupdate() {
		var f= document.frm;
		if(f.passs.value != <%=dto.getPasswd()%>){    //폼에서 입력한값이랑 dto에넣은 값이랑 비교
			alert("비밀번호가 일치하지않는다 다시입력");
			f.passs.focus();
			return false;
		}
		var url = "./updateForm.jsp"
		url += "?id="+"<%=id%>";
		location.href = url;
		
	}
	function mlist() {
		var url = "./list.jsp"
		location.href = url;
	}

	function updateFile() {
		var f= document.frm;
		if(f.passs.value != <%=dto.getPasswd()%>){    //폼에서 입력한값이랑 dto에넣은 값이랑 비교
			alert("비밀번호가 일치하지않는다 다시입력");
			f.passs.focus();
			return false;
		}
		var url = "./updateFileForm.jsp";
		url += "?id=<%=id%>";
		url += "&oldfile=<%=dto.getFname()%>";
		
		location.href = url;
	}
	
	function passCheck(f) {
		if(f.passs.value != <%=dto.getPasswd()%>){
			alert("비밀번호가 일치하지않는다 다시입력");
			f.passs.focus();
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
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 
<form action="./changePasswdForm.jsp" name ="frm" method="post" onsubmit="return passCheck(this)">
<input type="hidden" name="id" value="<%=id%>">
  <TABLE>
    <TR>
      <TD colspan="2">
      	<img src="./storage/<%=dto.getFname() %>">
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>
      	<%=dto.getId() %>
      </TD>
    </TR>
    
    <TR>
      <TH>성명</TH>
      <TD>
      	<%=dto.getMname() %>
      </TD>
    </TR>
    
    <TR>
      <TH>전화번호</TH>
      <TD>
      	<%=dto.getTel() %>
      </TD>
    </TR>
    
    <TR>
      <TH>우편번호</TH>
      <TD>
      	<%=dto.getZipcode() %>
      </TD>
    </TR>
    
    <TR>
      <TH>주소</TH>
      <TD>
      	<%=Utility.checkNull(dto.getAddress1()) %>
      	<%=Utility.checkNull(dto.getAddress2()) %>
      </TD>
    </TR>
    
    <TR>
      <TH>직업</TH>
      <TD>
      	직업코드:<%=dto.getJob() %>
      	(<%=Utility.getCodeValue(dto.getJob()) %>)
      </TD>
    </TR>
    
     <TR>
      <TH>가입날까</TH>
      <TD>
      	<%=dto.getMdate() %>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD>
      	<input type="password" size="17" name = "passs">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type="button" value='정보수정' onclick="mupdate()">
    <input type="button" value='회원탈퇴' onclick="mdelete()">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='목록으로' onclick="mlist()">
    <input type="submit" value='패스워드변경' >
    <input type='button' value='다운로드'  
      onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'"> 
    
  </DIV>
</form>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

