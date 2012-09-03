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
                <li class="active">会员管理</li>           
                <li class="pull-right">
               		<a data-toggle="modal" href="#myModal">搜索</a>/
                	<a href="${basePath }/vip/new">添加会员</a>
               	</li>
            </ul>
 
           	<c:if test="${vipList.size() != 0 }">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>联系方式</th>
                        <th>余额</th>
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
                        <td>${vip.money }</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${vip.discount  eq '0.7'}">VIP3</c:when>
                        		<c:when test="${vip.discount  eq '0.8'}">VIP2</c:when>
								<c:otherwise>VIP1</c:otherwise>
                        	</c:choose>
                        </td>
                        <td>
                            <a href="${basePath }/vip/recharge?id=${vip.id}">充值</a>
                            <a href="${basePath }/vip/edit?id=${vip.id}">修改</a>
                            <a class="del" href="${basePath }/vip/del/${vip.id}">删除</a>
                        </td>
                    </tr>	
                	</c:forEach>        
                </tbody>
            </table>
            </c:if>
            <c:if test="${vipList.size() == 0 }">
               	未找到任何会员
            </c:if>
        </div>
        <div class="modal hide fade in" id="myModal">
		    <div class="modal-header">
			    <button class="close" data-dismiss="modal">×</button>
			    <h3>VIP 搜索</h3>
		    </div>
		    <div class="modal-body">
		   		<form class="form-horizontal" action="${basePath }/vip/find" method="post" id="myform">
				    <fieldset>
					    <div class="control-group" id="nameDiv">
						    <label class="control-label" for="input01">姓名</label>
						    <div class="controls">
						    	<input type="text" class="input-xlarge" name="name" id="name">
						    </div>
					    </div>
					    <div class="control-group" id="telDiv">
						    <label class="control-label" for="input01">联系方式</label>
						    <div class="controls">
						    	<input type="text" class="input-xlarge" name="tel" id="tel">
						    </div>
					    </div>
				    </fieldset>
			    </form>
		    </div>
		    <div class="modal-footer">
			    <a href="#" class="btn" data-dismiss="modal">关闭</a>
			    <a href="#" class="btn btn-primary" id="btn">搜索</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$(".del").click(function() {
    			var msg = "你真的要删除吗？";
    			if (!confirm(msg)){
					return false;	
				}
    		});
    		$("#name").focus(function() {
    			$("#nameDiv").removeClass("error");
    			$("#telDiv").removeClass("error");
    		});
    		$("#tel").focus(function() {
    			$("#nameDiv").removeClass("error");
    			$("#telDiv").removeClass("error");
    		});
    		$("#btn").click(function() {
    			if($("#name").val() == "" && $("#tel").val() ==  "") {
    				$("#nameDiv").addClass("error");
    				$("#telDiv").addClass("error");
    			} else {
	    			$("#myform").submit();
    			}
    		});
    	});
    </script>
</body>
</html>