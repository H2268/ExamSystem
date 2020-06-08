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
    
    <title>My JSP 'sJoin.jsp' starting page</title>
    
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
<SCRIPT LANGUAGE="JavaScript">   
<!--   
var maxtime = 60*60 //一个小时，按秒计算，自己调整!   
function CountDown(){   
if(maxtime>=0){   
minutes = Math.floor(maxtime/60);   
seconds = Math.floor(maxtime%60);   
msg = "距离考试结束还有"+minutes+"分"+seconds+"秒，禁止刷新此页面，否则按作弊处理";
document.all["timer"].innerHTML=msg;   
if(maxtime == 5*60) alert('注意，还有5分钟!');   
--maxtime;   
}   
else{   
clearInterval(timer);   
alert("时间到，结束!");   
}   
}   
timer = setInterval("CountDown()",1000);   
//-->   
</SCRIPT>   
<div id="timer" style="color:red"></div> 
      <%int i=1; %>
    <s:iterator value="#application.clist" var="c_list">
       <%=i%>.&nbsp;<!--   <s:property value="#c_list.getId()"/>-->
        <s:property value="#c_list.getQuestion()"/><br>
        A.<s:property value="#c_list.getOptionA()"/><br>
        B.<s:property value="#c_list.getOptionB()"/><br>
        C.<s:property value="#c_list.getOptionC()"/><br>
        D.<s:property value="#c_list.getOptionD()"/><br>
        <%i++; %>
        <p></p>
   </s:iterator><br>
   作答区域：
   
   <form method="post" action="Check_Action">
        <input type="hidden" name="sName" value=${sessionScope.name}>
        <input type="hidden" name="paperId" value=${sessionScope.paperId}>
       请按顺序输入您的答案：<input type="text" name="anser"><br>
        <input type="submit" value="提交">
   </form>
   
  </body>
</html>
