<%@ page import="com.entity.CustomerModel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/6/1
  Time: 19:22
  Description: 会员页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            String cid = (String) request.getSession().getAttribute("cid");
            List<CustomerModel> list1 = (List<CustomerModel>) request.getSession().getAttribute("customer");
            String message;
            if (list1.isEmpty()){
                message = "你好，请登录或注册";
            }else {
                message = "您好，"+list1.get(0).getCnickname();
            }
        %>
        <title>天天淘-注册会员</title>
        <link rel="stylesheet" href="<%=path%>/css/members.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
    </head>
    <body>
        <div class="top">
            <span><a href="<%=path%>/jsp/user/user.jsp"><i class="fa fa-angle-double-left"
                                                           aria-hidden="true"></i>返回首页</a></span>
            <div class="top-right">
                <ul>
                    <li>
                        <a href="<%=path%>/jsp/index.jsp"><%=message%></a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="<%=path%>/jsp/index.jsp">商家登录</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="<%=path%>/jsp/user/myOrder.jsp">我的订单</a>
                    </li>
                </ul>
                <div class="img"><img src="<%=path%>/personImg/<%=cid%>.jpg" alt=""></div>
            </div>
        </div>
        <div class="container">
            <div class="container-left">
                <span>天天淘会员</span>
            </div>
            <div class="container-right">
                <span>天天淘会员首页</span>
                <a href="javascript:void(0)">会员权益</a>
            </div>
        </div>
        <div class="member-middle">
            <span class="first">天天淘会员 享专属特权</span>
            <span class="second">尊敬的XXX，根据您近半年的消费情况</span>
            <div>
                <span>开通会员预计可省</span>
                <span>￥1221</span>
            </div>
            <button onclick="jump()">
                <span>立即支付</span>
                <span id="allPrice">应付金额￥25</span>
            </button>
        </div>
        <div class="selectBox">
            <div class="s-left">
                <div></div>
                <div></div>
            </div>
            <div class="s-middle">
                <span>种类选择</span>
            </div>
            <div class="s-right">
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="bottomBox">
            <input type="radio" id="one" name="select" checked class="select" onclick="changePrice()" value="month">
            <label for="one">
                <span>月度会员</span>
                <span  id="0">￥25</span>
                <div></div>
                <span>会员特权</span>
                <span>会员商品享受<span>9.8</span> 折</span>
            </label>
            <input type="radio" id="two" name="select" class="select" onclick="changePrice()" value="quarter">
            <label for="two">
                <span>季度会员</span>
                <span  id="1">￥68</span>
                <div></div>
                <span>会员特权</span>
                <span>会员商品享受<span>9.5</span> 折</span>
            </label>
            <input type="radio" id="three" name="select" class="select" onclick="changePrice()" value="year">
            <label for="three">
                <span>年度会员</span>
                <span id="2">￥128</span>
                <div></div>
                <span>会员特权</span>
                <span>会员商品享受<span>9</span> 折</span>
            </label>
        </div>
    </body>
    <script>
        function changePrice() {
            var price;
            var input = document.getElementsByClassName("select");
            for (let i = 0; i < input.length; i++) {
                if (input[i].checked){
                    var value = document.getElementById(i+"");
                    price = value.innerText
                }
            }
            document.getElementById("allPrice").innerText = "应付金额"+price;
        }
        function jump() {
        //    cid options
            const radio = document.getElementsByClassName("select");
            let vcategory;
            for (let i = 0; i < radio.length; i++) {
                if (radio[i].checked){
                    vcategory = radio[i].value;
                }
            }
            const url = "<%=path%>/customerServlet?action=insertVip&cid=<%=cid%>&vcategory=" + vcategory;
            let xml = new XMLHttpRequest;
            xml.open("get",url,true)
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200){
                    alert("注册成功")
                    window.open("<%=path%>/jsp/user/user.jsp")
                }
            }
            xml.send(null)
        }
    </script>
</html>
