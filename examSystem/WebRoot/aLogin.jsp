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
    
    <title>My JSP 'aLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
        #login{
            width:400px;
            height:280px;
            position:absolute;
            left: 50%;
            top: 50%;
            margin-left:-200px;
            margin-top:-140px;
            border:1px;
            align:center;


        }
        #form{
            width:300px;
            height:160px;
            position:relative;
            left:60%;
            top:5%;
            margin-left:-150px;
            margin-top:-80px;
            
        }

    </style>
  </head>
  
  <body style="background:url(image/login2.jpg) ;background-size:cover; ">
    <h1 style="text-align:center;">登&emsp;录</h1>
      <div id="login">
    <div id="form">
    <form method="post" action="login_Action3">
       姓名：<input type="text" name="aname"><br>
       密码：<input type="password" name="apassword"><br>
       <input type="submit" value="登录">&emsp;
       <input type="reset" value="取消">
   </form>
   </div>
</div>
<s:actionerror></s:actionerror>
    
  </body>
</html>
