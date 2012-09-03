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
			<c:if test="${param.code == '001' }">
				<div class="alert alert-success">
					<button class="close" data-dismiss="alert">×</button>
					<strong>修改成功！</strong>
				</div>
			</c:if>
			<form id="accountinf" class="form-horizontal" action="${basePath}/account/edite" method="post">
				<fieldset>
					<div id="namediv" class="control-group">
						<label class="control-label" for="focusedInput">用户名：</label>
						<div class="controls">
							<input id="accountname" class="input-xlarge focused" type="text" name="name" value="${account.name }">
							<span class="help-block" id="span1"></span>
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
						<button class="btn btn-primary" id="edite">修改</button>
						<button class="btn" onclick="location.back()">返回</button>
					</div>								
				</fieldset>
			</form>

        </div>
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		var oldname = $("#accountname").val();
    		$("#accountname").blur(function () {
	    		var newname = $(this).val();
	    		if (newname != oldname) {
		    		$.post("${basePath}/account/checkname",{"newname":newname},function (result) {
		    			if (result.id != undefined) {
			                $("#span1").html("该用户名已存在！");
		                    $("#namediv").addClass("error");
		    			} else {
			                $("#span1").html("该用户名可以使用！");
			                $("#namediv").removeClass("error");
		    			}
		    			
		    		});
	    		} 
	    	});
	    	
	    	$("#accountname").focus(function () {
	    		$("#namediv").removeClass("error");
	    		$("#span1").html("");
	    	});
	    	
	    	$("#edite").click(function () {
	    		$("#accountname").blur();
	    		var msg = $("#span1").html();
	    		if (msg != "该用户名已存在！") {
	    			$("#accountinf").submit();
	    		} else {
	    			return false;
	    		}
	    	});
    	});
    </script>
</body>
</html>
