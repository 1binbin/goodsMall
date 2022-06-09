<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/8
  Time: 20:51
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        String base = request.getContextPath();
        String username = (String) request.getSession().getAttribute("username");
        String eid = username.substring(0,username.length()-5);
        request.getSession().setAttribute("eid",eid);
    %>
    <head>
        <title>商家正在登录</title>
        <link rel="stylesheet" href="<%=base%>/css/merchantswait.css">
    </head>
    <script>
        function jump() {
            window.location.href = "<%=base%>/jsp/merchants/merchants.jsp";
        }
        setTimeout(jump, 3000);
    </script>
    <body>
        <div class="loading">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </body>
</html>
