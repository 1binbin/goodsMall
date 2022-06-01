<%@ page import="java.util.HashMap" %><%--
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
        <script src="<%=path%>/js/myOrder.js"></script>
    </head>
    <body>
        <div class="top">
            <span><a href="<%=path%>/jsp/user/user.jsp"><i class="fa fa-angle-double-left"
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
                        <a href="<%=path%>/jsp/user/members.jsp">成为会员</a>
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
            <div class="bar">
                <span>订单详情</span>
                <span>收货人</span>
                <span>金额</span>
                <span>状态</span>
                <span>操作</span>
            </div>
            <div class="orderShow">
                <%
                    for (int j = 0; j < 3; j++) {
                %>
                <div class="orderBox">
                    <div class="o-top">
                        <span>2022/05/31 22:23:00</span>
                        <span>订单编号</span>
                        <span>1321213989992</span>
                    </div>
                    <div class="o-bottom">
                        <div class="ob-left">
                            <%
                                String[] strings = {"未收货", "已收货", "未付款"};
                                HashMap<Integer,String[]> hashMap = new HashMap<>();
                                hashMap.put(0,new String[]{"确认收货"});
                                hashMap.put(1,new String[]{"删除订单"});
                                hashMap.put(2,new String[]{"去付款","取消订单"});
                                for (int i = 0; i < 3; i++) {
                            %>
                            <div class="show">
                                <div class="show-left">
                                    <div class="img"><img src="<%=path%>/img/1.jpg" alt=""></div>
                                </div>
                                <div class="show-middle">
                                    <p>
                                        结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到</p>
                                </div>
                                <div class="show-right">
                                    <span>X</span>
                                    <span>1</span>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div class="ob-one">
                            <span>XXX</span>
                            <i class="fa fa-question-circle-o" aria-hidden="true">
                                <div class="address">
                                    <div class="text">
                                        <p>收货地址</p>
                                        <p>
                                            结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到</p>
                                    </div>
                                </div>
                            </i>
                        </div>
                        <div class="ob-two">
                            <span>￥23.9</span>
                        </div>
                        <div class="ob-three">
                            <span><%=strings[j]%></span>
                        </div>
                        <div class="ob-four">
                            <a href=""><%=hashMap.get(j)[0]%>
                            </a>
                            <%
                                if (j == 2){
                            %>
                            <a href=""><%=hashMap.get(j)[1]%></a>
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
</html>
