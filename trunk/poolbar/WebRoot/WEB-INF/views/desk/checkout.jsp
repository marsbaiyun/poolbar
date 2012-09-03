<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>台球连锁计费系统</title>
    <%@ include file="../include/head.jsp" %>
</head>
<body>
	<%@ include file="../include/top.jsp" %>
    <div id="content" class="container">
        <div class="span3">
            <%@ include file="../include/role.jsp" %>
        </div>
        <div class="span9 pull-right" style="margin-right:30px">
        	<ul class="breadcrumb">
        		<li>
        			<a href="${basePath }/consume">球台管理</a>
        		</li>
        		<span class="divider">/</span>
                <li class="active">结账</li>           
            </ul>
        	<table class="table table-bordered">
				<thead>
					<tr>
						<th>桌号</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>用时</th>
						<th>价钱</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${order.deskid }</td>
						<td>${order.starttime }</td>
						<td>${order.endtime }</td>
						<td>${fn:substring(diff, 0, 6) }小时</td>
						<td>${order.total }元</td>
					</tr>
				</tbody>
			</table>
        </div>
    </div>
</body>
</html>