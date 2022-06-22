<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/6/5
  Time: 13:20
  Description:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
        %>
        <title>后台登录</title>
        <link rel="stylesheet" href="<%=path%>/css/adminLogin.css">
        <script src="<%=path%>/js/juqery/juqery.js"> </script>
    </head>
    <body>
        <p>天天淘商城后台登录</p>
        <div class="middle">
            <div class="img">
                <img src="<%=path%>/img/logo.png" alt="">
            </div>
            <div class="container">
                <h1>后台登录</h1>
                <form action="<%=path%>/AdminServlet" method="post">
                    <input type="text" class="tbx" placeholder="账号" name="aid">
                    <input type="password" class="tbx" placeholder="密码" name="apassword">
                    <input type="submit" class="sub" value="登录">
                </form>
            </div>
        </div>
    </body>
    <script>
        const con = document.querySelector(".container");
        let isIn = true;
        let isOut = false;
        let span;
        // 事件
        con.addEventListener('mouseenter', (e) => {
            if (isIn) {
                //元素位置
                let inX = e.clientX - e.target.offsetLeft;
                let inY = e.clientY - e.target.offsetTop;
                let el = document.createElement('span');
                el.style.left = inX + "px";
                el.style.top = inY + "px";
                con.appendChild(el);
                $('.container span').removeClass('out');
                $('.container span').addClass('in');
                span = document.querySelector('.container span');
                isIn = false;
                isOut = true;
            }
        })
        con.addEventListener('mouseleave', (e) => {
            if (isOut) {
                //元素位置
                let outX = e.clientX - e.target.offsetLeft;
                let outY = e.clientY - e.target.offsetTop;
                $('.container span').removeClass('in');
                $('.container span').addClass('out');
                $('.out').css('left', outX + 'px');
                $('.out').css('top', outY + 'px');
                isOut = false;
                setTimeout(() => {
                    con.removeChild(span);
                    isIn = true;
                }, 150)
            }
        })
    </script>
</html>
