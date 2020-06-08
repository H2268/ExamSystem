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
    
    <title>My JSP 'index.jsp' starting page</title>
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
  <a href='Gets_Action3'>点击此处查看学生</a><br>
    <table border="3">
    <s:iterator value="#application.studentlist" var="slist">
        <tr>
        <td><s:property value="#slist.getSnumber()"/></td>
        <td><s:property value="#slist.getSname()"/></td>
        <td><a href='delete_Action3?id=<s:property value="#slist.getId()" />'><span>删除</span></a></td>
        <td><a href='Get_Action3?id=<s:property value="#slist.getId()" />'><span>修改</span></a><br></td>
        </tr>
    </s:iterator>
    </table>
    <a href="sAdd.jsp">增加学生</a>
    
  </body>
</html>
