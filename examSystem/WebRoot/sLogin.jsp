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
    
    <title>My JSP 'sLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset =“UTF-8”>
	<style type="text/css">
        
        body, div, h1, form, fieldset, input, textarea {
	margin: 0; padding: 0; border: 0; outline: none;
}

html {
	height: 100%;
}

body {
	background: #728eaa;
	background: -moz-linear-gradient(top, #25303C 0%, #728EAA 100%); /* firefox */	
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#25303C), color-stop(100%,#728EAA)); /* webkit */
	font-family: sans-serif; 
}

#contact {
	width: 430px; margin: 60px auto; padding: 60px 30px;
	background: #c9d0de; border: 1px solid #e1e1e1;
	-moz-box-shadow: 0px 0px 8px #444;
	-webkit-box-shadow: 0px 0px 8px #444;
}

h1 {
	font-size: 35px; color: #445668; text-transform: uppercase;
	text-align: center; margin: 0 0 35px 0; text-shadow: 0px 1px 0px #f2f2f2;
}

label {
	float: left; clear: left; margin: 11px 20px 0 0; width: 95px;
	text-align: right; font-size: 16px; color: #445668; 
	text-transform: uppercase; text-shadow: 0px 1px 0px #f2f2f2;
}

input {
	width: 260px; height: 35px; padding: 5px 20px 0px 20px; margin: 0 0 20px 0; 
	background: #5E768D;
	background: -moz-linear-gradient(top, #546A7F 0%, #5E768D 20%); /* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#546A7F), color-stop(20%,#5E768D)); /* webkit */
	border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
	-moz-box-shadow: 0px 1px 0px #f2f2f2;-webkit-box-shadow: 0px 1px 0px #f2f2f2;
	font-family: sans-serif; font-size: 16px; color: #f2f2f2; text-transform: uppercase; text-shadow: 0px -1px 0px #334f71; 
}
	input::-webkit-input-placeholder  {
    	color: #a1b2c3; text-shadow: 0px -1px 0px #38506b;  
	}
	input:-moz-placeholder {
	    color: #a1b2c3; text-shadow: 0px -1px 0px #38506b; 
	}


	
	
input:focus, textarea:focus {
	background: #728eaa;
	background: -moz-linear-gradient(top, #668099 0%, #728eaa 20%); /* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#668099), color-stop(20%,#728eaa)); /* webkit */
}

input[type=submit] {
	width: 185px; height: 52px; float: right; padding: 10px 15px; margin: 0 15px 0 0;
	-moz-box-shadow: 0px 0px 5px #999;-webkit-box-shadow: 0px 0px 5px #999;
	border: 1px solid #556f8c;
	background: -moz-linear-gradient(top, #718DA9 0%, #415D79 100%); /* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#718DA9), color-stop(100%,#415D79)); /* webkit */
	cursor: pointer;text-align: center;
	
}

    </style>
<script type="text/javascript"> 
    (function(window,document,undefined){  
        var hearts = [];  
        window.requestAnimationFrame = (function(){  
            return window.requestAnimationFrame ||  
                window.webkitRequestAnimationFrame ||  
                window.mozRequestAnimationFrame ||  
                window.oRequestAnimationFrame ||  
                window.msRequestAnimationFrame ||  
                function (callback){  
                    setTimeout(callback,1000/60);  
                }  
        })();  
        init();  
        function init(){  
            css(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: absolute;}.heart:after{top: -5px;}.heart:before{left: -5px;}");  
            attachEvent();  
            gameloop();  
        }  
        function gameloop(){  
            for(var i=0;i<hearts.length;i++){  
                if(hearts[i].alpha <=0){  
                    document.body.removeChild(hearts[i].el);  
                    hearts.splice(i,1);  
                    continue;  
                }  
                hearts[i].y--;  
                hearts[i].scale += 0.004;  
                hearts[i].alpha -= 0.013;  
                hearts[i].el.style.cssText = "left:"+hearts[i].x+"px;top:"+hearts[i].y+"px;opacity:"+hearts[i].alpha+";transform:scale("+hearts[i].scale+","+hearts[i].scale+") rotate(45deg);background:"+hearts[i].color;  
            }  
            requestAnimationFrame(gameloop);  
        }  
        function attachEvent(){  
            var old = typeof window.onclick==="function" && window.onclick;  
            window.onclick = function(event){  
                old && old();  
                createHeart(event);  
            }  
        }  
        function createHeart(event){  
            var d = document.createElement("div");  
            d.className = "heart";  
            hearts.push({  
                el : d,  
                x : event.clientX - 5,  
                y : event.clientY - 5,  
                scale : 1,  
                alpha : 1,  
                color : randomColor()  
            });  
            document.body.appendChild(d);  
        }  
        function css(css){  
            var style = document.createElement("style");  
            style.type="text/css";  
            try{  
                style.appendChild(document.createTextNode(css));  
            }catch(ex){  
                style.styleSheet.cssText = css;  
            }  
            document.getElementsByTagName('head')[0].appendChild(style);  
        }  
        function randomColor(){  
            return "rgb("+(~~(Math.random()*255))+","+(~~(Math.random()*255))+","+(~~(Math.random()*255))+")";  
        }  
    })(window,document);  
</script> 
  </head>
  
  <body >
  
    <div id="contact">
     <h1>登&emsp;录</h1>
        <form method="post" action="login_Action">
       学号：<input type="text" name="snumber"><br>
       密码：<input type="password"  name="spassword"><br>
        &emsp;&emsp;&emsp; <input type="submit" value="提交" >&emsp;
        <!--   <input type="reset" value="取消">-->
            
        </form>
      </div>

<s:actionerror></s:actionerror>
<s:fielderror></s:fielderror>
  </body>
</html>
