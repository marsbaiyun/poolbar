<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>台球连锁计费系统</title>
    <%@ include file="../include/head.jsp" %>
    <style type="text/css">
    	#accountinf{
    		margin-top:66px;
    	}
    </style>
</head>
<body>
	<%@ include file="../include/top.jsp" %>
    <div id="content" class="container">
        <div class="span3">
            <%@ include file="../include/role.jsp" %>
            <ul class="nav nav-list well">
                <li class="nav-header">账目管理</li>
                <li>
                    <a href="#">
                        <i class="icon-white icon-time"></i>
                        球台管理
                    </a>
                </li>
                <li>
                    <a href="#"> 
                        <i class="icon-user"></i>
                        会员管理
                    </a>
                </li>
                <li>
                    <a href="${basePath }/produce/list"> 
                        <i class="icon-barcode"></i>
                        商品管理
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-signal"></i>
                        统计信息
                    </a>
                </li>
                <li class="nav-header">账户信息</li>
                <li  class="active">
                    <a href="${basePath }/account/inf">
                        <i class=" icon-eye-open"></i> 
                        个人资料
                    </a>
                </li>
                <li>
                    <a href="${basePath }/account/changepwd">
                        <i class="icon-lock"></i>
                        修改密码
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-gift"></i>
                        更改主题
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-adjust"></i>
                        球吧管理
                    </a>
                </li>
            </ul>
        </div>
        <div class="span9 pull-right" style="margin-right:30px">
			<form id="accountinf" class="form-horizontal" action="${basePath}/account/edite" method="post">
				<fieldset>
					<input type="hidden" name="id" value="${account.id }">
					<div class="control-group">
						<label class="control-label" for="focusedInput">用户名：</label>
						<div class="controls">
							<input id="accountname" class="input-xlarge focused" type="text" name="name" value="${account.name }">
						</div>
					</div>				
					<div class="control-group">
						<label class="control-label" for="disabledInput">职位：</label>
						<div class="controls">
							<input id="disabledInput" class="input-xlarge disabled" type="text" disabled="" placeholder="${account.role }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="disabledInput">所属球吧：</label>
						<div class="controls">
							<input id="disabledInput" class="input-xlarge disabled" type="text" disabled="" placeholder="${account.bar.name }">
						</div>
					</div>	
					<div class="form-actions">
						<button class="btn btn-primary" type="submit">修改</button>
						<button class="btn" onclick="location.back()">返回</button>
					</div>								
				</fieldset>
			</form>
			

        </div>
    </div>
</body>
</html>
