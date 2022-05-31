<%@ page import="java.util.List" %>
<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %><%--
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
            List<GoodsModel> eidList = Daofactory.getgoodsdaoimpl().getdEid();
        %>
        <title>天天淘</title>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
        <script src="<%=path%>/js/user.js"></script>
    </head>
    <body>
        <%--顶部--%>
        <div class="top">
            <span>天天淘商城欢迎您</span>
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
            <%--    LOGO图+搜索框+购物车--%>
        </div>
        <div class="search" id="search">
            <div class="logo"><img src="<%=path%>/img/1.jpg" alt=""></div>
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
        <%--        商品分类+轮播图+baner图--%>
        <div class="middle">
            <div class="middle_left">
                <div class="span"><span>所有商品分类</span></div>
                <ul>
                    <li><a href="#">家用电器</a></li>
                    <li><a href="#">医药保健</a></li>
                    <li><a href="#">手机</a> / <a href="">运营商</a> / <a href="">数码</a></li>
                    <li><a href="#">电脑</a> / <a href="">办公</a></li>
                    <li><a href="#">家居</a> / <a href="#">家具</a> / <a href="#">家装</a> / <a href="#">厨具</a></li>
                    <li><a href="#">男装</a> / <a href="#">女装</a> / <a href="#">童装</a></li>
                    <li><a href="#">美妆</a> / <a href="#">个人清洁</a> / <a href="#">宠物</a></li>
                    <li><a href="#">女鞋</a> / <a href="#">箱包</a> / <a href="#">钟表</a> / <a href="#">珠宝</a></li>
                    <li><a href="#">男鞋</a> / <a href="#">运动</a> / <a href="#">户外</a></li>
                    <li><a href="#">房产</a> / <a href="#">汽车</a> / <a href="#">汽车用品</a></li>
                    <li><a href="#">母婴</a> / <a href="#">玩具乐器</a></li>
                    <li><a href="#">食品</a> / <a href="#">酒类</a> / <a href="#">生鲜</a> / <a href="#">特产</a></li>
                    <li><a href="#">艺术</a> / <a href="#">礼品鲜花</a> / <a href="#">农贸绿植</a></li>
                    <li><a href="#">图书</a> / <a href="#">文娱</a> / <a href="#">教育</a> / <a href="#">电子书</a></li>
                    <li><a href="#">安装</a> / <a href="#">维修</a> / <a href="#">清洗</a> / <a href="#">二手</a></li>
                </ul>
            </div>
            <div class="middle-middle" id="max">
                <div class="re" id="re">
                    <ul>
                        <%
                            for (int i = 1; i <= 8; i++) {
                        %>
                        <li><img src="<%=path%>/shuffling_img/<%=i%>.jpg" alt=""></li>
                        <%
                            }
                        %>
                    </ul>
                    <ol>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ol>
                </div>
            </div>
            <div class="middle-right">
                <span>今日特价</span>
            </div>
        </div>
        <%--        推荐商品--%>
        <div class="content" id="content">
            <span class="like">猜你喜欢</span>
            <ul class="like_ul">
                <%
                    if (!eidList.isEmpty()) {
                        for (GoodsModel goodsModel : eidList) {
                            List<GoodsModel> eidGoodsList = Daofactory.getgoodsdaoimpl().getdEidGoods(goodsModel.getEid());
                            for (GoodsModel model : eidGoodsList) {
                %>
                <li onclick="window.open('<%=path%>/jsp/goodsDetails.jsp')">
                    <div class="like_img"><img
                            src="<%=path%>/Product_main_photo/<%=goodsModel.getEid()%>/<%=model.getGid()%>.jpg" alt="">
                    </div>
                    <div class="like_span">
                        <p><%=model.getGdescribe()%>
                        </p>
                        <i class="fa fa-jpy" aria-hidden="true"></i>
                        <span class="mony"><%=model.getGprice()%></span></div>
                </li>
                <%
                            }
                        }
                    }
                %>
            </ul>
        </div>
        <%--        侧边导航栏--%>
        <div class="rightnav" id="nav">
            <ul>
                <li>
                    <a href="javascript:void(0)" onclick="like()">
                        <span>猜你喜欢</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span><i class="fa fa-commenting-o" aria-hidden="true"></i></span>
                        <span>客服</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                        <span>反馈</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span><i class="fa fa-line-chart" aria-hidden="true"></i></span>
                        <span>后台</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span><i class="fa fa-angle-up" aria-hidden="true"></i></span>
                        <span>顶部</span>
                    </a>
                </li>
            </ul>
        </div>
        <%--        底部信息--%>
        <div class="foot"></div>
    </body>
    <script>
        function getSelect() {
            window.location.href = "<%=path%>/jsp/showSelectGoods.jsp";
        }
    </script>
</html>
