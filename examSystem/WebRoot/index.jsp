<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'My.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">   
        .center-in-center{   
            position: absolute;   
            top: 50%;   
            left: 50%;   
            -webkit-transform: translate(-50%, -50%);   
            -moz-transform: translate(-50%, -50%);   
            -ms-transform: translate(-50%, -50%);   
            -o-transform: translate(-50%, -50%);   
            transform: translate(-50%, -50%);   
        } 
        .center-in-left{   
            position: absolute;   
            top: 50%;   
            left: 50%;   
            -webkit-transform: translate(-100%, -100%);   
            -moz-transform: translate(-50%, -50%);   
            -ms-transform: translate(-50%, -50%);   
            -o-transform: translate(-50%, -50%);   
            transform: translate(-230%, -50%);   
        } 
        .center-in-right{   
            position: absolute;   
            top: 50%;   
            left: 50%;   
            -webkit-transform: translate(-100%, -100%);   
            -moz-transform: translate(-50%, -50%);   
            -ms-transform: translate(-50%, -50%);   
            -o-transform: translate(-50%, -50%);   
            transform: translate(150%, -50%);   
        } 
        .buttom{   
            position: absolute;   
            top: 50%;   
            left: 50%;   
            -webkit-transform: translate(-100%, -100%);   
            -moz-transform: translate(-50%, -50%);   
            -ms-transform: translate(-50%, -50%);   
            -o-transform: translate(-50%, -50%);   
            transform: translate(200%, 350%);   
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
  
  <body style="background:url(image/login.jpg) ;background-size:cover; ">
    <h1 style="text-align:center;">郑州大学考试系统</h1>
    <div class="buttom"><h3>ps.选择您的身份进行登录</h3></div>
     <div class="center-in-left"><img src="image/sLogin.png" width="150px" hight="40px"/><br>&emsp;&emsp;&emsp;&emsp;<a href="sLogin.jsp">学生</a></div>
     <div class="center-in-center"><img src="image/teLogin.png" width="150px" hight="40px"/><br>&emsp;&emsp;&emsp;<a href="tLogin.jsp">老师</a></div>
     <div class="center-in-right"><img src="image/aaa.png" width="150px" hight="40px"/><br>&emsp;&emsp;&emsp;<a href="aLogin.jsp">管理员</a></div>
  </body>
</html>
