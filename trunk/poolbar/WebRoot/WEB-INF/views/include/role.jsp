<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<table>
    <tr>
        <td style="width:60%"><img src="${basePath }/static/img/billiards.png" width="64px" height="64px" alt="用户" /></td>
        <td>
            ${account.bar.name }<br/>
            ${account.name }<br/>
            ${account.role }<br/>
        </td>
    </tr>
</table>
<ul class="nav nav-list well">
    <li class="nav-header">账目管理</li>
    <li id="deskLi">
        <a href="${basePath }/consume">
        <i id="desk" class="icon-time"></i>
              球台管理
         </a>
      </li>
      <li id="vipLi">
          <a href="${basePath }/vip"> 
              <i id="vip" class="icon-user"></i>
              会员管理
          </a>
      </li>
      <li id="produceLi">
          <a href="${basePath }/produce/list"> 
              <i id="produce" class="icon-barcode"></i>
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
  <script type="text/javascript">
    	$(document).ready(function() {
    		var url = window.location.href;
    		if(url.search("/desk") != -1){
    			$("#deskLi").addClass("active");
    			$("#desk").addClass("icon-white");
    		} else if (url.search("/vip") != -1){
    			$("#vipLi").addClass("active");
    			$("#vip").addClass("icon-white");
    		}else if (url.search("/produce") != -1){
    			$("#produceLi").addClass("active");
    			$("#produce").addClass("icon-white");
    		}
    	});
    </script>