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
                <li class="active">会员管理 / 添加会员</li>
            </ul>
			<form id="myform" class="form-horizontal" action="${basePath }/vip/new" method="post" style="margin-top:30px;border:1px solid #ddd;padding-top:20px;">
				<div class="control-group" id="nameDiv">
					<label class="control-label" >姓名：</label>
					<div class="controls">
					  <input type="text" name="name" id="name">
					</div>
				</div>
				<div class="control-group" id="passwordDiv">
					<label class="control-label">密码：</label>
					<div class="controls">
					  <input type="password" name="password" id="password">
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
						 <input value="添加" type="button" id="btn" class="btn btn-primary">
						 <a href="${basePath }/vip/list" class="btn">返回</a>
					</div>
				</div>
			</form>
        </div>
    </div>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$("#name").blur(function() {
    			if($(this).val() == ""){
    				$("#nameDiv").addClass("error");
    			}
    		});
    		$("#name").focus(function() {
    			$("#nameDiv").removeClass("error");
    		});

    		$("#password").blur(function() {
    			if($(this).val() == ""){
    				$("#passwordDiv").addClass("error");
    			}
    		});
    		$("#password").focus(function() {
    			$("#passwordDiv").removeClass("error");
    		});
    		
    		$("#btn").click(function() {
    			if($("#name").val() == ""){
    				$("#nameDiv").addClass("error");
    			} else if($("#password").val() == "") {
    				$("#passwordDiv").addClass("error");
    			} else{
    				$("#myform").submit();
    			}
    		});
    	});
    </script>
</body>
</html>