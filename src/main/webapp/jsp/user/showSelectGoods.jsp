<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/28
  Time: 20:04
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            List<GoodsModel> eidList = Daofactory.getgoodsdaoimpl().getdEid();
        %>
        <title>天天淘</title>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
        <link rel="stylesheet" href="<%=path%>/css/showSelectGoods.css">
        <script src="<%=path%>/js/showSelectGoods.js"></script>
    </head>
    <body>
        <div class="top">
            <span><a href="<%=path%>/jsp/user/user.jsp"><i class="fa fa-angle-double-left" aria-hidden="true"></i>返回首页</a></span>
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
                        <a href="<%=path%>/jsp/user/members.jsp">成为会员</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="<%=path%>/jsp/user/myOrder.jsp">我的订单</a>
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
            <div class="logo"><img src="<%=path%>/img/1.jpg" alt=""></div>
            <form action="" method="get">
                <input type="text" placeholder="搜索内容">
                <div class="button" onclick="selectSearch()"><i class="fa fa-search" aria-hidden="true"
                                                                id="btnaa"></i></div>
            </form>
            <div class="cart" onclick="window.open('<%=path%>/jsp/user/goodsCart.jsp')">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                <span>购物车</span>
            </div>
        </div>
        <%--筛选--%>
        <div class="select">
            <span>全部结果></span>
            <div class="moreselect">
                <div class="up">
                    <div class="left">
                        <span>类别筛选</span>
                    </div>
                    <div class="right">
                        <ul>
                            <li>家用电器</li>
                            <li>手机</li>
                            <li>家居</li>
                            <li>男装</li>
                            <li>女装</li>
                            <li>男鞋</li>
                            <li>女鞋</li>
                            <li>食品</li>
                            <li>
                                <span>更多类别</span>
                                <div class="more-list">
                                    <ul>
                                        <li>医药保健</li>
                                        <li>个人清洁</li>
                                        <li>汽车用品</li>
                                        <li>玩具乐器</li>
                                        <li>礼品鲜花</li>
                                        <li>农贸绿植</li>
                                        <li>运营商</li>
                                        <li>数码</li>
                                        <li>电脑</li>
                                        <li>办公</li>
                                        <li>家具</li>
                                        <li>家装</li>
                                        <li>厨具</li>
                                        <li>童装</li>
                                        <li>美妆</li>
                                        <li>宠物</li>
                                        <li>箱包</li>
                                        <li>钟表</li>
                                        <li>珠宝</li>
                                        <li>运动</li>
                                        <li>户外</li>
                                        <li>房产</li>
                                        <li>汽车</li>
                                        <li>母婴</li>
                                        <li>酒类</li>
                                        <li>生鲜</li>
                                        <li>特产</li>
                                        <li>艺术</li>
                                        <li>图书</li>
                                        <li>文娱</li>
                                        <li>教育</li>
                                        <li>电子书</li>
                                        <li>安装</li>
                                        <li>维修</li>
                                        <li>清洗</li>
                                        <li>二手</li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="down">
                    <div class="left">
                        <span>高级筛选</span>
                    </div>
                    <div class="right">
                        <ul>
                            <li>综合排序</li>
                            <li>最新上架</li>
                            <li>我的关注</li>
                            <li>
                                <span>价格区间</span>
                                <input type="text" placeholder="￥">
                                <span>-</span>
                                <input type="text" placeholder="￥">
                                <span class="price">
                                    <span>清空</span>
                                    <span>确定</span>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%--商品展示--%>
        <div class="content">
            <ul class="like_ul">
                <%
                    if (!eidList.isEmpty()) {
                        for (GoodsModel goodsModel : eidList) {
                            List<GoodsModel> eidGoodsList = Daofactory.getgoodsdaoimpl().getdEidGoods(goodsModel.getEid());
                            for (GoodsModel model : eidGoodsList) {
                %>
                <li onclick="window.open('<%=path%>/jsp/user/goodsDetails.jsp')">
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
        <div class="rightnav1" id="nav1">
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
</html>
