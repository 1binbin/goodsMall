<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/31
  Time: 10:52
  Description:  我的订单
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
        %>
        <title>天天淘-我的订单</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/icon/iconfont.css">
        <link rel="stylesheet" href="<%=path%>/css/myOrder.css">
    </head>
    <body>
        <div class="top">
            <span><a href="<%=path%>/jsp/user.jsp"><i class="fa fa-angle-double-left" aria-hidden="true"></i>返回首页</a></span>
            <div class="top-right">
                <ul>
                    <li>
                        <a href="#">你好，请登录或注册</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="<%=path%>/jsp/index.jsp">商家登录</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="#">成为会员</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="#">我的订单</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="#">个人信息</a>
                    </li>
                </ul>
                <div class="img"><img src="<%=path%>/img/1.jpg" alt=""></div>
            </div>
        </div>
        <div class="m-middle">
            <i class="iconfont">&#xe61f;</i>
            <i class="iconfont">&#xe650;</i>
        </div>
    </body>
</html>
