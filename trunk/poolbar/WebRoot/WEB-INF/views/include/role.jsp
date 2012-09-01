<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/base.jsp" %>
<table>
    <tr>
        <td style="width:60%"><img src="${basePath }/static/img/billiards.png" width="64px" height="64px" alt="用户" /></td>
        <td>
            ${account.bar.name }</br>
            ${account.name }</br>
            ${account.role }</br>
        </td>
    </tr>
</table>
