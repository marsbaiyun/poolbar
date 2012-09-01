<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/base.jsp" %>
<!DOCTYPE HTML>
<html>
<head>

	<title>台球连锁计费系统</title>
	<%@ include file="include/head.jsp" %>
	<style type="text/css">
		h2 {
			color:red;
		}
	</style>
</head>
<body>
	<jsp:include page="include/top.jsp">
		<jsp:param value="deal" name="tag"/>
	</jsp:include>
    <div id="content" class="container">
        <div class="span3">
            <table>
                <tr>
                    <td style="width:60%"><img src="img/billiards.png" width="64px" height="64px" alt="用户" /></td>
                    <td>
                        ${sessionScope.account.bar.name }
                        </br>
                        ${sessionScope.account.name }
                        </br>
                        ${sessionScope.account.role }
                        </br>
                    </td>
                </tr>
            </table>
            <ul class="nav nav-list well">
                <li class="nav-header">账目管理</li>
                <li class="active">
                    <a href="desk">
                        <i class="icon-white icon-time"></i>
                        球台管理
                    </a>
                </li>
                <li>
                    <a href="vip"> 
                        <i class="icon-user"></i>
                        会员管理
                    </a>
                </li>
                <li>
                    <a href="produce"> 
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
                    <a href="#">
                        <i class=" icon-eye-open"></i> 
                        个人资料
                    </a>
                </li>
                <li>
                    <a href="#">
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
            		<c:forEach items="${orderList }" var="order">
            			<c:if test="${desk.id == order.desk.id }">
		                <li class="span3">
		                    <div class="thumbnail">
			                        <img src="img/on.png" alt="" />
			                        <div class="caption">
			                            <table>
			                                <tr>
			                                    <td style="width:70%">
			                                    	
			                                        <button class="btn btn-primary">开台</button>&nbsp;&nbsp;
			                                       <!--  <button class="btn btn-success">结账</button>
			                                        <br/><br/>
			                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
			                                        <button class="btn btn-danger">购物</button> -->
			                                    </td>
			                                    <td>
													<h2>${desk.id }号</h2>
													开始时间
												</td>
			                                </tr>
			                                <tr>
			                                   <td>&nbsp;<input type="hidden" name="desk.id" value="${desk.id }"/>
			                                   </td> 
			                                </tr>
			                            </table>
			                        </div>		
			                        
			                        
			                        
			                        	                        
		                    	<c:if test="${order.starttime != null }">
			                        <img src="img/on.png" alt="" />
			                        <div class="caption">
			                            <table>
			                                <tr>
			                                    <td style="width:70%">
			                                    	
			                                        <!-- <button class="btn btn-primary">开台</button>&nbsp;&nbsp; -->
			                                        <button class="btn btn-success">结账</button>
			                                        <br/><br/>
			                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
			                                        <button class="btn btn-danger">购物</button>
			                                    </td>
			                                    <td>
													<h2>${desk.id }号</h2>
													${order.starttime }
												</td>
			                                </tr>
			                                <tr>
			                                   <td>&nbsp;<input type="hidden" name="desk.id" value="${desk.id }"/>
			                                   </td> 
			                                </tr>
			                            </table>
			                        </div>			                        
		                    	</c:if>

		                    </div>
		                </li>
		                </c:if>
	                </c:forEach>
                </c:forEach>
                
            </ul>
        </div>
    </div>
</body>
</html>