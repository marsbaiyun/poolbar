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
            <ul class="nav nav-list well">
                <li class="nav-header">账目管理</li>
                <li class="active">
                    <a href="#">
                        <i class="icon-white icon-time"></i>
                        球台管理
                    </a>
                </li>
                <li>
                    <a href="#"> 
                        <i class="icon-user"></i>
                        会员管理
                    </a>
                </li>
                <li>
                    <a href="${basePath }/produce/list"> 
                        <i class="icon-barcode"></i>
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
                    <a href="${basePath }/account/inf">
                        <i class=" icon-eye-open"></i> 
                        个人资料
                    </a>
                </li>
                <li>
                    <a href="${basePath }/account/changepwd">
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
            <ul class="thumbnails">
                <c:forEach items="${deskList }" var="desk">
	                <li class="span3">
	                    <div class="thumbnail">
	                    	<c:choose>
	                    		<c:when test="${empty desk.order }">
	                    			<img class="imgDiv" src="${basePath }/static/img/off.png" alt="" />
	                    		</c:when>
	                    		<c:otherwise>
	                    			<img class="imgDiv" src="${basePath }/static/img/on.png" alt="" />
	                    		</c:otherwise>
	                    	</c:choose>
	                        <div class="caption">
	                            <table>
	                                <tr>
	                                    <td style="width:170px">
	                                    	<input type="hidden" value="${desk.id }" />
	                                    	<button class="btn btn-primary open">开台</button>&nbsp;&nbsp;
	                                        <button class="btn btn-success checkout">结账</button>
	                                        <br/><br/>
	                                        <a href="#changeDesk" data-toggle="modal" class="btn btn-info change">换台</a>&nbsp;&nbsp;
	                                        <a href="#shopSome" data-toggle="modal" class="btn btn-danger shop">购物</a>
	                                    </td>
	                                    <td class="info" style="width:66px">
	                                    	${desk.id }号台<br/><br/>
	                                    	<div class="startTime">
		                                    	<c:if test="${not (empty desk.order) }">
			                                    	${fn:substring(desk.order.starttime, 11, fn:length(desk.order.starttime)) }
					                    		</c:if>
	                                    	</div><br/>
	                                    	<div class="price">${desk.price }元/时</div>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
	<form action="${basePath }/consume/change" method="post" class="form-horizontal">
	    <div class="modal hide fade in" id="changeDesk">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">换台</h3>
			</div>
			<div class="modal-body">
				<input type="hidden" id="barid" name="barid" value="${account.bar.id }">
				<input type="hidden" id="deskid" name="id" />
				<div class="control-group">
					<label class="control-label">请选择台号</label>
					<div class="controls">
						<select id="select" name="deskid">
							<option>--请选择台号--</option>
						</select>
					</div>
				</div>		
			</div>
			<div class="modal-footer">
				<button type="submit" id="changeBtn" class="btn btn-primary">确定</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</form>
	<form action="${basePath }/consume/shop" method="post" class="form-horizontal">
	    <div class="modal hide fade in" id="shopSome">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">购买商品</h3>
			</div>
			<div class="modal-body">
				<input type="hidden" id="barid" name="barid" value="${account.bar.id }">
				<input type="hidden" id="deskid2" name="id" />
				<div class="control-group">
					<label class="control-label">请选择商品</label>
					<div class="controls">
						<select id="produceList" name="produceid" class="span4">
							<option>--请选择商品--</option>
						</select>
					</div>
				</div>
				<div class="control-group" id="proNum">
					<label class="control-label">数量</label>
					<div class="controls">
						<input type="text" class="span3" name="num" />
					</div>
				</div>	
			</div>
			<div class="modal-footer">
				<button type="submit" id="shopBtn" class="btn btn-primary">购买</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src=""></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$(".open").click(function() {
    			var img = $(this).parent().parent().parent().parent().parent().siblings(".imgDiv").attr("src");
    			var imgStr = img.substring(img.lastIndexOf("/") + 1, img.length);
				if (imgStr == "on.png") {
					return;
				} else {
	    			var id = $(this).siblings("input").val();
	    			var btn = $(this);
	    			$.get("${basePath }/consume/open", {"deskId" : id}, function(result) {
	    				$(btn).parent().parent().parent().parent().parent().siblings(".imgDiv").attr("src","http://localhost/poolbar/static/img/on.png");
	    				var time = result.order.starttime;
	    				$(btn).parent().siblings(".info").children(".startTime").text(time.substring(11, time.length));
	    			});
				}
    		});
    		$(".change").click(function() {
    			var img = $(this).parent().parent().parent().parent().parent().siblings(".imgDiv").attr("src");
    			var imgStr = img.substring(img.lastIndexOf("/") + 1, img.length);
				if (imgStr == "on.png") {
	    			var id = $(this).siblings("input").val();
	    			var priceStr = $(this).parent().siblings(".info").children(".price").text();
	    			var price = priceStr.substring(0, priceStr.lastIndexOf("."));
	    			var barid = ${account.bar.id };
	    			$.get("${basePath }/consume/findEmpty", {"id" : id, "price" : price, "barid" : barid}, function(result) {
	    				if (result.length == 0) {
	    					$("#select").empty();
	    					$("#select").append("<option>--暂时没有空球台--</option>");
	    					$("#changeBtn").hide();
	    				} else {
	    					$("#deskid").val(id);
							$("#select").empty();
							$("#select").append("<option>--请选择台号--</option>");
	    					$(result).each(function() {
								$("#select").append("<option value=" + this.id + ">" + this.id + "号台" + "</option>");
	    					});
	    					$("#changeBtn").show();
	    				}
	    			});
    			} else {
					$("#select").empty();
	    			$("#select").append("<option>--该球台没有开始，不能换台--</option>");
	    			$("#changeBtn").hide();
    			}
    		});
    		$(".shop").click(function() {
    			var img = $(this).parent().parent().parent().parent().parent().siblings(".imgDiv").attr("src");
    			var imgStr = img.substring(img.lastIndexOf("/") + 1, img.length);
				if (imgStr == "on.png") {
					var barid = ${account.bar.id };
					var id = $(this).siblings("input").val();
					$.get("${basePath }/consume/getPro", {"barid" : barid}, function(result) {
						if (result.length == 0) {
							$("#produceList").empty();
			    			$("#produceList").append("<option>--球吧内暂时没有商品，请稍后--</option>");
			    			$("#shopBtn").hide();
			    			$("#proNum").hide();
						} else {
							$("#deskid2").val(id);
							$("#produceList").empty();
							$("#produceList").append("<option>--请选择商品--</option>");
	    					$(result).each(function() {
								$("#produceList").append("<option value=" + this.id + ">" + this.name + "  (" + this.price + "元)</option>");
	    					});
	    					$("#shopBtn").show();
	    					$("#proNum").show();
						}
					});
				} else {
					$("#produceList").empty();
	    			$("#produceList").append("<option>--该球台没有开始，不能购买商品--</option>");
	    			$("#shopBtn").hide();
	    			$("#proNum").hide();
				}
    		});
    		$(".checkout").click(function() {
    			var img = $(this).parent().parent().parent().parent().parent().siblings(".imgDiv").attr("src");
    			var imgStr = img.substring(img.lastIndexOf("/") + 1, img.length);
				if (imgStr == "on.png") {
					var barid = ${account.bar.id };
					var id = $(this).siblings("input").val();
					window.location.href = "${basePath }/consume/checkout?id=" + id + "&barid=" + barid;
				} else {
					alert("还没有开台，不能结账！");
				}
    		});
    	});
    </script>
</body>
</html>
