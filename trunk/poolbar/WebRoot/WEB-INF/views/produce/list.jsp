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
        </div>
        <div class="span9 pull-right" style="margin-right:30px">
            <ul class="breadcrumb">
                <li class="active">商品管理</li>
                <li class="pull-right"><a href="#myModal" data-toggle="modal">添加商品</a></li>				
            </ul>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>商品名</th>
                        <th>商品价格（单位：元）</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${producelist}" var="produce" varStatus="status">
	                    <tr>
	                        <td>${status.count}</td>
	                        <td class="producename">${produce.name }</td>
	                        <td class="produceprice">${produce.price}</td>
	                        <td>
	                            <a href="#editModal" class="editbtn" rel="${produce.id }" data-toggle="modal">修改</a>
	                            <a href="del/${produce.id }" class="delbtn">删除</a>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
		</div>
    </div>
	<div class="modal hide fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">商品添加</h3>
		</div>
		<div class="modal-body">
			<form id="newproduce" action="save" method="post" class="form-horizontal">
				<input type="hidden" id="barid" name="barid" value="${account.bar.id }">
				<div class="control-group">
					<label class="control-label">商品名：</label>
					<div class="controls">
					  <input type="text"  name="name">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">价格：</label>
					<div class="controls">
					  <input class="span1" type="text"  name="price">&nbsp;&nbsp;元
					</div>
				</div>				
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button id="add" class="btn btn-primary">保存</button>
		</div>
	</div>
	<div class="modal hide fade in" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">商品修改</h3>
		</div>
		<div class="modal-body">
			<form id="editeproduce" action="update" method="post" class="form-horizontal">
				<input type="hidden" id="proid" name="id">				
				<input type="hidden" id="barid" name="barid" value="${account.bar.id }">
				<div class="control-group">
					<label class="control-label">商品名：</label>
					<div class="controls">
					  <input type="text" id="proname" name="name">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">价格：</label>
					<div class="controls">
					  <input class="span1" type="text" id="proprice" name="price">&nbsp;&nbsp;元
					</div>
				</div>				
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button id="edite" class="btn btn-primary">保存</button>
		</div>
	</div>
	<script type="text/javascript">
		
		
		$("#add").click(function() {
			$("#newproduce").submit();
		});
	
	 	$(".editbtn").click(function() {
	 		var name = $(this).parent().siblings(".producename").text();
	 		var id = $(this).attr("rel");
	 		var price = $(this).parent().siblings(".produceprice").text();
	 		$("#proid").val(id);
			$("#proname").val(name);
			$("#proprice").val(price);
	 	});
	 	
		$("#edite").click(function() {
			$("#editeproduce").submit();
		});
		
		$(".delbtn").click(function() {
			var del = confirm("确定要删除吗？");
			if (del != true) {
				return false;
			}
		});		
	</script>
</body>
</html>