<%@ page contentType="text/html; charset=UTF-8" %> 
<%@include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
	//검색관련--------------------
	String col =Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word="";
	//검색관련 end ------------------------------
	//paging 관련
	int nowPage = 1;//현재 보고있는 페이지
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	int recordPerPage = 5;//한페이지당 보여줄 레코드 갯수
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	//----------------------------
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List <BbsDTO> list = dao.list(map);

	//전체 레코드 갯수 가져오기
	int totalRecord = dao.total(map);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
	function fileDown(filename) {
		var url ="<%=root%>/download";
		url += "?filename="+filename;
		url += "&dir=/bbs/storage";
		location.href = url;
	}
	function bcreate() {
		var url ="./createForm.jsp";
		location.href = url;
	}
	function read(bbsno) {
		var url ="./read.jsp";
		url += "?bbsno="+bbsno;//자바스크립트변수는 + jsp변수는 식 안에
		url += "&col=<%=col%>"; 
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.search{
	width: 80%;
	margin: 2px auto;
	text-align: center;
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="search">
<form action="./list.jsp" method="post">
<select name="col"> 
	<option value="wname" 
	<%if(col.equals("wname")) out.print("selected"); %>
	>성명</option>
	<option value="title" 
	<%if(col.equals("title")) out.print("selected"); %>
	>제목</option>
	<option value="content"
	<%if(col.equals("content")) out.print("selected"); %>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<input type="search" name="word" required="required" value="<%=word%>">
<button>검색</button>
<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
</form>
</div> 


<DIV class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>게시판목록</h2>


  <TABLE class="table table-hover">
  <thead>
    <TR>
      <TH>번호</TH>
      <TH>이름</TH>
      <TH>제목</TH>
      <TH>등록날짜</TH>
      <TH>조회수</TH>
      <TH>파일명</TH>
  
    </TR>
    </thead>
    <%if(list.size()==0){ %>
    <tbody>
    	<tr>
    		<td colspan="6">
    			등록된 글이 없습니다
    		</td>
    	</tr>
    	</tbody>
    <%}else{
    	for(int i=0; i<list.size();i++){	
    		BbsDTO dto = list.get(i);  	
    %>
    
    <tbody>
    <TR>
      <TD><%=dto.getBbsno() %></TD>
      <TD><%=dto.getWname() %></TD>
      <TD>
      <% if(dto.getIndent()>0){ 
    		for(int r=0;r<dto.getIndent();r++ ){
         		out.print("&nbsp;&nbsp;");
         	}
      %>
      
      <img src="../menu/images/re2.jpg" width="20" >
     <%
     
      } 
     %> 
      <a href="javascript:read('<%=dto.getBbsno()%>')" rel=""><%=dto.getTitle() %></a>
     <%
      if(Utility.compareDay(dto.getWdate())){ %>
      <img src = "../menu/images/new.gif">
      
      <%} %>

      </TD>
      <TD><%=dto.getWdate() %></TD>
      <TD><%=dto.getViewcnt() %></TD> 
      <TD><%if(dto.getFilename() == null){
    	  out.print(Utility.checkNull(dto.getFilename()));
      }else{%>
      <a href="javascript:fileDown('<%=dto.getFilename() %>')"><%=dto.getFilename() %></a>
      <%} %>
      </TD> 
      
    </TR>
    </tbody>
    <%
    }//for-end
    
    }
    %>
    
  </TABLE>
  
  <DIV class='bottom'>
  <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>

 
 </DIV>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

