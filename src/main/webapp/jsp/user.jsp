<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/8
  Time: 11:25
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
        %>
        <title>51商城</title>
        <link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
    </head>
    <body>
        <%--        顶部--%>
        <div class="cover">
            <div class="top">
                <span>51商城欢迎您</span>
                <div class="top-right">
                    <ul>
                        <li>
                            <a href="#">你好，请登录或注册</a>
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
            <%--    LOGO图+搜索框+购物车--%>
            <div class="search">
                <div class="logo"><img src="<%=path%>/img/1.jpg" alt="" width="100px"></div>
                <form action="" method="get">
                    <input type="text" placeholder="搜索内容" >
                    <div class="button" onclick="selectSearch()"><i class="fa fa-search" aria-hidden="true"
                                                                    id="btnaa"></i></div>
                </form>
                <div class="cart">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    <span>购物车</span>
                </div>
            </div>
        </div>
        <%--        商品分类+轮播图+baner图--%>
        <div class="middle"></div>
        <%--        推荐商品--%>
        <div class="content"></div>
        <%--        底部信息--%>
        <div class="foot"></div>
    </body>
</html>
