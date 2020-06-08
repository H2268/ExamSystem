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
    
    <title>My JSP 'pEdit.jsp' starting page</title>
    
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
    <s:iterator value="#application.tlist" var="t_list">
        <s:property value="#t_list.getId()"/>.&nbsp;
        <s:property value="#t_list.getQuestion()"/>
        <a href='cDelete_Action2?id=<s:property value="#t_list.getId()"/>'>删除</a><br>
        A.<s:property value="#t_list.getOptionA()"/><br>
        B.<s:property value="#t_list.getOptionB()"/><br>
        C.<s:property value="#t_list.getOptionC()"/><br>
        D.<s:property value="#t_list.getOptionD()"/><br>
        <p></p>
        
   </s:iterator><br>
    
  </body>
</html>
