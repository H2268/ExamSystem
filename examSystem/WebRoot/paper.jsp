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
    
    <title>My JSP 'exam.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!--此处代码无效，因为先执行onclick函数再执行href 
<script>
myFunction=function(){
	var div=document.getElementById("test");
	div.style.display="none";
	
}
</script>
 -->

  </head>
  
 <a onclick="myFunction()" href='Get_Action2'> <div id="test">点击此处查看试卷</div></a><br>
<body style="background:url(image/login2.jpg);background-size:cover; ">
   <table border="1">
   <s:iterator value="#application.paperlist" var="plist">
       <tr><!--   <s:property value="#plist.getId()"/>-->
        <td><s:property value="#plist.getPname()"/></td>
        <td><a href='get_Action2?id=<s:property value="#plist.getId()" />'><span>编辑</span></a></td>
        <td><a href='delete_Action2?id=<s:property value="#plist.getId()" />'><span>删除</span></a></td>
        <td><a href="cAdd.jsp"/>增加试题</a><br> </td>
        </tr>
    </s:iterator>
    </table>
    <a href='getScore_Action2'>点击此处查看学生成绩</a><br>
   <table border="3">
    <s:iterator value="#application.scorelist" var="scolist">
        <tr>
        <td><s:property value="#scolist.getName()"/></td>
        <td><s:property value="#scolist.getPname()"/></td>
        <td><s:property value="#scolist.getScore()"/><td>
        </tr>  
    </s:iterator>
    </table>
        
</body>
</html>
