<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>台球连锁计费系统</title>
	<%@ include file="../include/head.jsp" %>
	<script type="text/javascript" src="${basePath }/static/My97/WdatePicker.js"></script>
</head>
<body>
	<jsp:include page="../include/top.jsp">
		<jsp:param value="deal" name="tag"/>
	</jsp:include>
	
    <div id="content" class="container">
        <div class="span3">
            <%@ include file="../include/role.jsp" %>
        </div>
        <div class="span9 pull-right" style="margin-right:30px">

			<ul class="breadcrumb">
		        <li class="active">球吧营业额 <span class="divider">/</span></li>
		        <li><a href="${basePath }/bar/count/produce">商品营业额</a> <span class="divider">/</span></li>
		        <li><a href="${basePath }/bar/count/desk">球台在线时长</a></li>
		    </ul>
            
            <h3>球吧营业额</h3><br/>           
            <form class="form-horizontal" action="${basePath }/bar/count" method="post">
           		<div class="control-group" >
					<label class="control-label" >开始时间：</label>
					<div class="controls">
					 	<input  type="text" onClick="WdatePicker()" name="startTime" value="${startTime }"/>
					</div>
				</div>
           		<div class="control-group">
					<label class="control-label" >结束时间：</label>
					<div class="controls">
					 	<input  type="text" onClick="WdatePicker()" name="endTime" value="${endTime }"/>
						<input value="查询" type="submit" class="btn btn-primary" style="margin-left:10px;">
					</div>
				</div>	
            </form>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>球吧ID</th>
                        <th>球吧名称</th>
                        <th>营业额(元)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${account.bar.id }</td>
                        <td>${account.bar.name }</td>
                        <td>${total }</td>
                    </tr>
                </tbody>
            </table>
            <div class="pull-right">
	            <p class="help-block"> 注：默认显示当月统计（从1号开始） </p>
            </div>
        </div>
    </div>
</body>
</html>