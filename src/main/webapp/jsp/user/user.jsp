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
                cid = username.substring(0, username.length() - 4);
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("cid", cid);
            }
            List<CustomerModel> list;
            String message;
            if (cid != null) {
                list = EBofactory.getcustomerebiempl().getCustomer(cid);
                request.getSession().setAttribute("customer", list);
                message = "您好，" + list.get(0).getCnickname();
            } else {
                message = "你好，请登录或注册";
            }
        %>
        <title>天天淘</title>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/user.css">
        <link rel="stylesheet" href="<%=path%>/css/personalnformation.css">
        <script src="<%=path%>/js/personalnformation.js"></script>
        <script src="<%=path%>/js/user.js"></script>
    </head>
    <body>
        <%--顶部--%>
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
                <span>今日特价</span>
            </div>
        </div>
        <%--        推荐商品--%>
        <div class="content" id="content">
            <span class="like">猜你喜欢</span>
            <ul class="like_ul">
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
                        <span class="vip">
                            <%
                                if (model.getGvip().equals("yes")) {
                            %>
                            会员商品
                            <%
                                }
                            %>
                        </span>
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
                    <a href="<%=path%>/jsp/admin/adminLogin.jsp">
                        <span><i class="fa fa-line-chart" aria-hidden="true"></i></span>
                        <span>后台</span>
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
    </script>
</html>
