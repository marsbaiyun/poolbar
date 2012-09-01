<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>台球连锁计费系统</title>
	<%@ include file="../include/head.jsp" %>
</head>
<body>
	<jsp:include page="../include/top.jsp">
		<jsp:param value="deal" name="tag"/>
	</jsp:include>
	
    <div id="content" class="container">
        <div class="span3">
            <%@ include file="../include/role.jsp" %>
         
            <ul class="nav nav-list well">
                <li class="nav-header">账目管理</li>
                <li>
                    <a href="#">
                        <i class="icon-time"></i>
                        球台管理
                    </a>
                </li>
                <li  class="active">
                    <a href="#"> 
                        <i class="icon-user"></i>
                        会员管理
                    </a>
                </li>
                <li>
                    <a href="#"> 
                        <i class="icon-white icon-barcode"></i>
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
                <li>
                    <a href="#">
                        <i class=" icon-eye-open"></i> 
                        个人资料
                    </a>
                </li>
                <li>
                    <a href="#">
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
            <ul class="breadcrumb">
                <li class="active">会员管理 / 添加会员</li>
            </ul>
			<form class="form-horizontal" action="${basePath }/vip/new" method="post" style="margin-top:30px;border:1px solid #ddd;padding-top:20px;">
				<div class="control-group">
					<label class="control-label">姓名：</label>
					<div class="controls">
					  <input type="text" name="name">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">密码：</label>
					<div class="controls">
					  <input type="password" name="password">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">联系方式：</label>
					<div class="controls">
					  <input type="text" name="tel">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
					  <input value="添加" type="submit" class="btn btn-primary">
					</div>
				</div>
			</form>
        </div>
    </div>
</body>
</html>