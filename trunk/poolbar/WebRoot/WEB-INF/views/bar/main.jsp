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
        </div>
        <div class="span9 pull-right" style="margin-right:30px">
            <ul class="breadcrumb">
                <li class="active">球桌管理</li>
                <li class="pull-right"><a href="#myModal" data-toggle="modal">添加球桌</a></li>				
            </ul>      

		<div class="tab-content" id="myTabContent">
			<table class="table table-bordered">
                <thead>
                    <tr>
                        <th>球台号</th>
                        <th>价格（单位：元/小时）</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${desklist}" var="desk">
	                    <tr>
	                        <td class="deskid">${desk.id }</td>
	                        <td class="deskprice">${desk.price}</td>
	                        <td>
	                            <a href="#editModal" class="editbtn" rel="${desk.id }" data-toggle="modal">修改</a>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
   </div>

	<div class="modal hide fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">球桌添加</h3>
		</div>
		<div class="modal-body">
			<form id="newdesk" action="save" method="post" class="form-horizontal">
				<input type="hidden" id="barid" name="barid" value="${account.bar.id }">
				<div id="deskiddiv" class="control-group">
					<label class="control-label">球桌号：</label>
					<div class="controls">
					  <input id="deskid" type="text"  name="id">
					  <p class="help-inline">球桌号需为纯数字 </p>
	  				  <span class="help-block" id="msg"></span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">价格：</label>
					<div class="controls">
					  <input class="span1" type="text"  name="price">&nbsp;&nbsp;元/小时
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
			<h3 id="myModalLabel">球桌修改</h3>
		</div>
		<div class="modal-body">
			<form id="editedesk" action="update" method="post" class="form-horizontal">
				<input type="hidden" id="deskidhidden" name="id" value="">
				<div class="control-group">
					<label class="control-label">球桌号：</label>
					<div class="controls">
						<span id="deskidedite" class="input-xlarge uneditable-input"></span>
					</div>					
				</div>
				<div class="control-group">
					<label class="control-label">价格：</label>
					<div class="controls">
					  <input class="span1" type="text" id="deskprice" name="price">&nbsp;&nbsp;元/小时
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
    	$(document).ready(function() {
    		$("#deskid").blur(function () {
	    		var deskid = $(this).val();
	    		if (deskid == parseInt(deskid)) {
		    		$.post("${basePath}/bar/checkdeskid",{"deskid":deskid},function (result) {
		    			if (result.id != undefined) {
			                $("#msg").html("该球桌名已存在！");
		                    $("#deskiddiv").addClass("error");
		    			}
		    		});
	    		} else {
	                $("#msg").html("您输入的球桌号不符合要求！");
	                $("#deskiddiv").addClass("error");
	   				} 
	    	});  
	    	
	    	$("#deskid").focus(function () {
	    		$("#deskiddiv").removeClass("error");
	    		$("#msg").html("");
	    	});
	    	  	
	    	$("#add").click(function () {
	    		$("#deskid").blur();
	    		var msg = $("#msg").html();
	    		if (msg == "") {
	    			$("#newdesk").submit();
	    		} else {
	    			return false;
	    		}
	    	});
		
		 	$(".editbtn").click(function() {
		 		var deskid = $(this).parent().siblings(".deskid").text();
		 		var price = $(this).parent().siblings(".deskprice").text();
		 		$("#deskidhidden").val(deskid);
		 		$("#deskidedite").html(deskid);
				$("#deskprice").val(price);
		 	});
		 	
			$("#edite").click(function() {
				$("#editedesk").submit();
			});   		
    	});
    </script>
</body>
</html>
