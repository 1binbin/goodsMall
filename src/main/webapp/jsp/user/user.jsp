<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--suppress ForLoopReplaceableByWhile --%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="com.business.CustomerEbimpl" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.CustomerModel" %>
<%@ page import="java.util.ArrayList" %><%--
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
            List<GoodsModel> eidList = Daofactory.getgoodsdaoimpl().getdEid();
            String cid = (String) request.getSession().getAttribute("cid");
            Cookie[] cookies = request.getCookies();
//            自动登录
            String username = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("username".equals(cookie.getName())) {
                        username = cookie.getValue();
                    }
                }
            }
            if (username.endsWith("user")) {
                String cidnew = username.substring(0, username.length() - 4);
                if (cid ==null || cid.equals(cidnew)) {
                    cid = cidnew;
                }
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("cid", cid);
            }
            List<CustomerModel> list;
            String message;
            String vipMessage;
            String vip = null;
            if (cid != null) {
                list = EBofactory.getcustomerebiempl().getCustomer(cid);
                request.getSession().setAttribute("customer", list);
                vip = EBofactory.getcustomerebiempl().vcategory1(cid);
                message = "您好，" + list.get(0).getCnickname();
            } else {
                message = "你好，请登录或注册";
            }
            if (vip == null) {
                List<CustomerModel> list1 = EBofactory.getcustomerebiempl().selectVip(cid);
                if (!list1.isEmpty()){
                    vipMessage = "会员已冻结";
                }else {
                    vipMessage = "会员中心";
                }
            } else {
                vipMessage = "尊贵的 " + vip;
            }
            request.getSession().setAttribute("vipMessage", vipMessage);
        %>
        <title>天天淘</title>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
        <link rel="stylesheet" href="<%=path%>/css/personalnformation.css">
        <script src="<%=path%>/js/personalnformation.js"></script>
        <script src="<%=path%>/js/user.js"></script>
    </head>
    <script>
        function hidenMesage() {
            const url = "<%=path%>/customerServlet?action=deleetvip&cid=<%=cid%>";
            let xml = new XMLHttpRequest();
            xml.open("get", url, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    let vals = xml.responseText;
                    let jsonArr = eval(vals);
                    if (jsonArr[0] === true) {
                        document.getElementById("messager").style.display = "flex";
                    }
                    const box = document.getElementById("re");
                    const lik = box.getElementsByTagName("li");

                    function fun(i, j) {//转换图片函数，就是把透明度改了一下
                        lik[i].style.opacity = 1;
                        lik[j].style.opacity = 0;
                        lik[i + 8].style.backgroundColor = "#ffffff";//改一下小图标
                        lik[j + 8].style.backgroundColor = "#00000000"
                    }

                    fun(0, 1);//初始化下
                    let i = 0;

                    function auto() {//轮播循环函数
                        if (++i >= 8) {
                            i = 0;
                            fun(0, 7);
                        } else fun(i, i - 1);
                    }

                    let timer = setInterval(auto, 3000);
                    box.onmouseover = function () { //鼠标划上去，停止轮播
                        clearInterval(timer);
                    }
                    box.onmouseout = function () { //鼠标划出，继续轮播
                        timer = setInterval(auto, 3000); //调用定时器
                    }
                    let j = 0;
                    for (; j < 8; j++) {//点击小图标也可以转换图片
                        lik[j + 8].ind = j;
                        lik[j + 8].onclick = function () {
                            fun(this.ind, i)
                            i = this.ind;
                        }
                    }
                }
            }
            xml.send(null)
        }

        window.onload = hidenMesage;
    </script>
    <body>
        <%--顶部--%>
        <div class="messagre" id="messager">
            <span>您的会员已到期</span>
            <span><a href="" onclick="hiddenMessagre()">我已了解</a></span>
        </div>
        <div class="top">
            <span>天天淘商城欢迎您</span>
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
                        <a href="<%=path%>/jsp/user/myOrder.jsp">我的订单</a>
                    </li>
                    <li class="line"></li>
                    <li>
                        <a href="#" id="person"
                           onclick="person('personalnformation111',1,'<%=cid%>','<%=path%>')">个人信息</a>
                    </li>
                </ul>
                <div class="img"><img src="<%=path%>/personImg/<%=cid%>.jpg" alt=""></div>
            </div>
            <%--    修改个人信息--%>
            <%@include file="person.jsp" %>
        </div>
        <%--    LOGO图+搜索框+购物车--%>
        <div class="search" id="search">
            <div class="logo"><img src="<%=path%>/img/1.jpg" alt=""></div>
            <form action="<%=path%>/customerServlet" method="get">
                <input type="hidden" name="action" value="search">
                <input type="text" placeholder="搜索内容" name="search" id="search2">
                <div class="button" onclick="getSelect()"><i class="fa fa-search" aria-hidden="true"
                                                             id="btnaa"></i></div>
            </form>
            <div class="cart" onclick="window.open('<%=path%>/jsp/user/goodsCart.jsp?cid=<%=cid%>')">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                <span>购物车</span>
            </div>
        </div>
        <%--        商品分类+轮播图+baner图--%>
        <div class="middle">
            <div class="middle_left">
                <div class="span"><span>所有商品分类</span></div>
                <ul>
                    <li><a href="javascript:void(0)" onclick="getGcategory('家用电器')">家用电器</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('医药保健')">医药保健</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('手机')">手机</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('运营商')">运营商</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('数码')">数码</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('电脑')">电脑</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('办公')">办公</a>
                    </li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('家居')">家居</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('家具')">家具</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('家装')">家装</a> / <a
                                href="javascript:void(0)" onclick="getGcategory('厨具')">厨具</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('男装')">男装</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('女装')">女装</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('童装')">童装</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('美妆')">美妆</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('个人清洁')">个人清洁</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('宠物')">宠物</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('女鞋')">女鞋</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('箱包')">箱包</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('钟表')">钟表</a> / <a
                                href="javascript:void(0)" onclick="getGcategory('珠宝')">珠宝</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('男鞋')">男鞋</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('运动')">运动</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('户外')">户外</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('房产')">房产</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('汽车')">汽车</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('汽车用品')">汽车用品</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('母婴')">母婴</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('玩具乐器')">玩具乐器</a>
                    </li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('食品')">食品</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('酒类')">酒类</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('生鲜')">生鲜</a> / <a
                                href="javascript:void(0)" onclick="getGcategory('特产')">特产</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('艺术')">艺术</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('礼品鲜花')">礼品鲜花</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('农贸绿植 ')">农贸绿植</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('图书')">图书</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('文娱')">文娱</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('教育')">教育</a> / <a
                                href="javascript:void(0)" onclick="getGcategory('电子书')">电子书</a></li>
                    <li><a href="javascript:void(0)" onclick="getGcategory('安装')">安装</a> / <a href="javascript:void(0)"
                                                                                              onclick="getGcategory('维修')">维修</a>
                        / <a href="javascript:void(0)" onclick="getGcategory('清洗')">清洗</a> / <a
                                href="javascript:void(0)" onclick="getGcategory('二手')">二手</a></li>
                </ul>
            </div>
            <div class="middle-middle" id="max">
                <div class="re" id="re">
                    <ul>
                        <c:forEach begin="1" end="8" step="1" varStatus="i">
                            <li><img src="<%=path%>/shuffling_img/${i.count}.jpg" alt=""></li>
                        </c:forEach>
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
                <span>今日特价</span>
                <%
                    List<GoodsModel> list1 = EBofactory.getgoodsebiempl().listPriceMin();
                    request.setAttribute("list1",list1);
                %>
                <c:if test="${!empty list1}">
                    <c:forEach var="list1" items="${requestScope.list1}" varStatus="i">
                        <div class="img">
                            <img src="<%=path%>/Product_main_photo/${list1.eid}/${list1.gid}.jpg" alt="" onclick="window.open('<%=path%>/jsp/user/goodsDetails.jsp?gid=${list1.gid}&eid=${list.eid}&cid=<%=cid%>')">
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <%--        推荐商品--%>
        <div class="content" id="content">
            <div class="like">
                <input type="radio" name="select" id="one11" checked>
                <label for="one11" class="span" onclick="window.location.reload()">猜你喜欢</label>
                <input type="radio" name="select" id="two11">
                <label for="two11" class="span" onclick="showlikeGoods(<%=cid%>)">我的关注</label>
            </div>
            <ul class="like_ul" id="showFansGoods">
                <%
                    if (!eidList.isEmpty()) {
                        for (GoodsModel goodsModel : eidList) {
                            List<GoodsModel> eidGoodsList = Daofactory.getgoodsdaoimpl().getdEidGoods(goodsModel.getEid());
                            for (GoodsModel model : eidGoodsList) {
                %>
                <li onclick="window.open('<%=path%>/jsp/user/goodsDetails.jsp?gid=<%=model.getGid()%>&eid=<%=model.getEid()%>&cid=<%=cid%>')">
                    <div class="like_img"><img
                            src="<%=path%>/Product_main_photo/<%=goodsModel.getEid()%>/<%=model.getGid()%>.jpg"
                            alt="暂无图片">
                    </div>
                    <div class="like_span">
                        <p><%=model.getGdescribe()%>
                        </p>
                        <i class="fa fa-jpy" aria-hidden="true"></i>
                        <span class="mony"><%=model.getGprice()%></span>
                    </div>
                </li>
                <%
                            }
                        }
                    }
                %>
            </ul>
        </div>
        <%--        侧边导航栏--%>
        <div class="rightnav" id="nav">
            <ul>
                <li>
                    <a href="javascript:void(0)" onclick="like()">
                        <span>猜你喜欢</span>
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/jsp/admin/adminLogin.jsp">
                        <span><i class="fa fa-line-chart" aria-hidden="true"></i></span>
                        <span>后台</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span><i class="fa fa-commenting-o" aria-hidden="true"></i></span>
                        <span>客服</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                        <span>反馈</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span><i class="fa fa-angle-up" aria-hidden="true"></i></span>
                        <span>顶部</span>
                    </a>
                </li>
            </ul>
        </div>
        <%--        底部信息--%>
        <div class="foot"></div>
    </body>
    <script>
        function getSelect() {
            window.location.href = "<%=path%>/customerServlet?action=search&search=" + document.getElementById("search2").value;
        }

        function getGcategory(m) {
            window.location.href = "<%=path%>/customerServlet?action=searchGcaetgory&search=" + m;
        }

        function hiddenMessagre() {
            document.getElementById("messager").style.display = "none";
        }

        function showlikeGoods(cid) {
            q()
            if (cid === null) {
                document.getElementById("showFansGoods").innerHTML = "请先登录";
            } else {
                var url = "<%=path%>/customerServlet?action=showFansGoods&cid=" + cid;
                let xml = new XMLHttpRequest();
                xml.open("GET", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        var json = JSON.parse(xml.responseText);
                        var str = "";
                        for (var i = 0; i < json.length; i++) {
                            str += "<li onclick='window.open(\"<%=path%>/jsp/user/goodsDetails.jsp?gid=" + json[i].gid + "&eid=" + json[i].eid + "&cid=" + cid + "\")'>" +
                                "<div class='like_img'><img src='<%=path%>/Product_main_photo/" + json[i].eid + "/" + json[i].gid + ".jpg' alt='暂无图片'></div>" +
                                "<div class='like_span'>" +
                                "<p>" + json[i].gdescribe + "</p>" +
                                "<i class='fa fa-jpy' aria-hidden='true'></i>" +
                                "<span class='mony'>" + json[i].gprice + "</span>" +
                                "</div>" +
                                "</li>";
                        }
                        document.getElementById("showFansGoods").innerHTML = str;
                    }
                }
                xml.send(null);
            }
        }

        function q() {
            window.document.getElementById("one11").removeAttribute("checked");
            window.document.getElementById("two11").setAttribute("checked", "checked");
        }

    </script>
</html>
