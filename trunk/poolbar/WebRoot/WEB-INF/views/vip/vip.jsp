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
            <table>
                <tr>
                    <td style="width:60%"><img src="../static/img/billiards.png" width="64px" height="64px" alt="用户" /></td>
                    <td>
                        ${sessionScope.account.bar.name }<br/>
                        ${sessionScope.account.name } <br/>
                        ${sessionScope.account.role } <br/>
                    </td>
                </tr>
            </table>
            <ul class="nav nav-list well">
                <li class="nav-header">账目管理</li>
                <li>
                    <a href="#">
                        <i class="icon-time"></i>
                        球台管理
                    </a>
                </li>
                <li>
                    <a href="#"> 
                        <i class="icon-user"></i>
                        会员管理
                    </a>
                </li>
                <li class="active">
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
                <li class="active">会员管理</li>
                <li class="pull-right"><a href="vip-new.html">添加会员</a></li>
            </ul>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>联系方式</th>
                        <th>会员级别</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="vip" items="${vipList }">
                	<tr>
                        <td>${vip.id }</td>
                        <td>${vip.name }</td>
                        <td>${vip.tel }</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${vip.discount  == 0.7}">VIP3</c:when>
                        		<c:when test="${vip.discount  == 0.8}">VIP2</c:when>
								<c:otherwise>VIP1</c:otherwise>
                        	</c:choose>
                        </td>
                        <td>
                            <a href="${basePath }/vip/vip-edit">修改</a>
                            <a href="${basePath }/vip/vip-del&id=${vip.id}">删除</a>
                        </td>
                    </tr>	
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>