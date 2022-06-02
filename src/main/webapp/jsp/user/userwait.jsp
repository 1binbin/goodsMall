<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/8
  Time: 20:52
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String base = request.getContextPath();
            String username = (String) request.getSession().getAttribute("username");
            String cid = username.substring(0,username.length()-4);
            request.getSession().setAttribute("cid",cid);
        %>
        <title>用户正在登录</title>
        <link rel="stylesheet" href="<%=base%>/css/wait.css">
    </head>
    <script>
        function jump(){
            window.location.href="<%=base%>/jsp/user/user.jsp";
        }
        setTimeout(jump,3000);
    </script>
    <body>
        <div class="loading">
            <span>正在登录中······</span>
        </div>
    </body>
</html>
