<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/29
  Time: 16:14
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            List<GoodsModel> eidList = Daofactory.getgoodsdaoimpl().getdEid();
        %>
        <title>天天淘-结算页</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link rel="stylesheet" href="<%=path%>/css/order.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="top">
            <span>51商城欢迎您</span>
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
        <div class="progress">
            <div class="p-left">
                <span>天天淘-结算页</span>
            </div>
            <div class="p-right">
                <div class="circle">1</div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="circle">2</div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="circle">3</div>
            </div>
        </div>
    </body>
</html>
