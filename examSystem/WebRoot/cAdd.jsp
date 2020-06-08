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
    
    <title>My JSP 'cAdd.jsp' starting page</title>
    
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
<form method="post" action="cAdd_Action2">
      试卷号：<input type="text" name="id"><br>   
      题&nbsp;&nbsp;&nbsp;目：<input type="text" name="c.question"><br>
      答&nbsp;&nbsp;&nbsp;案：<input type="text" name="c.anser"><br>
      选项A：<input type="text" name="c.optionA"><br>
      选项B：<input type="text" name="c.optionB"><br>
      选项C：<input type="text" name="c.optionC"><br>
      选项D：<input type="text" name="c.optionD"><br>
      <input type="submit" value="提交">
      <input type="reset" value="取消"> 
    </form>
  </body>
</html>
