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
          <ul class="thumbnails">
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.0.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=default" rel="bootstrap.0.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.1.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=1" rel="bootstrap.1.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.2.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=2" rel="bootstrap.2.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.3.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=3" rel="bootstrap.3.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.4.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=4" rel="bootstrap.4.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.5.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=5" rel="bootstrap.5.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.6.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=6" rel="bootstrap.6.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.7.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=7" rel="bootstrap.7.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.8.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=8" rel="bootstrap.8.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.9.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=9" rel="bootstrap.9.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/bootstrap.10.png" alt="" />
                        <div class="caption">
                            <a href="${basePath }/account/theme?css=10" rel="bootstrap.10.css" class="btn btn-info">使用</a>
                        </div>
                    </div>
                </li>
            </ul>
		</div>
	</div>	
</body>
</html>