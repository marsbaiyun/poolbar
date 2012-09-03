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
            <ul class="thumbnails">
                <c:forEach items="${deskList }" var="desk">
	                <li class="span3">
	                    <div class="thumbnail">
	                    	<c:choose>
	                    		<c:when test="${empty desk.order }">
	                    			<img src="${basePath }/static/img/off.png" alt="" />
	                    		</c:when>
	                    		<c:otherwise>
	                    			<img src="${basePath }/static/img/on.png" alt="" />
	                    		</c:otherwise>
	                    	</c:choose>
	                        <div class="caption">
	                            <table>
	                                <tr>
	                                    <td style="width:80%">
	                                        <a href="${basePath }/consume/open?deskId=${desk.id }" class="btn btn-primary">开台</a>&nbsp;&nbsp;
	                                        <button class="btn btn-success">结账</button>
	                                        <br/><br/>
	                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
	                                        <button class="btn btn-danger">购物</button>
	                                    </td>
	                                    <td>
	                                    	${desk.id }号台<br/><br/>
	                                    	<c:if test="${not (empty desk.order) }">
		                                    	${fn:substring(desk.order.starttime, 11, fn:length(desk.order.starttime)) }<br/><br/>
				                    		</c:if>
	                                    	${desk.price }
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
</body>
</html>
