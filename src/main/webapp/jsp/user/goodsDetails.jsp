<%@ page import="java.util.List" %>
<%@ page import="com.dao.GoodsDaoImpl" %>
<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.EmployeeModel" %>
<%@ page import="com.entity.CustomerModel" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/31
  Time: 10:52
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            String gid = request.getParameter("gid");
            String eid = request.getParameter("eid");
            String cid = request.getParameter("cid");
            List<GoodsModel> goodsModels = EBofactory.getgoodsebiempl().getGidEid(gid,eid);
            GoodsModel g = goodsModels.get(0);
            EmployeeModel employeeModel = EBofactory.getemployeeebiempl().getEmployee(eid).get(0);
            String vcategory = EBofactory.getcustomerebiempl().vcategory(cid);
        %>
        <title>天天淘-商品详情</title>
        <link rel="stylesheet" href="<%=path%>/css/goodsDetails.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="<%=path%>/js/goodsCart.js"></script>
    </head>
    <script>
    </script>
    <body>
        <div class="top">
            <div class="top-left">
                <span>所有商品 > </span>
                <span><%=g.getGcategory()%></span>
                <span> > </span>
                <span><%=g.getGname()%>></span>
            </div>
            <div class="top-right">
                <span><%=employeeModel.getEstorename()%></span>
                <input type="checkbox" id="i">
                <label for="i"><i class="fa fa-star" aria-hidden="true" id="ii"></i>关注店铺</label>
            </div>
        </div>
        <div class="middle">
            <div class="m-left">
                <div class="img">
                    <img src="<%=path%>/Product_main_photo/<%=g.getEid()%>/<%=g.getGid()%>.jpg" alt="暂无图片">
                </div>
            </div>
            <div class="m-right">
                <div class="m-r-top">
                    <p><%=g.getGdescribe()%></p>
                </div>
                <div class="m-r-middle">
                    <div class="m-r-r-m-left">
                        <div class="one">
                            <span>普通售价</span>
                            <span>￥<%=g.getGprice()%></span>
                        </div>
                        <div class="second">
                            <%
                                if (g.getGvip().equals("yes")){
                            %>
                            <span>会员商品</span>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="m-r-r-m-right">
                        <div class="one">
                            <span>库存量</span>
                            <span><%=g.getGnum()%></span>
                        </div>
                        <div class="second">
                            <span>月销量</span>
                            <span>11</span>
                        </div>
                    </div>
                </div>
                <div class="m-r-num">
                    <div>数量</div>
                    <div class="goods-num">
                        <button onclick="down('num')">-</button>
                        <input type="text" min="1" value="1" id="num" disabled="disabled" >
                        <button onclick="up('num')">+</button>
                    </div>
                </div>
                <div class="m-r-submit">
                    <button class="gouwuche" onclick="insertCart(<%=cid%>)">加入购物车</button>
                    <button class="lijigoumai" onclick="noworder()">直接购买</button>
                </div>
            </div>
        </div>
    </body>
    <script>
        function insertCart(cid) {
            if (cid !==null){
                var num = document.getElementById("num").value;
                const url = "<%=path%>/customerServlet?action=insertCart&gid=<%=gid%>&eid=<%=eid%>&cid=<%=cid%>&snum="+num;
                let xml = new XMLHttpRequest();
                xml.open("get",url,true);
                xml.onreadystatechange = function (){
                    if (xml.readyState === 4 && xml.status === 200){
                        alert("添加成功");
                    }
                }
                xml.send(null)
            }else {
                alert("请先登录");
                window.open("<%=path%>/jsp/index.jsp","_self")
            }
        }
        function noworder() {
        //eid gid num
            var eid = "<%=g.getEid()%>";
            var gid = "<%=g.getGid()%>";
            var num = document.getElementById("num").value;
            var arr = [eid,gid, num];
            window.open("<%=path%>/jsp/user/order.jsp?cid=<%=cid%>&arr="+arr+"&vcategory=<%=vcategory%>");
        }
    </script>
</html>
