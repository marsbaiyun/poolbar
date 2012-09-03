<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>台球连锁计费系统</title>
	<%@ include file="include/head.jsp" %>
	<style type="text/css">
		a{
			margin-left:250px;
		 }
		 .login {
            width:350px;
            height:300px;
            margin-right:auto;
            margin-left:auto;
            margin-top:40px;
            
        }
        #myform {
            margin-left:10px;
        }
	</style>
</head>
<body>
	<div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a href="index" class="brand">台球连锁计费系统</a>
            </div>
        </div>
    </div>
    <div id="content" class="container">
        <div class="well login">
            <h2>系统登录</h2>
        		<c:if test="${errormsg != null }">
					<div class="alert alert-error">
						<button class="close" data-dismiss="alert">×</button>
						<strong>${errormsg }</strong>
					</div>
				</c:if>
            <form action="${basePath }/login" method="post" id="myform">
            	<fieldset>
                    <div id="namediv" class="control-group">
                        <label for="username">用户名：</label>
                        <input type="text" id="username" name="name" style="width:320px" value="${account.name }"/>
                        <span class="help-block" id="span1"></span>
                    </div>
                    <div id="pwddiv" class="control-group">
                        <label for="password">密码:<a href="#">忘记密码</a></label>
                        <input type="password" id="password" name="password" style="width:320px" value="${account.password }"/>
                        <span class="help-block" id="span2"></span>
                    </div>
					<div class="pull-right">
						<button id="login" class="btn btn-primary" href="#">登陆</button>
	                    <button id="btn" class="btn btn-success" type="button">注册</button>
					</div>
                </fieldset>
            </form>
        </div>
    </div>
	<script type="text/javascript">
        $(document).ready(function() {

            $("#username").focus(function() {
                $("#span1").html("");
                $("#namediv").removeClass("error");
            });
            $("#username").blur(function() {
                var name = $(this).val();
                if (name.trim() == "") {
                    $("#span1").html("请输入用户名");
                    $("#namediv").addClass("error");
                }
            });
            $("#password").focus(function() {
                $("#span2").html("");
                $("#pwddiv").removeClass("error");
            });
            $("#password").blur(function() {
                var pwd = $(this).val();
                if (pwd == "") {
                    $("#span2").html("请输入密码");
                    $("#pwddiv").addClass("error");
                }
            });
            $("#login").click(function() {
                var name = $("#username").val();
                var pwd = $("#password").val();
                if (name.trim() == "") {
                    $("#span1").html("请输入用户名");
                    $("#namediv").addClass("error");
                }
                if (pwd == "") {
                    $("#span2").html("请输入密码");
                    $("#pwddiv").addClass("error");
                }
                if (name.trim() != "" && pwd != "") {
                    $("#myform").submit();
                }
            });
        });
    </script>
</body>
</html>