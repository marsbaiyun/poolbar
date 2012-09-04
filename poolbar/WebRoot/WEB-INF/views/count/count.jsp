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
        		<li>
        			<a href="#">统计信息</a>
        		</li>
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
            <h3>售出商品统计</h3><br/>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>商品名称</th>
                        <th>商品单价</th>
                        <th>售出数量</th>
                        <th>售出总价</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>冰红茶</td>
                        <td>3.0元</td>
                        <td>20</td>
                        <td>60元</td>
                    </tr>
                </tbody>
            </table>
            <h3>球台在线统计</h3><br/>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>桌号</th>
                        <th>总在线时长</th>
                        <th>营业额</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>20.45小时</td>
                        <td>160</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>