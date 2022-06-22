<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.EntityModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.CustomerModel" %>
<%@ page import="com.entity.EmployeeModel" %><%--
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
            String cid = (String) request.getSession().getAttribute("cid");
            List<List<EntityModel>> list = new ArrayList<>();
            List<EntityModel> entityModelList = EBofactory.getotherEbimpl().getTicketCid(cid);
            for (EntityModel entityModel : entityModelList) {
                List<EntityModel> entityModels = EBofactory.getotherEbimpl().getTicketCidEid(cid, entityModel.getOid());
                list.add(entityModels);
            }
            request.setAttribute("list", list);
            List<CustomerModel> list1 = (List<CustomerModel>) request.getSession().getAttribute("customer");
            String message;
            if (list1.isEmpty()) {
                message = "你好，请登录或注册";
            } else {
                message = "您好，" + list1.get(0).getCnickname();
            }
            String vipMessage = (String) request.getSession().getAttribute("vipMessage");
        %>
        <title>天天淘-我的订单</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/icon/iconfont.css">
        <link rel="stylesheet" href="<%=path%>/css/myOrder.css">
        <script src="<%=path%>/js/myOrder.js"></script>
        <link rel="stylesheet" href="<%=path%>/css/personalnformation.css">
        <script src="<%=path%>/js/personalnformation.js"></script>
    </head>
    <body>
        <div class="top">
            <span><a href="<%=path%>/jsp/user/user.jsp"><i class="fa fa-angle-double-left"
                                                           aria-hidden="true"></i>返回首页</a></span>
            <div class="top-right">
                <ul>
                    <li>
                        <a href="<%=path%>/jsp/index.jsp"><%=message%>
                        </a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="<%=path%>/jsp/index.jsp">商家登录</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="<%=path%>/jsp/user/members.jsp"><%=vipMessage%>
                        </a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="javascript:void(0)">我的订单</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="javascript:void(0)" id="person"
                           onclick="person('personalnformation111',1,'<%=cid%>','<%=path%>')">个人信息</a>
                    </li>
                </ul>
                <div class="img"><img src="<%=path%>/personImg/<%=cid%>.jpg" alt=""></div>
            </div>
            <%--    修改个人信息--%>
            <%@include file="person.jsp" %>
        </div>
        <div class="m-middle">
            <div class="left">
                <div class="img"><img src="<%=path%>/img/logo.png" alt=""></div>
                <span>天天淘-我的订单</span>
            </div>
            <div class="right">
                <div class="search" id="search">
                    <div class="form1">
                        <input type="text" placeholder="搜索内容" id="searchText">
                        <div class="button" onclick="searchText('<%=cid%>')"><i class="fa fa-search" aria-hidden="true"
                                                                                id="btnaa"></i></div>
                    </div>
                    <div class="cart" onclick="window.open('<%=path%>/jsp/user/goodsCart.jsp?cid=<%=cid%>')">
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
                <select name="" id="time" onchange="searchText('<%=cid%>')">
                    <option value="all">全部</option>
                    <option value="onemonth">一个月内</option>
                    <option value="threemonth">三个月内</option>
                    <option value="harfyear">半年内</option>
                </select>
            </div>
            <div class="shouhuSelect">
                <ul class="oneUl">
                    <li>
                        <input type="radio" id="one1" name="shouhu" checked onclick="window.location.reload()"
                               class="shouhuradio">
                        <label for="one1"><i class="iconfont">&#xe784;</i></label>
                        <span>全部订单</span>
                    </li>
                    <li>
                        <input type="radio" id="two1" name="shouhu" class="shouhuradio"
                               onclick="selectOrder('<%=cid%>','yes','no','no')">
                        <label for="two1"><i class="iconfont">&#xe683;</i></label>
                        <span>未发货</span>
                    </li>
                    <li>
                        <input type="radio" id="three" name="shouhu" class="shouhuradio"
                               onclick="selectOrder('<%=cid%>','yes','yes','no')">
                        <label for="three"><i class="iconfont">&#xe650;</i></label>
                        <span>待收货</span>
                    </li>
                    <li>
                        <input type="radio" id="four" name="shouhu" class="shouhuradio"
                               onclick="selectOrder('<%=cid%>','no','no','no')">
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
            <div class="orderShow" id="orderShow">
                <c:forEach items="${requestScope.list}" varStatus="i" var="list">
                    <c:if test="${!empty list}">
                        <div class="orderBox">
                            <div class="o-top">
                                <span>${list[0].tdate}</span>
                                <span>订单编号</span>
                                <span>${list[0].oid}</span>
                            </div>
                            <div class="o-bottom">
                                <div class="ob-left">
                                    <c:forEach var="list1" items="${list}" varStatus="j">
                                        <div class="show">
                                            <div class="show-left">
                                                <div class="img"><img
                                                        src="<%=path%>/Product_main_photo/${list1.eid}/${list1.gid}.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="show-middle">
                                                <p>${list1.gcategory}
                                                    | ${list1.gname}
                                                    | <${list1.gdescribe}
                                                </p>
                                            </div>
                                            <div class="show-right">
                                                <span>X</span>
                                                <span>${list1.mnum}</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="ob-one">
                                    <span>${list[0].rname}</span>
                                    <i class="fa fa-question-circle-o" aria-hidden="true">
                                        <div class="address">
                                            <div class="text">
                                                <p>收货地址</p>
                                                <p>${list[0].radd}
                                                </p>
                                            </div>
                                        </div>
                                    </i>
                                </div>
                                <div class="ob-two">
                                    <span>￥${list[0].tpay}</span>
                                </div>
                                <div class="ob-three">
                                    <c:if test="${list[0].tispay.equals('no') && list[0].tisdelivey.equals('no') && list[0].tisover.equals('no')}">
                                        <span class="span">未付款</span>
                                    </c:if>
                                    <c:if test="${list[0].tispay.equals('yes') && list[0].tisdelivey.equals('no') && list[0].tisover.equals('no')}">
                                        <span class="span">未发货</span>
                                    </c:if>
                                    <c:if test="${list[0].tispay.equals('yes') && list[0].tisdelivey.equals('yes') && list[0].tisover.equals('no')}">
                                        <span class="span">待收货</span>
                                    </c:if>
                                    <c:if test="${list[0].tispay.equals('yes') && list[0].tisdelivey.equals('yes') && list[0].tisover.equals('yes')}">
                                        <span class="span">已完成</span>
                                    </c:if>
                                </div>
                                <div class="ob-four">
                                    <c:forTokens items="${list[0].message}" delims="," var="strigs">
                                        <a href="javascript:void(0)"
                                           onclick="jumpother('${strigs}','${list[0].oid}','<%=cid%>','${list[0]}')">${strigs}
                                        </a>
                                    </c:forTokens>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
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
        function selectOrder(cid, pay, delivey, over) {
            const time = document.getElementById("time");
            const index = time.selectedIndex;
            const timeValue = time[index].value;
            const search = document.getElementById("searchText").value;
            const url = "<%=path%>/customerServlet?action=selectOrder&cid=" + cid + "&pay=" + pay + "&delivey=" + delivey + "&over=" + over + "&type=" + timeValue + "&search=" + search;
            let xml = new XMLHttpRequest();
            xml.open("get", url, true)
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    const data = xml.responseText;
                    const json = JSON.parse(data);
                    let item = "";
                    for (let i = 0; i < json.length; i++) {
                        item += "<div class=\"orderBox\">" +
                            "<div class=\"o-top\">" +
                            "<span>" + json[i][0].tdate + "</span>" +
                            "<span>订单编号</span>" +
                            "<span>" + json[i][0].oid + "</span>" +
                            "</div>" +
                            "<div class=\"o-bottom\">" +
                            "<div class=\"ob-left\">";
                        let itemin = "";
                        let arr1 = "";
                        for (let j = 0; j < json[i].length; j++) {
                            arr1 += json[i][j].eid + ',' + json[i][j].gid + ',' + json[i][j].mnum + ','
                            itemin += "<div class=\"show\">" +
                                "<div class=\"show-left\">" +
                                "<div class=\"img\"><img src=\"<%=path%>/Product_main_photo/" + json[i][j].eid + "/" + json[i][j].gid + ".jpg\" alt=\"\"></div>" +
                                "</div>" +
                                "<div class=\"show-middle\">" +
                                "<p>" + json[i][j].gcategory + " | " + json[i][j].gname + " | " + json[i][j].gdescribe + "</p>" +
                                "</div>" +
                                "<div class=\"show-right\">" +
                                "<span>X</span>" +
                                "<span>" + json[i][j].mnum + "</span>" +
                                "</div>" +
                                "</div>";
                        }
                        item += itemin;
                        item += "</div>" +
                            "<div class=\"ob-one\">" +
                            "<span>" + json[i][0].rname + "</span>" +
                            "<i class=\"fa fa-question-circle-o\" aria-hidden=\"true\">" +
                            "<div class=\"address\">" +
                            "<div class=\"text\">" +
                            "<p>收货地址</p>" +
                            "<p>" + json[i][0].radd + "" +
                            "</p>" +
                            "</div>" +
                            "</div>" +
                            "</i>" +
                            "</div>" +
                            "<div class=\"ob-two\">" +
                            "<span>￥" + json[i][0].tpay + "</span>" +
                            "</div>" +
                            "<div class=\"ob-three\">";
                        let message1 = "";
                        if (json[i][0].tispay === "no") {
                            message1 = "未付款"
                        } else if (json[i][0].tisdelivey === "no") {
                            message1 = "未发货"
                        } else if (json[i][0].tisover === "no") {
                            message1 = "待收货";
                        } else {
                            message1 = "已完成";
                        }
                        item += "<span class=\"span\">" + message1 + "</span>" +
                            "</div>" +
                            "<div class=\"ob-four\">";
                        let itmeinin = "";
                        const strings = json[i][0].message.split(",");
                        for (let k = 0; k < strings.length; k++) {
                            itmeinin += "<a href=\"javascript:void(0)\" onclick=\"jumpother('" + strings[k] + "','" + json[i][0].oid + "','" + cid + "','" + arr1 + "')\">" + strings[k] + "</a>";
                        }
                        item += itmeinin;
                        item += "</div>" +
                            "</div>" +
                            "</div>"
                    }
                    document.getElementById("orderShow").innerHTML = item;
                }
            }
            xml.send(null)
        }

        function searchText(cid) {
            let id = "";
            console.log(2)
            const shouhuradio = document.getElementsByClassName("shouhuradio");
            for (let i = 0; i < shouhuradio.length; i++) {
                if (shouhuradio[i].checked) {
                    id = shouhuradio[i].id;
                }
            }
            console.log(id)
            if (id === "one1") {
                selectOrder(cid, "", "", "")
            } else if (id === "two1") {
                selectOrder(cid, "yes", "no", "no")
            } else if (id === "three") {
                selectOrder(cid, "yes", "yes", "no")
            } else if (id === "four") {
                selectOrder(cid, "no", "no", "no")
            }
        }

        function jumpother(n, oid, cid, list) {
            if (n === "确认收货") {
                confirmGoods(oid, cid)
            }
            if (n === "删除订单") {
                deleteOrder(oid, cid);
            }
            if (n === "取消订单") {
                cancelOrder(oid, cid)
            }
            if (n === "去付款") {
                gotoPay(oid, cid, list);
            }
        }

        //确认收货
        function confirmGoods(oid, cid) {
            const url = "<%=path%>/customerServlet?action=updateTicket&oid=" + oid + "&cid=" + cid + "&type=one";
            let xml = new XMLHttpRequest();
            xml.open("get", url, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    alert("确认收货成功")
                    window.location.reload();
                }
            }
            xml.send(null)
        }

        //    删除订单
        function deleteOrder(oid, cid) {
            if (window.confirm("确定是否删除？")) {
                const url = "<%=path%>/customerServlet?action=updateTicket&oid=" + oid + "&cid=" + cid + "&type=two";
                let xml = new XMLHttpRequest();
                xml.open("get", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        alert("删除订单成功")
                        window.location.reload();
                    }
                }
                xml.send(null)
            }
        }

        //    取消订单
        function cancelOrder(oid, cid) {
            if (window.confirm("确定取消订单？")) {
                const url = "<%=path%>/customerServlet?action=updateTicket&oid=" + oid + "&cid=" + cid + "&type=three";
                let xml = new XMLHttpRequest();
                xml.open("get", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        alert("取消订单成功")
                        window.location.reload();
                    }
                }
                xml.send(null)
            }
        }

        //    去付款
        function gotoPay(oid, cid, list) {
            console.log(list)
            const url = "<%=path%>/customerServlet?action=gotoPay&oid=" + oid + "&cid=" + cid;
            let xml = new XMLHttpRequest();
            xml.open("get", url, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    const data = xml.responseText;
                    const json = JSON.parse(data);
                    window.location.href = "<%=path%>/jsp/user/pay.jsp?&arr=" + list + "&num=" + json[0] + "&numPrice=" + json[1] + "&address=" + json[2] + "&zifu=weixin&oid=" + oid + "&cid=" + cid;
                }
            }
            xml.send(null)
        }
    </script>
</html>
