<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.entity.ShoppingcartModel" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.EmployeeModel" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/29
  Time: 10:39
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            String cid = request.getParameter("cid");
            List<List<ShoppingcartModel>> list = EBofactory.getShoppingcartempl().getCidGidEidHash(cid);
            int count = EBofactory.getCountbiempl().getAllCart(cid);
            List<CustomerModel> list1 = (List<CustomerModel>) request.getSession().getAttribute("customer");
            String message;
            if (list1.isEmpty()){
                message = "你好，请登录或注册";
            }else {
                message = "您好，"+list1.get(0).getCnickname();
            }
        %>
        <title>购物车</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="<%=path%>/js/goodsCart.js"></script>
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
                        <a href="<%=path%>/jsp/user/myOrder.jsp">我的订单</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="javascript:void(0)" id="person" onclick="person('personalnformation111',1,'<%=cid%>','<%=path%>>')">个人信息</a>
                    </li>
                </ul>
                <div class="img"><img src="<%=path%>/personImg/<%=cid%>.jpg" alt=""></div>
            </div>
            <%@ page import="com.entity.CustomerModel" %>
            <%@ page import="com.business.EBofactory" %>
            <%@ page import="java.util.List" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <%--    LOGO图+搜索框+购物车--%>
        <div class="search" id="search">
            <div class="logo">
                <span>全部商品</span>
                <span><%=count%></span>
            </div>
            <div class="form">
                <input type="text" placeholder="搜索内容" name="search" id="searchText">
                <div class="button" onclick="selectSearch11()"><i class="fa fa-search" aria-hidden="true"
                                                                  id="btnaa"></i></div>
            </div>
        </div>
        <%--        中间--%>
        <div class="middle">
            <input type="checkbox" id="allChecked" onclick="allChecked(this,'employee','goods','allGoods','allprice')">
            <label for="allChecked">全选</label>
            <div class="a">商品</div>
            <div class="b">单价</div>
            <div class="c">数量</div>
            <div class="d">小计</div>
            <div class="e">操作</div>
        </div>
        <%--        购物车主体--%>
        <div class="cartBody" id="cartBody">
            <%
                //eid
                for (int i = 0; i < list.size(); i++) {
                    List<EmployeeModel> employeeModels = EBofactory.getemployeeebiempl().getEmployee(list.get(i).get(0).getEid());
            %>
            <div class="cart">
                <div class="cart-top">
                    <input type="checkbox" id="checked<%=i%>"
                           onclick="isChecked1(this,'goods<%=i%>','goodsChecked<%=i%>','allprice<%=i%>')"
                           class="employee">
                    <label for="checked<%=i%>"><%=employeeModels.get(0).getEstorename()%>
                    </label>
                    <div class="cart-goods">
                        <%
                            //eid下的所有gid
                            for (int j = 0; j < list.get(i).size(); j++) {
                                List<GoodsModel> listGoods = EBofactory.getgoodsebiempl().getGidEid(list.get(i).get(j).getGid(), list.get(i).get(j).getEid());
                                String num = i + (j + "");
                        %>
                        <div class="goods goods<%=i%>" id="goods<%=num%>">
                            <input type="checkbox" id="checkedGoodsnum<%=num%>"
                                   class="goodsChecked<%=i%> allGoods <%=list.get(i).get(j).getEid()%> <%=list.get(i).get(j).getGid()%>"
                                   onclick="isChecked(this,'goods<%=num%>','checked<%=i%>','num<%=num%>')">
                            <div class="goods-img"
                                 onclick="window.open('<%=path%>/jsp/user/goodsDetails.jsp?eid=<%=list.get(i).get(0).getEid()%>&gid=<%=list.get(i).get(0).getGid()%>')">
                                <img alt="暂无图片"
                                     src="<%=path%>/Product_main_photo/<%=list.get(i).get(j).getEid()%>/<%=list.get(i).get(j).getGid()%>.jpg"
                                     title="点击查看详情">
                            </div>
                            <span class="text"><%=listGoods.get(0).getGname()%> | <%=listGoods.get(0).getGdescribe()%></span>
                            <span class="price" id="pricenum<%=num%>">￥<%=listGoods.get(0).getGprice()%></span>
                            <div class="goods-num">
                                <button onclick="downnum('num<%=num%>')">-</button>
                                <input type="text" min="1" value="1" id="num<%=num%>" disabled="disabled"
                                       class="<%=list.get(i).get(j).getEid()%>-<%=list.get(i).get(j).getGid()%>">
                                <button onclick="upnum('num<%=num%>')">+</button>
                            </div>
                            <span class="allprice allprice<%=i%>"
                                  id="allpricenum<%=num%>">￥<%=listGoods.get(0).getGprice()%></span>
                            <a href="javascript:void(0)" class="delete"
                               onclick="delect('<%=list.get(i).get(j).getGid()%>','<%=list.get(i).get(j).getEid()%>','<%=cid%>')">删除</a>
                        </div>
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
        <%--        提交订单--%>
        <div class="white"></div>
        <div class="buttom">
            <div class="content">
                <div class="left">
                    <input type="checkbox" id="allChecked2"
                           onclick="allChecked(this,'employee','goods','allGoods','allprice')">
                    <label for="allChecked2">全选</label>
                    <a href="" class="deleteCheck" onclick="deleteCheckedGoods()">删除选中的商品</a>
                    <a href="" class="deleteCheckAll" onclick="deleteAllCart()">清空购物车</a>
                </div>
                <div class="right">
                    <span>总价</span>
                    <span id="price">￥0.0</span>
                    <div class="settlement">
                        <span onclick="jumpPay()">结算</span>
                    </div>
                </div>
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
<script>
    function jumpPay() {
        const eidInput = document.getElementsByClassName("allGoods");
        const arr = [];
        let j = 0;
        for (let i = 0; i < eidInput.length; i++) {
            if (eidInput[i].checked) {
                const eid = eidInput[i].className.split(" ")[2];
                const gid = eidInput[i].className.split(" ")[3];
                const num = document.getElementsByClassName(eid + "-" + gid)[0].value;
                arr[j] = [eid, gid, num];
                j++;
            }
        }
        if (arr.length === 0){
            alert("请先选中商品")
        }else {
            window.location.href = "<%=path%>/jsp/user/order.jsp?cid=<%=cid%>&cid=<%=cid%>&arr=" + arr;
        }
    }

    function deleteCheckedGoods() {
        if (window.confirm("确定是否删除选中的商品？")) {
            const eidInput = document.getElementsByClassName("allGoods");
            const arr = [];
            for (let i = 0; i < eidInput.length; i++) {
                if (eidInput[i].checked) {
                    const eid = eidInput[i].className.split(" ")[2];
                    const gid = eidInput[i].className.split(" ")[3];
                    arr[i] = [eid, gid];
                }
            }
            let xml = new XMLHttpRequest();
            xml.open("get", "<%=path%>/customerServlet?action=deleteChekedCart&cid=<%=cid%>&arr=" + arr, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    window.location.reload();
                }
            }
            xml.send(null);
        }
    }

    function deleteAllCart() {
        if (window.confirm("确定是否清空购物车？")) {
            let xml = new XMLHttpRequest();
            xml.open("get", "<%=path%>/customerServlet?action=deleteCart&cid=<%=cid%>", true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    window.location.reload();
                }
            }
            xml.send(null);
        }
    }

    function selectSearch11() {
        var search = document.getElementById("searchText").value;
        var url = "<%=path%>/customerServlet?action=selectCart&cid=<%=cid%>&search=" + search;
        let xml = new XMLHttpRequest();
        xml.open("get", url, true);
        xml.onreadystatechange = function () {
            if (xml.readyState === 4 && xml.status === 200) {
                const data = xml.responseText;
                const json = JSON.parse(data);
                let item = "";
                for (let i = 0; i < json.length; i++) {
                    item += " <div class=\"cart\">" +
                        "<div class=\"cart-top\">" +
                        "<input type=\"checkbox\" id=\"checked" + i + "\" onclick=\"isChecked1(this,'goods" + i + "','goodsChecked" + i + "','allprice" + i + "')\" class=\"employee\">" +
                        "<label for=\"checked" + i + "\">" + json[i][0].estorename + "</label>" +
                        "<div class=\"cart-goods\">";
                    let item1 = "";
                    for (let j = 0; j < json[i].length; j++) {
                        var num = i + (j + "");
                        item1 += "<div class=\"goods goods" + i + "\" id=\"goods" + num + "\">" +
                            "<input type=\"checkbox\" id=\"checkedGoodsnum" + num + "\" class=\"goodsChecked" + i + " allGoods " + json[i][j].eid + " " + json[i][j].gid + "\" onclick=\"isChecked(this,'goods" + num + "','checked" + i + "','num" + num + "')\">" +
                            "<div class=\"goods-img\" onclick=\"window.open('<%=path%>/jsp/user/goodsDetails.jsp?eid=" + json[i][j].eid + "&gid=" + json[i][j].gid + "')\">" +
                            "<img alt=\"暂无图片\" src=\"<%=path%>/Product_main_photo/" + json[i][j].eid + "/" + json[i][j].gid + ".jpg\" title=\"点击查看详情\">" +
                            "</div><span class=\"text\">" + json[i][j].gname + " | " + json[i][j].gdescribe + "</span>" +
                            "<span class=\"price\" id=\"pricenum" + num + "\">￥" + json[i][j].gprice + "</span>" +
                            "<div class=\"goods-num\">" +
                            "<button onclick=\"downnum('num" + num + "')\">-</button>" +
                            "<input type=\"text\" min=\"1\" value=\"1\" id=\"num" + num + "\" disabled=\"disabled\" class=\"" + json[i][j].eid + "-" + json[i][j].gid + "\">" +
                            "<button onclick=\"upnum('num" + num + "')\">+</button>" +
                            "</div>" +
                            "<span class=\"allprice allprice" + i + "\" id=\"allpricenum" + num + "\">￥" + json[i][j].gprice + "</span>" +
                            "<a href=\"javascript:void(0)\" class=\"delete\" onclick=\"delect('" + json[i][j].gid + "','" + json[i][j].eid + "','<%=cid%>')\">删除</a>" +
                            "</div>";
                    }
                    item += item1;
                    item += "</div>" +
                        "</div>" +
                        "</div>";
                }
                console.log(item)
                document.getElementById("cartBody").innerHTML = item;
            }
        }
        xml.send(null)
    }

    function delect(gid, eid, cid) {
        if (window.confirm("确定是否删除该商品？")) {
            let xml = new XMLHttpRequest();
            xml.open("get", "<%=path%>/customerServlet?action=delect&cid=" + cid + "&gid=" + gid + "&eid=" + eid, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    window.location.reload();
                }
            }
            xml.send(null);
        }
    }
</script>
