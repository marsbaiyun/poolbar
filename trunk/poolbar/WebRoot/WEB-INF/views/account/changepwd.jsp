<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>台球连锁计费系统</title>
    <%@ include file="../include/head.jsp" %>
    <style type="text/css">
    	#accountpwd{
    		margin-top:66px;
    	}
    </style>
</head>
<body>
	<%@ include file="../include/top.jsp" %>
    <div id="content" class="container">
        <div class="span3">
            <%@ include file="../include/role.jsp" %>
        </div>
        <div class="span9 pull-right" style="margin-right:30px">
			<c:choose>
				<c:when test="${param.code == '002'}">
		        	<div class="alert alert-error" >
						<button class="close" data-dismiss="alert">×</button>
						<strong>你输入的旧密码有误！</strong>
					</div>
				</c:when>
				<c:when test="${param.code == '001'}">
					<div class="alert alert-success">
						<button class="close" data-dismiss="alert">×</button>
						<strong>修改成功！</strong>
					</div>
				</c:when>				
			</c:choose>

			<form id="accountpwd" class="form-horizontal" action="${basePath}/account/updatepwd" method="post">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">请输入旧密码:</label>
						<div class="controls">
							<input id="oldpwd" class="input-xlarge" type="password" name="oldpwd">
						</div>
					</div>			
					<div class="control-group">
						<label class="control-label" for="input01">请输入新密码:</label>
						<div class="controls">
							<input id="newpwd" class="input-xlarge" type="password" name="newpwd">
						</div>
					</div>	
					<div class="control-group">
						<label class="control-label" for="input01">请再次输入新密码:</label>
						<div class="controls">
							<input id="newpwd2" class="input-xlarge" type="password">
						</div>
					</div>					
					<div class="form-actions">
						<button id="next" class="btn btn-primary" type="submit">保存</button>
						<button class="btn" onclick="location.back()">返回</button>
					</div>								
				</fieldset>
			</form>
        </div>
    </div>
</body>
</html>
