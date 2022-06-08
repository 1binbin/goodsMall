<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.CustomerModel" %>
<%@ page import="com.business.EBofactory" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/28
  Time: 20:04
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            List<GoodsModel> goodsModels = (List<GoodsModel>) request.getSession().getAttribute("goods");
            String search = (String) request.getSession().getAttribute("search");
            String search1 = (String) request.getSession().getAttribute("search1");
            String cid = (String) request.getSession().getAttribute("cid");
            List<CustomerModel> list;
            String message;
            if(cid!=null){
                list = EBofactory.getcustomerebiempl().getCustomer(cid);
                message = "您好，"+list.get(0).getCnickname();
            }else {
                message = "你好，请登录或注册";
            }
            String vipMessage = (String) request.getSession().getAttribute("vipMessage");
        %>
        <title>天天淘</title>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
        <link rel="stylesheet" href="<%=path%>/css/showSelectGoods.css">
        <script src="<%=path%>/js/showSelectGoods.js"></script>
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
                        <a href="<%=path%>/jsp/user/members.jsp"><%=vipMessage%></a>
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
            <%--    修改个人信息--%>
            <%@include file="person.jsp" %>
        </div>
        <%--    LOGO图+搜索框+购物车--%>
        <div class="search" id="search">
            <div class="logo"><img src="<%=path%>/img/1.jpg" alt=""></div>
            <form action="<%=path%>/customerServlet" method="get">
                <input type="hidden" name="action" value="search">
                <input type="text" placeholder="搜索内容" value="<%=search%>" name="search" id="search1">
                <div class="button" onclick="selectSearch1()"><i class="fa fa-search" aria-hidden="true"
                                                                id="btnaa"></i></div>
            </form>
            <div class="cart" onclick="window.open('<%=path%>/jsp/user/goodsCart.jsp?cid=<%=cid%>')">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                <span>购物车</span>
            </div>
        </div>
        <%--筛选--%>
        <div class="select">
            <span>全部结果></span>
            <span id="cahnge"><%=search1%></span>
            <div class="moreselect">
                <div class="up">
                    <div class="left">
                        <span>类别筛选</span>
                    </div>
                    <div class="right">
                        <ul>
                            <li onclick="selectCategory('家用电器',1)">家用电器</li>
                            <li onclick="selectCategory('手机',1)">手机</li>
                            <li onclick="selectCategory('家居' ,1)">家居</li>
                            <li onclick="selectCategory('男装' ,1)">男装</li>
                            <li onclick="selectCategory('女装' ,1)">女装</li>
                            <li onclick="selectCategory('男鞋' ,1)">男鞋</li>
                            <li onclick="selectCategory('女鞋' ,1)">女鞋</li>
                            <li onclick="selectCategory('食品' ,1)">食品</li>
                            <li>
                                <span>更多类别</span>
                                <div class="more-list">
                                    <ul>
                                        <li onclick="selectCategory('医药保健',1)">医药保健</li>
                                        <li onclick="selectCategory('个人清洁',1)">个人清洁</li>
                                        <li onclick="selectCategory('汽车用品',1)">汽车用品</li>
                                        <li onclick="selectCategory('玩具乐器',1)">玩具乐器</li>
                                        <li onclick="selectCategory('礼品鲜花',1)">礼品鲜花</li>
                                        <li onclick="selectCategory('农贸绿植',1)">农贸绿植</li>
                                        <li onclick="selectCategory('运营商',1)">运营商</li>
                                        <li onclick="selectCategory('数码',1)">数码</li>
                                        <li onclick="selectCategory('电脑',1)">电脑</li>
                                        <li onclick="selectCategory('办公',1)">办公</li>
                                        <li onclick="selectCategory('家具',1)">家具</li>
                                        <li onclick="selectCategory('家装',1)">家装</li>
                                        <li onclick="selectCategory('厨具',1)">厨具</li>
                                        <li onclick="selectCategory('童装',1)">童装</li>
                                        <li onclick="selectCategory('美妆',1)">美妆</li>
                                        <li onclick="selectCategory('宠物',1)">宠物</li>
                                        <li onclick="selectCategory('箱包',1)">箱包</li>
                                        <li onclick="selectCategory('钟表',1)">钟表</li>
                                        <li onclick="selectCategory('珠宝',1)">珠宝</li>
                                        <li onclick="selectCategory('运动',1)">运动</li>
                                        <li onclick="selectCategory('户外',1)">户外</li>
                                        <li onclick="selectCategory('房产',1)">房产</li>
                                        <li onclick="selectCategory('汽车',1)">汽车</li>
                                        <li onclick="selectCategory('母婴',1)">母婴</li>
                                        <li onclick="selectCategory('酒类',1)">酒类</li>
                                        <li onclick="selectCategory('生鲜',1)">生鲜</li>
                                        <li onclick="selectCategory('特产',1)">特产</li>
                                        <li onclick="selectCategory('艺术',1)">艺术</li>
                                        <li onclick="selectCategory('图书',1)">图书</li>
                                        <li onclick="selectCategory('文娱',1)">文娱</li>
                                        <li onclick="selectCategory('教育',1)">教育</li>
                                        <li onclick="selectCategory('电子书',1)">电子书</li>
                                        <li onclick="selectCategory('安装',1)">安装</li>
                                        <li onclick="selectCategory('维修',1)">维修</li>
                                        <li onclick="selectCategory('清洗',1)">清洗</li>
                                        <li onclick="selectCategory('二手',1)">二手</li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="down">
                    <div class="left">
                        <span>高级筛选</span>
                    </div>
                    <div class="right">
                        <ul>
                            <li>综合排序</li>
                            <li onclick="selectCategory('最新上架',2)">最新上架</li>
                            <li>
                                <span>价格区间</span>
                                <input type="text" placeholder="￥" id="down">
                                <span>-</span>
                                <input type="text" placeholder="￥" id="up">
                                <span class="price">
                                    <span>清空</span>
                                    <span onclick="selectCategory('价格筛选',3)">确定</span>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%--商品展示--%>
        <div class="content">
            <ul class="like_ul" id="ul">
                <%
                    if (!goodsModels.isEmpty()) {
                        for (GoodsModel goodsModel : goodsModels) {
                %>
                <li onclick="window.open('<%=path%>/jsp/user/goodsDetails.jsp?gid=<%=goodsModel.getGid()%>&eid=<%=goodsModel.getEid()%>')">
                    <div class="like_img"><img
                            src="<%=path%>/Product_main_photo/<%=goodsModel.getEid()%>/<%=goodsModel.getGid()%>.jpg" alt="">
                    </div>
                    <div class="like_span">
                        <p><%=goodsModel.getGdescribe()%>
                        </p>
                        <i class="fa fa-jpy" aria-hidden="true"></i>
                        <span class="mony"><%=goodsModel.getGprice()%></span></div>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
        <div class="rightnav1" id="nav1">
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
        function selectSearch1(){
            window.location.href = "<%=path%>/customerServlet?action=search&search="+document.getElementById("search1").value;
        }
        function selectCategory(n,t) {
            changeValue(n)
            var search  = document.getElementById("search1").value;
            var url;
            if (t === 1) {
                url = "<%=path%>/customerServlet?action=select&search="+search+"&category="+n+"&type=one";
            } else if (t === 3) {
                var down = document.getElementById("down").value;
                var up = document.getElementById("up").value;
                url = "<%=path%>/customerServlet?action=select&search="+search+"&type=three&down="+down+"&up="+up;
            }else if(t === 2){
                url = "<%=path%>/customerServlet?action=select&search="+search+"&type=two";
            }
            let xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", url, true);
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                    const data = xmlhttp.responseText;
                    const json = JSON.parse(data);
                    let html = "";
                    for (let i = 0; i < json.length; i++) {
                        html += "<li onclick='window.open(\"<%=path%>/jsp/user/goodsDetails.jsp?gid="+json[i].gid+"&eid="+json[i].eid+"\")'>" +
                            "<div class='like_img'><img src='<%=path%>/Product_main_photo/" + json[i].eid + "/" + json[i].gid + ".jpg' alt=''></div>" +
                            "<div class='like_span'>" +
                            "<p>" + json[i].gdescribe + "</p>" +
                            "<i class='fa fa-jpy' aria-hidden='true'></i>" +
                            "<span class='mony'>" + json[i].gprice + "</span>" +
                            "</div>" +
                            "</li>";
                    }
                    document.getElementById("ul").innerHTML = html;
                }
            };
            xmlhttp.send(null);
        }
        function changeValue (m){
            document.getElementById("cahnge").innerText = m;
        }
    </script>
</html>
