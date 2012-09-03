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
       		<h3>台球计时</h3><br/>
       		
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
			<c:set value="0" var="sum"></c:set>
			<c:if test="${consumeList.size() != 0 }">
				<h3>购买的商品</h3><br/>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>商品名</th>
							<th>数量</th>
							<th>单价</th>
							<th>总价</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${consumeList }" var="consume">
							<tr>
								<td>${consume.produce.name }</td>
								<td>${consume.num }</td>
								<td>${consume.produce.price }</td>
								<td>${consume.produce.price * consume.num }元</td>
							</tr>
							<c:set value="${sum + consume.produce.price * consume.num }" var="sum"></c:set>
						</c:forEach>
						<tr><td colspan="4">商品总价：${sum }元</td></tr>
					</tbody>
				</table>
			</c:if>
			<h3>总价</h3><br/>
        	<table class="table table-bordered">
				<thead>
					<tr>
						<th>台球费</th>
						<th>商品费</th>
						<th>总费用</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${order.total }元</td>
						<td>${sum }元</td>
						<td>${order.total + sum }元</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<a href="#checkout" data-toggle="modal" class="btn btn-primary checkout">结账</a>
			<a href="${basePath }/consume" class="btn">返回</a>
        </div>
    </div>
    <form action="${basePath }/consume/checkout" method="post" class="form-horizontal">
	    <div class="modal hide fade in" id="checkout">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">结账</h3>
			</div>
			<div class="modal-body">
				<input type="hidden" value="${order.id }" name="id"/>
				<input type="hidden" value="${order.endtime }" name="endtime"/>
				<div class="control-group">
					<label class="control-label">台球费</label>
					<div class="controls">
						<input type="text" id="orderTotal" readonly="readonly" value="${order.total }" />
					</div>
				</div>	
				<div class="control-group">
					<label class="control-label">商品费</label>
					<div class="controls">
						<input type="text" readonly="readonly" value="${sum }" />
					</div>
				</div>	
				<div class="control-group">
					<label class="control-label">总费用</label>
					<div class="controls">
						<input type="text" readonly="readonly" name="total" id="sum" value="${sum + order.total }" />
					</div>
				</div>		
				<div class="control-group">
					<label class="control-label">结账方式</label>
					<div class="controls">
						<select id="select" name="select">
							<option value="1">散客</option>
							<option value="2">会员</option>
						</select>
					</div>
				</div>
				<div id="vipDiv" style="display:none" class="control-group">
					<label class="control-label">请输入卡号</label>
					<div class="controls">
						<input type="text" placeholder="输入会员ID" class="span3" name="vipid" id="vipId" />
						<span class="help-inline" id=vipSpan></span>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" id="changeBtn" class="btn btn-primary">确定</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#select").change(function() {
				if (this.value == 1) {
					$("#vipDiv").hide();
					$("#orderTotal").val(${order.total });
					$("#sum").val(${sum } + ${order.total });
					
				} else {
					$("#vipDiv").show();
				}
			});
			$("#vipId").blur(function() {
				var vipId = $(this).val();
				$.get("${basePath }/consume/checkVip", {"id" : vipId}, function(result) {
					if (result.id != undefined) {
						$("#vipDiv").removeClass("error");
						$("#vipDiv").addClass("success");
						$("#vipSpan").text("卡号正确");
						var orderTotal = Math.ceil(${order.total} * result.discount);
						$("#orderTotal").val(orderTotal);
						var sum = orderTotal + ${sum };
						$("#sum").val(sum);
					} else {
						$("#vipDiv").removeClass("success");
						$("#vipDiv").addClass("error");
						$("#vipSpan").text("卡号错误");
					}
				});
			});
			$("#vipId").focus(function() {
				$("#vipDiv").removeClass("error");
				$("#vipSpan").text("");
			});
		});
	</script>
</body>
</html>