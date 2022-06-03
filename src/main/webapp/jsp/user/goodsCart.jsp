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
        %>
        <title>购物车</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="<%=path%>/js/goodsCart.js"></script>
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
            <div class="logo">
                <span>全部商品</span>
                <span><%=count%></span>
            </div>
            <form action="" method="get">
                <input type="text" placeholder="搜索内容" name="search" id="searchText">
                <div class="button" onclick="selectSearch11()"><i class="fa fa-search" aria-hidden="true"
                                                                id="btnaa"></i></div>
            </form>
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
                            <div class="goods-img" onclick="window.open('<%=path%>/jsp/user/goodsDetails.jsp?eid=<%=list.get(i).get(0).getEid()%>&gid=<%=list.get(i).get(0).getGid()%>')">
                                <img alt="暂无图片"
                                     src="<%=path%>/Product_main_photo/<%=list.get(i).get(j).getEid()%>/<%=list.get(i).get(j).getGid()%>.jpg" title="点击查看详情">
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
                            <a href="" class="delete">删除</a>
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
        for (let i = 0; i < eidInput.length; i++) {
            if (eidInput[i].checked) {
                const eid = eidInput[i].className.split(" ")[2];
                const gid = eidInput[i].className.split(" ")[3];
                const num = document.getElementsByClassName(eid + "-" + gid)[0].value;
                arr[i] = [eid, gid, num];
            }
        }
        window.location.href="<%=path%>/jsp/user/order.jsp?cid=<%=cid%>&cid=<%=cid%>&arr="+arr;
    }
    function deleteCheckedGoods() {
        if (window.confirm("确定是否删除选中的商品？")){
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
        if (window.confirm("确定是否清空购物车？")){
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
        var url = "<%=path%>/customerServlet?action=selectCart&cid=<%=cid%>&search="+search;
        let  xml = new XMLHttpRequest();
        xml.open("get",url,true);
        xml.onreadystatechange = function (){
            if(xml.readyState === 4 && xml.status === 200){
                const data = xml.responseText;
                const json = JSON.parse(data);
                console.log(json)
            }
        }
        xml.send(null)
    }
</script>
