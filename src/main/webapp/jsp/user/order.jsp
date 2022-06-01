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
<%@ page contentType="text/html;charset=UTF-8" %>
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
                        <a href="#">成为会员</a>
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
        <div class="progress">
            <div class="p-left">
                <span>天天淘-结算页</span>
            </div>
            <div class="p-right">
                <div class="p-top">
                    <div class="bar"></div>
                    <div class="circle">1</div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="circle">2</div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="circle">3</div>
                    <div class="bar"></div>
                </div>
                <div class="p-bottom">
                    <span>1.我的购物车</span>
                    <span>2.填写核对订单信息</span>
                    <span>3.订单支付</span>
                </div>
            </div>
        </div>
        <%--        订单信息--%>
        <div class="order">
            <p class="header">填写并核对订单信息</p>
            <div class="order-bottom">
                <div class="box">
                    <div class="f-top">
                        <p>收货人信息</p>
                        <div class="f-top-right">
                            <a href="">修改收货地址</a>
                            <a href="">新增收货地址</a>
                        </div>
                    </div>
                    <div class="f-bottom">
                        <span>收货人</span>
                        <select name="name" id="name">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                        <span>收货地址</span>
                        <select name="address" id="address">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>
                <div class="line"></div>
                <div class="box">
                    <div class="f-top">
                        <p>支付方式</p>
                    </div>
                    <div class="f-bottom">
                        <input type="radio" name="zfu" value="weixin" id="huodao" checked>
                        <label for="huodao">货到付款</label>
                        <input type="radio" name="zfu" value="weixin" id="weixin" checked>
                        <label for="weixin">微信支付</label>
                        <input type="radio" name="zfu" value="zifubao" id="zifubao">
                        <label for="zifubao">支付宝</label>
                    </div>
                </div>
                <div class="line"></div>
                <div class="box">
                    <div class="f-top">
                        <p>送货清单</p>
                        <div class="f-top-right">
                            <a href="<%=path%>/jsp/user/goodsCart.jsp">返回购物车</a>
                        </div>
                    </div>
                    <div class="t-bottom">
                        <ul>
                            <%
                                for (int i = 0; i < 3; i++) {
                            %>
                            <li>
                                <div class="goods">
                                    <div class="img">
                                        <img src="<%=path%>/img/1.jpg" alt="">
                                    </div>
                                    <span class="text">aseweqweqoqwieuiqioqeuqwioeuqewqeuq的空间暗示都搜达SaaS大迫杰肯德基斯柯达结课了打卡世界等级客户端看</span>
                                    <span class="price">￥23.3</span>
                                    <span class="num">X1</span>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="order-statistical">
            <table>
                <tr>
                    <td>数目合计：</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>价格合计：</td>
                    <td>￥69.9</td>
                </tr>
            </table>
        </div>
        <div class="order-message">
            <div class="f">
                <span>应付总额：</span>
                <span>￥69.9</span>
            </div>
            <div class="s">
                <span>寄送至：</span>
                <span>XXX</span>
                <span>收货人：</span>
                <span>XXX 1587519xxxx</span>
            </div>
        </div>
        <div class="submit">
            <button onclick="window.location.href='<%=path%>/jsp/user/pay.jsp'">提交订单</button>
        </div>
    </body>
</html>
