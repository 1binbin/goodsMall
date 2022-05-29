<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/29
  Time: 10:39
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            List<GoodsModel> eidList = Daofactory.getgoodsdaoimpl().getdEid();
        %>
        <title>购物车</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="<%=path%>/js/goodsCart.js"></script>
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
        <%--    LOGO图+搜索框+购物车--%>
        <div class="search" id="search">
            <div class="logo">
                <span>全部商品</span>
                <span>40</span>
            </div>
            <form action="" method="get">
                <input type="text" placeholder="搜索内容">
                <div class="button" onclick="selectSearch()"><i class="fa fa-search" aria-hidden="true"
                                                                id="btnaa"></i></div>
            </form>
        </div>
        <%--        中间--%>
        <div class="middle">
            <input type="checkbox" id="allChecked" onclick="allChecked(this,'employee','goods','allGoods')">
            <label for="allChecked">全选</label>
            <div class="a">商品</div>
            <div class="b">单价</div>
            <div class="c">数量</div>
            <div class="d">小计</div>
            <div class="e">操作</div>
        </div>
        <%--        购物车主体--%>
        <div class="cartBody">
            <%
                for (int i = 0; i < 10; i++) {
            %>
            <div class="cart">
                <div class="cart-top">
                    <input type="checkbox" id="checked<%=i%>" onclick="isChecked1(this,'goods<%=i%>','goodsChecked<%=i%>')" class="employee">
                    <label for="checked<%=i%>">商家1</label>
                    <div class="cart-goods" >
                        <%
                            for (int j = 0; j < 2; j++) {
                                String num = i + (j + "");
                        %>
                        <div class="goods goods<%=i%>" id="goods<%=num%>">
                            <input type="checkbox" id="checkedGoods" class="goodsChecked<%=i%> allGoods" onclick="isChecked(this,'goods<%=num%>','checked<%=i%>')">
                            <div class="goods-img">
                                <img src="<%=path%>/img/1.jpg" alt="">
                            </div>
                            <span class="text">诶去未逾期未我千千万为哦EQUI噢权威去问为哦UI偶尔去问为哦诶我去额为武器噢完全</span>
                            <span class="price">￥23.9</span>
                            <div class="goods-num">
                                <button onclick="downnum('num<%=num%>')">-</button>
                                <input type="text" min="1" value="1" id="num<%=num%>" disabled="disabled">
                                <button onclick="upnum('num<%=num%>')">+</button>
                            </div>
                            <span class="allprice">￥23.9</span>
                            <a href="" class="delete">删除</a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%--        提交订单--%>
        <div class="white"></div>
        <div class="buttom">
            <div class="content">
                <div class="left">
                    <input type="checkbox" id="allChecked2"  onclick="allChecked(this,'employee','goods','allGoods')">
                    <label for="allChecked2">全选</label>
                    <a href="" class="deleteCheck">删除选中的商品</a>
                    <a href="" class="deleteCheckAll">清空购物车</a>
                </div>
                <div class="right">
                    <span>总价</span>
                    <span>￥23.9</span>
                    <div class="settlement">
                        <span>结算</span>
                    </div>
                </div>
            </div>
        </div>
        <%--        返回顶部--%>
        <div class="rightnav2" id="nav2">
            <ul>
                <li>
                    <a href="#">
                        <span><i class="fa fa-angle-up" aria-hidden="true"></i></span>
                        <span>顶部</span>
                    </a>
                </li>
            </ul>
        </div>
    </body>
    <script>

    </script>
</html>
