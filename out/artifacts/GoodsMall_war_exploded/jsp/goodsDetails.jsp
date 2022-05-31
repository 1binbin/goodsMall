<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/31
  Time: 10:52
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
        %>
        <title>天天淘-商品详情</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsDetails.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="<%=path%>/js/goodsCart.js"></script>
    </head>
    <body>
        <div class="top">
            <div class="top-left">
                <span>所有商品 > </span>
                <span>XXX类别</span>
                <span> > </span>
                <span>XXX名</span>
            </div>
            <div class="top-right">
                <span>XXX店铺</span>
                <input type="checkbox" id="i">
                <label for="i"><i class="fa fa-star" aria-hidden="true" id="ii"></i>关注店铺</label>
            </div>
        </div>
        <div class="middle">
            <div class="m-left">
                <div class="img">
                    <img src="<%=path%>/img/1.jpg" alt="暂无图片">
                </div>
            </div>
            <div class="m-right">
                <div class="m-r-top">
                    <p>结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到结合当今爱好等按斤称看来得及奥斯卡结课了即可了解啊阿萨德焦点离开三的大浪街道拉大锯的路径阿达克了打卡啦多久啊大家爱哦端到</p>
                </div>
                <div class="m-r-middle">
                    <div class="m-r-r-m-left">
                        <div class="one">
                            <span>普通售价</span>
                            <span>￥23.9</span>
                        </div>
                        <div class="second">
                            <span>会员价格</span>
                            <span>￥20.9</span>
                        </div>
                    </div>
                    <div class="m-r-r-m-right">
                        <div class="one">
                            <span>库存量</span>
                            <span>12</span>
                        </div>
                        <div class="second">
                            <span>月销量</span>
                            <span>11</span>
                        </div>
                    </div>
                </div>
                <div class="m-r-num">
                    <div>数量</div>
                    <div class="goods-num">
                        <button onclick="downnum('num')">-</button>
                        <input type="text" min="1" value="1" id="num" disabled="disabled">
                        <button onclick="upnum('num')">+</button>
                    </div>
                </div>
                <div class="m-r-submit">
                    <button class="gouwuche">加入购物车</button>
                    <button class="lijigoumai">直接购买</button>
                </div>
            </div>
        </div>
    </body>
    <script>
    </script>
</html>
