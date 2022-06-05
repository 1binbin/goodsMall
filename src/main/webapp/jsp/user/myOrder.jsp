<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.EntityModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.CustomerModel" %><%--
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
            List<CustomerModel> list1 = (List<CustomerModel>) request.getSession().getAttribute("customer");
            String message;
            if (list1.isEmpty()){
                message = "你好，请登录或注册";
            }else {
                message = "您好，"+list1.get(0).getCnickname();
            }
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
                        <a href="<%=path%>/jsp/index.jsp"><%=message%></a>
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
                        <a href="javascript:void(0)">我的订单</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="javascript:void(0)" id="person" onclick="person('personalnformation111',1,'<%=cid%>','<%=path%>>')">个人信息</a>
                    </li>
                </ul>
                <div class="img"><img src="<%=path%>/personImg/<%=cid%>.jpg" alt=""></div>
            </div>
            <%--    修改个人信息--%>
            <%
                List<CustomerModel> cusstomerlist = EBofactory.getcustomerebiempl().getCustomerMessage(cid);
                if (!cusstomerlist.isEmpty()) {
            %>
            <div class="personalnformation" id="personalnformation111">
                <div>
                    <span>个人信息</span>
                    <span onclick="person('personalnformation111',2,'<%=cid%>','<%=path%>')">返回</span>
                </div>
                <div class="line"></div>
                <table class="table">
                    <tr>
                        <td>头像</td>
                        <td>
                            <form action="<%=path%>/customerServlet" method="post" enctype="multipart/form-data" id="form">
                                <input type="hidden" name="action" value="touxiang">
                                <input type="file" accept="image/jpeg" name="touxiang">
                                <input type="submit" value="点击上传" id="touxiang">
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>账号</td>
                        <td><input type="text" id="cid" readonly="readonly" value="<%=cusstomerlist.get(0).getCid()%>"></td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" id="cname" readonly="readonly" value="<%=cusstomerlist.get(0).getCname()%>"></td>
                    </tr>
                    <tr>
                        <td>昵称</td>
                        <td><input type="text" id="cnickname" readonly="readonly" value="<%=cusstomerlist.get(0).getCnickname()%>"></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><a href="<%=path%>/jsp/index.jsp">前往重置密码 ></a></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td>
                            <div class="q" id="q">
                                <input type="text" readonly="readonly"
                                       value="<%=cusstomerlist.get(0).getCsex()!=null?(cusstomerlist.get(0).getCsex().equals("male")?"男":"女"):"null"%>">
                            </div>
                            <div class="w" id="w">
                                <input class="ssex" type="radio" name="csex" value="male" readonly="readonly" id="nan" checked>男
                                <input class="ssex" type="radio" name="csex" value="fmale" readonly="readonly" id="nv">女
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="perbottom">
                    <button onclick="okupdate()">点击修改</button>
                    <button onclick="updatePerson('<%=path%>')" disabled="disabled" id="okButton">确认修改</button>
                </div>
                <span>收货地址</span>
                <div class="line" id="line"></div>
                <div class="per-top">
                    <input type="radio" id="one" name="radd" checked class="radio" value="t">
                    <label for="one" id="label1">添加地址</label>
                    <input type="radio" id="two" name="radd" class="radio" value="o">
                    <label for="two" id="label2">修改地址</label>
                    <div class="per-box">
                        <div class="one">
                            <table>
                                <tr>
                                    <td>收货人</td>
                                    <td><input type="text" name="rname1" id="shouhuoren"></td>
                                </tr>
                                <tr>
                                    <td>联系电话</td>
                                    <td><input type="text" name="rname2" id="shouhuophone"></td>
                                </tr>
                                <tr>
                                    <td>收货地址</td>
                                    <td><input type="text" name="radd" id="radd"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="two">
                            <span>修改对象</span>
                            <div class="two-box">
                                <select name="" id="seelctRadd">
                                    <%
                                        for (CustomerModel customerModel : cusstomerlist) {
                                    %>
                                    <option value="<%=customerModel.getRname()%>"><%=customerModel.getRname()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <span>修改内容</span>
                            <table>
                                <tr>
                                    <td>收货人</td>
                                    <td><input type="text" name="rname1" id="shouhuoren1"></td>
                                </tr>
                                <tr>
                                    <td>联系电话</td>
                                    <td><input type="text" name="rname2" id="phont1"></td>
                                </tr>
                                <tr>
                                    <td>收货地址</td>
                                    <td><input type="text" name="radd" id="radd1"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="per-bottom">
                        <button>重置</button>
                        <button onclick="changeAdd('<%=cid%>','<%=path%>')">确认</button>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="m-middle">
            <div class="left">
                <div class="img"><img src="<%=path%>/img/1.jpg" alt=""></div>
                <span>天天淘-我的订单</span>
            </div>
            <div class="right">
                <div class="search" id="search">
                    <div class="form1">
                        <input type="text" placeholder="搜索内容" id="searchText">
                        <div class="button" onclick="searchText()"><i class="fa fa-search" aria-hidden="true"
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
                <select name="" id="time" onchange="searchText()">
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
                <%
                    for (int j = 0; j < list.size(); j++) {
                %>
                <div class="orderBox">
                    <div class="o-top">
                        <span><%=list.get(j).get(0).getTdate()%></span>
                        <span>订单编号</span>
                        <span><%=list.get(j).get(0).getOid()%></span>
                    </div>
                    <div class="o-bottom">
                        <div class="ob-left">
                            <%
                                for (int i = 0; i < list.get(j).size(); i++) {
                            %>
                            <div class="show">
                                <div class="show-left">
                                    <div class="img"><img
                                            src="<%=path%>/Product_main_photo/<%=list.get(j).get(i).getEid()%>/<%=list.get(j).get(i).getGid()%>.jpg"
                                            alt=""></div>
                                </div>
                                <div class="show-middle">
                                    <p><%=list.get(j).get(i).getGcategory()%> | <%=list.get(j).get(i).getGname()%>
                                        | <%=list.get(j).get(i).getGdescribe()%>
                                    </p>
                                </div>
                                <div class="show-right">
                                    <span>X</span>
                                    <span><%=list.get(j).get(i).getMnum()%></span>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div class="ob-one">
                            <span><%=list.get(j).get(0).getRname()%></span>
                            <i class="fa fa-question-circle-o" aria-hidden="true">
                                <div class="address">
                                    <div class="text">
                                        <p>收货地址</p>
                                        <p><%=list.get(j).get(0).getRadd()%>
                                        </p>
                                    </div>
                                </div>
                            </i>
                        </div>
                        <div class="ob-two">
                            <span>￥<%=list.get(j).get(0).getTpay()%></span>
                        </div>
                        <div class="ob-three">
                            <%
                                if (list.get(j).get(0).getTispay().equals("no")) {
                            %>
                            <span class="span">未付款</span>
                            <%
                            } else if (list.get(j).get(0).getTisdelivey().equals("no")) {
                            %>
                            <span class="span">未发货</span>
                            <%
                            } else if (list.get(j).get(0).getTisover().equals("no")) {
                            %>
                            <span class="span">待收货</span>
                            <%
                            } else {
                            %>
                            <span class="span">已完成</span>
                            <%
                                }
                            %>
                        </div>
                        <div class="ob-four">
                            <%
                                String[] strings = list.get(j).get(0).getMessage().split(",");
                                for (int i = 0; i < strings.length; i++) {
                            %>
                            <a href="javascript:void(0)"
                               onclick="jumpother('<%=strings[i]%>','<%=list.get(j).get(0).getOid()%>','<%=cid%>')"><%=strings[i]%>
                            </a>
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
                        for (let j = 0; j < json[i].length; j++) {
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
                            itmeinin += "<a href=\"javascript:void(0)\" onclick=\"jumpother('" + strings[k] + "','" + json[i][0].oid + "','" + cid + "')\">" + strings[k] + "</a>";
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

        function searchText() {
            const cid = '<%=cid%>';
            let id = "";
            const shouhuradio = document.getElementsByClassName("shouhuradio");
            for (let i = 0; i < shouhuradio.length; i++) {
                if (shouhuradio[i].checked) {
                    id = shouhuradio[i].id;
                }
            }
            if (id === "one") {
                selectOrder(cid, "", "", "")
            } else if (id === "two") {
                selectOrder(cid, "yes", "no", "no")
            } else if (id === "three") {
                selectOrder(cid, "yes", "yes", "no")
            } else if (id === "four") {
                selectOrder(cid, "no", "no", "no")
            }
        }
        function jumpother(n, oid, cid) {
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
                gotoPay(oid, cid);
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
        function gotoPay(oid, cid) {
            const url = "<%=path%>/customerServlet?action=gotoPay&oid=" + oid + "&cid=" + cid;
            let xml = new XMLHttpRequest();
            xml.open("get", url, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    const data = xml.responseText;
                    const json = JSON.parse(data);
                    window.location.href = "<%=path%>/jsp/user/pay.jsp?num=" + json[0]+"&numPrice="+json[1]+"&address="+json[2]+"&zifu=weixin";
                }
            }
            xml.send(null)
        }
    </script>
</html>
