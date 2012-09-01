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
            <table>
                <tr>
                    <td style="width:60%"><img src="${basePath }/static/img/billiards.png" width="64px" height="64px" alt="用户" /></td>
                    <td>
                        球吧名称</br>
                        用户名</br>
                        角色</br>
                    </td>
                </tr>
            </table>
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
                    <a href="#"> 
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
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/on.png" alt="" />
                        <div class="caption">
                            <table>
                                <tr>
                                    <td style="width:70%">
                                        <button class="btn btn-primary">开台</button>&nbsp;&nbsp;
                                        <button class="btn btn-success">结账</button>
                                        <br/><br/>
                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
                                        <button class="btn btn-danger">购物</button>
                                    </td>
                                    <td>开始时间</td>
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/on.png" alt="" />
                        <div class="caption">
                            <table>
                                <tr>
                                    <td style="width:70%">
                                        <button class="btn btn-primary">开台</button>&nbsp;&nbsp;
                                        <button class="btn btn-success">结账</button>
                                        <br/><br/>
                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
                                        <button class="btn btn-danger">购物</button>
                                    </td>
                                    <td>开始时间</td>
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/off.png" alt="" />
                        <div class="caption">
                            <table>
                                <tr>
                                    <td style="width:70%">
                                        <button class="btn btn-primary">开台</button>&nbsp;&nbsp;
                                        <button class="btn btn-success">结账</button>
                                        <br/><br/>
                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
                                        <button class="btn btn-danger">购物</button>
                                    </td>
                                    <td>开始时间</td>
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/off.png" alt="" />
                        <div class="caption">
                            <table>
                                <tr>
                                    <td style="width:70%">
                                        <button class="btn btn-primary">开台</button>&nbsp;&nbsp;
                                        <button class="btn btn-success">结账</button>
                                        <br/><br/>
                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
                                        <button class="btn btn-danger">购物</button>
                                    </td>
                                    <td>开始时间</td>
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
                <li class="span3">
                    <div class="thumbnail">
                        <img src="${basePath }/static/img/on.png" alt="" />
                        <div class="caption">
                            <table>
                                <tr>
                                    <td style="width:70%">
                                        <button class="btn btn-primary">开台</button>&nbsp;&nbsp;
                                        <button class="btn btn-success">结账</button>
                                        <br/><br/>
                                        <button class="btn btn-info">换台</button>&nbsp;&nbsp;
                                        <button class="btn btn-danger">购物</button>
                                    </td>
                                    <td>开始时间</td>
                                </tr>
                                <tr>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
