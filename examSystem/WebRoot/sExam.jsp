<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sExam.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background:url(image/login2.jpg) ;background-size:cover; ">
   ${sessionScope.name}同学，欢迎使用本考试系统，<a href='Get_Action'>点击此处查看您可以参加的考试科目。 </a><br>
   
   <s:iterator value="#application.paperlist" var="plist">
        
        <s:property value="#plist.getId()"/>.
        <s:property value="#plist.getPname()"/>
        <a href='Gets_Action?id=<s:property value="#plist.getId()" />'><span>参加考试</span></a><br>
  </s:iterator>
   </body>
</html>
