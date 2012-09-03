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
            <ul class="nav nav-list well">
                <li class="nav-header">账目管理</li>
                <li>
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
                <li class="active">
                    <a href="${basePath }/bar/main">
                        <i class="icon-adjust"></i>
                        球吧管理
                    </a>
                </li>
            </ul>
        </div>
        <div class="span9 pull-right" style="margin-right:30px">
		<ul class="nav nav-tabs" id="myTab">
            <li class="active"><a data-toggle="tab" href="#home">球吧概览</a></li>
            <li class=""><a data-toggle="tab" href="#profile">Profile</a></li>
            <li class="dropdown">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a data-toggle="tab" href="#dropdown1">@fat</a></li>
                <li><a data-toggle="tab" href="#dropdown2">@mdo</a></li>
              </ul>
            </li>
          </ul>        

		<div class="tab-content" id="myTabContent">
            <div id="home" class="tab-pane fade active in">
              
            </div>
            <div id="profile" class="tab-pane fade">
              <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
            </div>
            <div id="dropdown1" class="tab-pane fade">
              <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
            </div>
            <div id="dropdown2" class="tab-pane fade">
              <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
            </div>
          </div>
				

        
			

        </div>
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		
    	});
    </script>
</body>
</html>
