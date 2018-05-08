<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="member.*" %>
<%@ page import="bbs.*" %>
<%@ page import="db.*" %>
<%@ page import="memo.*" %>
<%@ page import="utility.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %> 
<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
      
      String tempDir = "/member/temp";//처음에는 여기로갔다가 
      String upDir = "/member/storage";//여기로 이동 /tempDir 를 매개변수로 가지고!
      
      tempDir = application.getRealPath(tempDir); 
      upDir = application.getRealPath(upDir);
     
//--------------------------------------------------------------------------------------------------  

      String tempDir2 = "/bbs/temp";//처음에는 여기로갔다가 
      String upDir2 = "/bbs/storage";//여기로 이동 /tempDir 를 매개변수로 가지고!
      
      tempDir2 = application.getRealPath(tempDir2); 
      upDir2 = application.getRealPath(upDir2);
     
%> 
 