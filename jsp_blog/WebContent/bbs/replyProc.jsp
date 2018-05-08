<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />

<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir2);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
	
	String nowPage= upload.getParameter("nowPage");
	String col= upload.getParameter("col");
	String word= UploadSave.encode(upload.getParameter("word"));

	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();
	String filename = null;

	if (size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir2);
	}
	dto.setFilesize(size);
	dto.setFilename(filename);

	//ansnum증가
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	dao.upAnsnum(map);

	//답변추가
	boolean flag = dao.createReply(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function blist() {
	var url = "list.jsp";
	url += "?col=<%=col%>"
	url += "&word=<%=word%>"
	url += "&nowPage=<%=nowPage%>"

	location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">답변확인</DIV>
	<div class="content">
		<%
			if (flag) {
				out.print("답변을 생성했습니다");
			} else {
				out.print("답변쓰기를 실패했습니다");
			}
		%>
	</div>

	<DIV class='bottom'>
		<input type='button' value='목록' onclick="blist()">
	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>

