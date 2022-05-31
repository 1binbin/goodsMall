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
            <span><a href="<%=path%>/jsp/user.jsp"><i class="fa fa-angle-double-left"
                                                      aria-hidden="true"></i>返回首页</a></span>
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
            <div class="left">
                <div class="img"><img src="<%=path%>/img/1.jpg" alt=""></div>
                <span>天天淘-我的订单</span>
            </div>
            <div class="right">
                <div class="search" id="search">
                    <form action="" method="get">
                        <input type="text" placeholder="搜索内容">
                        <div class="button" onclick="getSelect()"><i class="fa fa-search" aria-hidden="true"
                                                                     id="btnaa"></i></div>
                    </form>
                    <div class="cart" onclick="window.open('<%=path%>/jsp/goodsCart.jsp')">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <span>购物车</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="m-bottom-one">
            <span>我的订单</span>
        </div>
        <div class="m-bottom-second">
            <div class="time">
                <span>时间筛选</span>
                <select name="" id="">
                    <option>一个月内</option>
                    <option>三个月内</option>
                    <option>半年内</option>
                </select>
            </div>
            <div class="shouhuSelect">
                <ul class="oneUl">
                    <li>
                        <input type="radio" id="one" name="shouhu" checked>
                        <label for="one"><i class="iconfont">&#xe784;</i></label>
                        <span>全部订单</span>
                    </li>
                    <li>
                        <input type="radio" id="two" name="shouhu">
                        <label for="two"><i class="iconfont">&#xe683;</i></label>
                        <span>已收货</span>
                    </li>
                    <li>
                        <input type="radio" id="three" name="shouhu">
                        <label for="three"><i class="iconfont">&#xe650;</i></label>
                        <span>未收货</span>
                    </li>
                    <li>
                        <input type="radio" id="four" name="shouhu">
                        <label for="four"><i class="iconfont">&#xe61f;</i></label>
                        <span>未付款</span>
                    </li>
                </ul>
            </div>
            <div class="line"></div>
        </div>
        <div class="allOrder"></div>
        <div class="haveOrder"></div>
        <div class="notOrder"></div>
        <div class="notPayOrder"></div>
    </body>
</html>
