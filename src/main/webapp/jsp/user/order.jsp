<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.Daofactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.entity.CustomerModel" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/29
  Time: 16:14
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            //分别为eid gid num
            double numPrice = 0.0;
            int numCount = 0;
            String path = request.getContextPath();
            String arr = request.getParameter("arr");
            String cid = (String) request.getSession().getAttribute("cid");
            String[] split = arr.split(",");
            List<List<String>> list = new ArrayList<>();
            for (int i = 0; i < split.length; i += 3) {
                List<String> stringList = new ArrayList<>();
                stringList.add(split[i]);
                stringList.add(split[i + 1]);
                stringList.add(split[i + 2]);
                numCount += Integer.parseInt(split[i + 2]);
                list.add(stringList);
            }
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String oid = simpleDateFormat.format(date);
            List<CustomerModel> list1 = (List<CustomerModel>) request.getSession().getAttribute("customer");
            String message;
            if (list1.isEmpty()){
                message = "你好，请登录或注册";
            }else {
                message = "您好，"+list1.get(0).getCnickname();
            }
            List<CustomerModel> listRadd = EBofactory.getcustomerebiempl().getCustomerMessage(cid);
        %>
        <title>天天淘-结算页</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsCart.css">
        <link rel="stylesheet" href="<%=path%>/css/order.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
        <div class="progress">
            <div class="p-left">
                <span>天天淘-结算页</span>
            </div>
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
        </div>
        <%--        订单信息--%>
        <div class="order">
            <p class="header">填写并核对订单信息</p>
            <div class="order-bottom">
                <div class="box">
                    <div class="f-top">
                        <p>收货人信息</p>
                        <div class="f-top-right">
                            <a href="javascript:void(0)" onclick="person('personalnformation111',1,'<%=cid%>','<%=path%>>')">修改收货地址</a>
                            <a href="javascript:void(0)" onclick="person('personalnformation111',1,'<%=cid%>','<%=path%>>')">新增收货地址</a>
                        </div>
                    </div>
                    <div class="f-bottom">
                        <span>收货人</span>
                        <select name="name" id="name" onchange="rname()">
                            <%
                                for (CustomerModel customerModel : listRadd) {
                            %>
                            <option value="<%=customerModel.getRname()%>"><%=customerModel.getRname()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                        <span>收货地址</span>
                        <select name="address" id="address" onchange="radd()">
                            <%
                                for (CustomerModel customerModel : listRadd) {
                            %>
                            <option value="<%=customerModel.getRadd()%>"><%=customerModel.getRadd()%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="line"></div>
                <div class="box">
                    <div class="f-top">
                        <p>支付方式</p>
                    </div>
                    <div class="f-bottom">
                        <input type="radio" name="zfu" value="weixin" id="huodao" checked class="radio">
                        <label for="huodao">货到付款</label>
                        <input type="radio" name="zfu" value="weixin" id="weixin" checked class="radio">
                        <label for="weixin">微信支付</label>
                        <input type="radio" name="zfu" value="zifubao" id="zifubao" class="radio">
                        <label for="zifubao">支付宝</label>
                    </div>
                </div>
                <div class="line"></div>
                <div class="box">
                    <div class="f-top">
                        <p>送货清单</p>
                        <div class="f-top-right">
                            <a href="<%=path%>/jsp/user/goodsCart.jsp?cid=<%=cid%>">返回购物车</a>
                        </div>
                    </div>
                    <div class="t-bottom">
                        <ul>
                            <%
                                for (List<String> strings : list) {
                                    List<GoodsModel> goodsModels = EBofactory.getgoodsebiempl().getGidEid(strings.get(1), strings.get(0));
                                    numPrice += Integer.parseInt(strings.get(2)) * goodsModels.get(0).getGprice();
                            %>
                            <li>
                                <div class="goods">
                                    <div class="img">
                                        <img src="<%=path%>/Product_main_photo/<%=goodsModels.get(0).getEid()%>/<%=goodsModels.get(0).getGid()%>.jpg"
                                             alt="">
                                    </div>
                                    <span class="text"><%=goodsModels.get(0).getGdescribe()%></span>
                                    <span class="price">￥<%=goodsModels.get(0).getGprice()%></span>
                                    <span class="num">X<%=strings.get(2)%></span>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="order-statistical">
            <table>
                <tr>
                    <td>数目合计：</td>
                    <td><%=numCount%>
                    </td>
                </tr>
                <tr>
                    <td>价格合计：</td>
                    <td>￥<%=numPrice%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="order-message">
            <div class="f">
                <span>应付总额：</span>
                <span>￥<%=numPrice%></span>
            </div>
            <div class="s">
                <span>寄送至：</span>
                <span id="radd"></span>
                <span>收货人：</span>
                <span id="rname"></span>
            </div>
        </div>
        <div class="submit">
            <button onclick="jumpPay()">提交订单</button>
        </div>
    </body>
    <script>
        function jumpPay() {
            //跳转传递信息
            var a = document.getElementById("name");
            var ainde = a.selectedIndex;
            var b = document.getElementById("address");
            var binde = b.selectedIndex;
            //支付方式
            var fangshi
            var zifu = document.getElementsByClassName("radio");
            for (let i = 0; i < zifu.length; i++) {
                if (zifu[i].checked) {
                    fangshi = zifu[i].value;
                }
            }
            //添加到未支付订单
            var url = "<%=path%>/customerServlet?action=addOrder&arr=<%=arr%>&rname=" + a.options[ainde].innerText + "&tpay=<%=numPrice%>&cid=<%=cid%>&oid=<%=oid%>";
            let xml = new XMLHttpRequest();
            xml.open("get", url, true);
            xml.onreadystatechange = function () {
                console.log(xml.readyState)
                console.log(xml.status)
                if (xml.readyState === 4 && xml.status === 200) {
                    window.location.href = '<%=path%>/jsp/user/pay.jsp?num=<%=numCount%>&numPrice=<%=numPrice%>&address=' + a.options[ainde].innerText + b.options[binde].innerText + "&zifu=" + fangshi + "&cid=<%=cid%>&oid=<%=oid%>";
                }
            }
            xml.send(null);
        }

        function rname() {
            var input = document.getElementById("name");
            var index = input.selectedIndex;
            document.getElementById("rname").innerText = input.options[index].innerText;
        }

        function radd() {
            var input = document.getElementById("address");
            var index = input.selectedIndex;
            document.getElementById("radd").innerText = input.options[index].innerText;
        }
    </script>
</html>
