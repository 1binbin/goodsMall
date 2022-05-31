<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/30
  Time: 18:47
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
        %>
        <title>天天淘-支付</title>
        <link rel="stylesheet" href="<%=path%>/css/pay.css">
    </head>
    <body>
        <div class="top">
            <div class="t-left">
                <img src="<%=path%>/img/1.jpg" alt="" class="logo">
                <span>收银台</span>
            </div>
            <div class="t-right">
                <span>XXXXXX</span>
                <div class="line"></div>
                <a href="">我的订单</a>
            </div>
        </div>
        <div class="progress">
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
            <div class="p-left">
                <span>请在</span>
                <span>2022-06-01 00:00:00</span>
                <span>之内完成支付，否则自动取消订单</span>
            </div>
        </div>
        <div class="bottom">
            <div class="b-top">
                <span>订单信息</span>
            </div>
            <div class="b-middle">
                <div class="b-middle-left">
                    <table>
                        <tr>
                            <td>商品数量：</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>支付方式：</td>
                            <td>微信支付</td>
                        </tr>
                        <tr>
                            <td>收件人信息：</td>
                            <td>XXX 15875195553 xxx省xx市xx镇</td>
                        </tr>
                    </table>
                </div>
                <div class="b-middle-right">
                    <span>应付金额</span>
                    <span>￥69.9</span>
                </div>
            </div>
            <div class="b-bottom">
                <div class="submit">
                    <button onclick="jump()">立即支付</button>
                </div>
            </div>
        </div>
        <div class="message">
            <span>支付成功</span>
            <span id="second">3</span>
            <span>秒后跳转到首页······</span>
        </div>
    </body>
    <script>
        function jump() {
            document.getElementsByClassName("message")[0].style.display = "block";
            timer();
        }
        function timer() {
            let second = 3;
            setInterval(function () {
                second--;
                document.getElementById("second").innerText =  second+"";
                console.log(second)
                if (second === 0){
                    window.location.href = "<%=path%>/jsp/user.jsp";
                }
            }, 3000)
        }
    </script>
</html>