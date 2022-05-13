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
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
    </head>
    <script>
        <%--轮播图--%>
        window.onload = function () {
            var box = this.document.getElementById("re");
            var lik = box.getElementsByTagName("li");

            function fun(i, j) {//转换图片函数，就是把透明度改了一下
                lik[i].style.opacity = 1;
                lik[j].style.opacity = 0;
                lik[i + 8].style.backgroundColor = "#727272";//改一下小图标
                lik[j + 8].style.backgroundColor = "#00000000"
            }
            fun(0, 1);//初始化下
            var i = 0;
            function auto() {//轮播循环函数
                if (++i >= 8) {
                    i = 0;
                    fun(0, 7);
                } else fun(i, i - 1);
            }
            timer = this.setInterval(auto, 3000);
            box.onmouseover = function () { //鼠标划上去，停止轮播
                clearInterval(timer);
            }
            box.onmouseout = function () { //鼠标划出，继续轮播
                timer = setInterval(auto, 3000); //调用定时器
            }
            var j = 0;
            for (; j < 8; j++) {//点击小图标也可以转换图片
                lik[j + 8].ind = j;
                lik[j + 8].onclick = function () {
                    fun(this.ind, i)
                    i = this.ind;
                }
            }
        }
    </script>
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
                <div class="logo"><img src="<%=path%>/img/1.jpg" alt=""></div>
                <form action="" method="get">
                    <input type="text" placeholder="搜索内容">
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

            </div>
        </div>
        <%--        推荐商品--%>
        <div class="content">

        </div>
        <%--        底部信息--%>
        <div class="foot"></div>
    </body>
</html>
