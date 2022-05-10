<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.GoodsDao" %>
<%@ page import="com.entity.GoodsModel" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.Utils.Utils" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/6
  Time: 8:39
  Description: 管理员界面
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            ArrayList<GoodsModel> arrayList = (ArrayList<GoodsModel>) request.getSession().getAttribute("allGoods");
            String adminName = (String) request.getSession().getAttribute("adminName");
            String name = adminName.substring(0, adminName.length() - 5);
        %>
        <title>管理员</title>
        <link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=path%>/css/admin.css" rel="stylesheet">
    </head>
    <script type="text/javascript">
        window.onload = function () {
            const addbottom = document.getElementById("addbottom");
            addbottom.addEventListener("click", event => {
                event.cancelBubble = true;
            }, false)
        }

        function check(form) {
            //    商品编号输入框不为空
            if (form.gid.value === "") {
                alert("商品编号为空");
                form.gid.focus();
                return false;
            }
            //    验证价格最多两位小数
            var regu = /^(([0-9]+)|([0-9]+\.[0-9]{0,2}))$/;
            if (form.gprice.value !== "" && !regu.test(form.gprice.value)) {
                alert("价格请输入最多两位小数的非负数");
                form.gprice.focus();
                return false;
            }
            if (form.ginprice.value !== "" && !regu.test(form.ginprice.value)) {
                alert("价格请输入最多两位小数的非负数");
                form.ginprice.focus();
                return false;
            }
            //    验证数量为非负数
            var regu1 = /^\d+$/
            if (form.gnum.value !== "" && !regu1.test(form.gnum.value)) {
                alert("库存量请输入非负整数")
                form.gnum.focus();
                return false;
            }
        }

        function deleteCheck(deleteGid) {
            if (window.confirm("确定删除以下商品？\n商品编号：" + deleteGid)) {
                window.open("<%=path%>/adminServlet?action=delete&gid=" + deleteGid, "_self")
            }
        }

        //    搜索
        function selectSearch() {
            var selectText = document.getElementById("select").value;
            var myselect = document.getElementById("selecteange");
            var index = myselect.selectedIndex;
            var url = "<%=path%>/adminServlet?action=select&selectGid=" + selectText + "&selectOption=" + myselect.options[index].value;
            window.open(url, "_self");
        }

        //    刷新
        function allGoods() {
            window.open("<%=path%>/adminServlet?action=all", "_self")
        }
    </script>
    <body>
        <div class="navbar">
            <input type="checkbox" id="checkbox">
            <label for="checkbox" class="label">
                <i class="fa fa-bars check" aria-hidden="true"></i>
            </label>
            <div class="main">
                <div class="left">
                    <ul>
                        <li>
                            <img src="<%=path%>/img/1.jpg" alt="暂无图片">
                            <span>欢迎您，<%=name%></span>
                        </li>
                        <li>
                            <a href="javascript:void(0);" id="a" onclick="aOnclick()">
                                <i class="fa fa-home" aria-hidden="true"></i>
                                <span>商家首页</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" id="b" onclick="bOnclick()">
                                <i class="fa fa-sitemap" aria-hidden="true"></i>
                                <span>商品管理</span>
                            </a>
                        </li>
                        <%-- <li>
                             <a href="javascript:void(0);" id="c">
                                 <i class="fa fa-th-large" aria-hidden="true"></i>
                                 <span>用户列表</span>
                             </a>
                         </li>--%>
                        <li>
                            <a href="javascript:void(0);" id="c" onclick="cOnclick()">
                                <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                                <span>订单列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" id="d" onclick="dOnclick()">
                                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                <span>个人中心</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="right">
                    <%--商家首页--%>
                    <div class="first" id="first">

                    </div>
                    <%--商品管理--%>
                    <div class="second" id="second">
                        <div class="top">
                            <p class="p">所有商品列表</p>
                            <%--搜索--%>
                            <form class="select">
                                <select name="selecteange" id="selecteange" class="choose">
                                    <option value="all" selected>全部</option>
                                    <option value="selectGid">商品编号</option>
                                    <option value="selectGname">商品名称</option>
                                    <option value="selectGcategory">商品类别</option>
                                </select>
                                <input type="text" placeholder="搜索内容" class="chooseinput" name="selectContent"
                                       id="select">
                                <div class="button" onclick="selectSearch()"><i class="fa fa-search" aria-hidden="true"
                                                                                id="btnaa"></i></div>
                            </form>

                            <table class="goods_head">
                                <tr>
                                    <th>商品编号</th>
                                    <th>商品名称</th>
                                    <th>商品类别</th>
                                    <th>库存量</th>
                                    <th>商品进价</th>
                                    <th>商品价格</th>
                                    <th>查看主图</th>
                                    <th>删除</th>
                                    <th>修改</th>
                                </tr>
                            </table>
                            <table class="goods">
                                <%--录入商品表格信息--%>
                                <%
                                    if (arrayList != null) {
                                        for (GoodsModel goods : arrayList) {
                                %>
                                <tr>
                                    <td><%=goods.getGid()%>
                                    </td>
                                    <td><%=goods.getGname()%>
                                    </td>
                                    <td><%=goods.getGcategory()%>
                                    </td>
                                    <td><%=goods.getGnum()%>
                                    <td><%=goods.getGnum()%>
                                    </td>
                                    <td><%=goods.getGinprice()%>
                                    </td>
                                    <td><%=goods.getGprice()%>
                                    </td>
                                    <td onclick="showgoodsimg('<%=goods.getGid()%>')"><i class="fa fa-info-circle"
                                                                                         aria-hidden="true"></i></td>
                                    <td onclick="deleteCheck('<%=goods.getGid()%>')"><i class="fa fa-trash-o"
                                                                                        aria-hidden="true"></i></td>
                                    <td onclick='update("<%=goods.getGid()%>","<%=goods.getGname()%>","<%=goods.getGcategory()%>","<%=goods.getGnum()%>","<%=goods.getGinprice()%>","<%=goods.getGprice()%>")'>
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </table>
                            <input type="checkbox" id="add" onclick="isCheck(this)">
                            <label for="add" class="addGoods">
                                <i class="fa fa-plus" aria-hidden="true" id="ia"></i></label>
                            <%--添加商品--%>
                            <div class="addbottom" id="addbottom">
                                <div class="addleft" id="localImg">
                                    <img src="" alt="暂无图片" class="img_goods" id="img">
                                </div>
                                <form action="<%=path%>/adminServlet" class="addform" enctype="multipart/form-data"
                                      method="post">
                                    <input type="hidden" name="action" value="insert">
                                    <div class="addmiddle">
                                        <p class="im">商品主图</p>
                                        <input type="file" name="file" class="minput"
                                               onchange="showImg(this)" accept="image/jpeg" multiple="multiple"><br>
                                        <p class="im">商品编号</p>
                                        <input type="text" name="gid" class="minput"><br>
                                        <p class="im">商品名称</p>
                                        <input type="text" name="gname" class="minput"><br>
                                        <p class="im">商品类别</p>
                                        <input type="text" name="gcategory" class="minput"><br>
                                        <p class="im">库存量</p>
                                        <input type="text" name="gnum" class="minput"><br>
                                        <p class="im">商品进价</p>
                                        <input type="text" name="ginprice" class="minput"><br>
                                        <p class="im">商品售价</p>
                                        <input type="text" name="gprice" class="minput">
                                    </div>
                                    <div class="addright">
                                        <input type="submit" value="确定" class="submit"
                                               onclick="return check(this.form)"/>
                                        <input type="reset" value="重置" class="reset"/>
                                    </div>
                                </form>
                            </div>

                            <input type="checkbox" id="all" onclick="allGoods()">
                            <label for="all" class="allGoods">
                                <i class="fa fa-refresh" aria-hidden="true" id="iaa"></i>
                            </label>

                            <%--修改商品信息--%>
                            <div class="updatebottom" id="updatebottom">
                                <div class="addleft">
                                    <img src="" alt="暂无图片" class="img_goods" id="img1">
                                </div>
                                <form action="<%=path%>/adminServlet" class="addform" enctype="multipart/form-data"
                                      method="post">
                                    <input type="hidden" name="action" value="update">
                                    <div class="addmiddle">
                                        <p class="im">商品主图</p>
                                        <input type="file" name="file" class="minput" onchange="showImg1(this)"
                                               multiple="multiple"><br>
                                        <p class="im">商品编号</p>
                                        <input type="text" name="gid" class="minput" id="ugid" readonly="readonly"><br>
                                        <p class="im">商品名称</p>
                                        <input type="text" name="gname" class="minput" id="ugname"><br>
                                        <p class="im">商品类别</p>
                                        <input type="text" name="gcategory" class="minput" id="ugcategory"><br>
                                        <p class="im">库存量</p>
                                        <input type="text" name="gnum" class="minput" id="ugnum"><br>
                                        <p class="im">商品进价</p>
                                        <input type="text" name="ginprice" class="minput" id="uginprice"><br>
                                        <p class="im">商品售价</p>
                                        <input type="text" name="gprice" class="minput" id="ugprice">
                                    </div>
                                    <div class="addright">
                                        <input type="submit" value="确定" class="submit "
                                               onclick="return check(this.form)">
                                        <a href="javascript:void(0);" onclick="reset()" class="updatea"><input
                                                type="reset" value="返回" id="reset"></a>
                                    </div>
                                </form>
                            </div>
                            <%--查看主图--%>
                            <div class="goodsImg" id="showimg">
                                <div class="addleft">
                                    <img src="" alt="暂无图片" class="img_goods" id="img2">
                                </div>
                                <div class="addright">
                                    <a href="javascript:void(0);" onclick="resetImg()" class="updatea"><input
                                            type="reset" value="返回" id="resetimg"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--订单列表--%>
                    <div class="third" id="third">

                    </div>
                    <%--个人中心--%>
                    <div class="fourth" id="fourth">

                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        const first = document.getElementById("first")
        const second = document.getElementById("second")
        const third = document.getElementById("third")
        const fourth = document.getElementById("fourth")
        const a = document.getElementById("a")
        const b = document.getElementById("b")
        const c = document.getElementById("c")
        const d = document.getElementById("d")
        const updatebottom = document.getElementById("updatebottom")
        const addbottom = document.getElementById("addbottom")
        const showimg = document.getElementById("showimg")

        function aOnclick() {
            first.style.display = "block";
            second.style.display = "none";
            third.style.display = "none";
            fourth.style.display = "none";
        }

        function bOnclick() {
            first.style.display = "none";
            second.style.display = "block";
            third.style.display = "none";
            fourth.style.display = "none";
        }

        function cOnclick() {
            first.style.display = "none";
            second.style.display = "none";
            third.style.display = "block";
            fourth.style.display = "none";
        }

        function dOnclick() {
            first.style.display = "none";
            second.style.display = "none";
            third.style.display = "none";
            fourth.style.display = "block";
        }

        function update(gid, gname, gcategory, gnum, ginprice, gpeice) {
            updatebottom.style.transform = "scaleX(1)"
            document.getElementById("img1").src = "<%=path%>/<%=adminName%>/" + gid + ".jpg";
            document.getElementById("ugid").value = gid;
            document.getElementById("ugname").value = gname;
            document.getElementById("ugnum").value = gnum;
            document.getElementById("uginprice").value = ginprice;
            document.getElementById("ugprice").value = gpeice;
            document.getElementById("ugcategory").value = gcategory;
        }

        function reset() {
            updatebottom.style.transform = "scaleX(0)"
        }

        function resetImg() {
            showimg.style.transform = "scaleY(0)"
        }

        //图片更新
        function showImg(cell) {
            document.getElementById('img').src = window.URL.createObjectURL(cell.files[0]);
        }

        function showImg1(cell) {
            document.getElementById('img1').src = window.URL.createObjectURL(cell.files[0]);
        }

        function showgoodsimg(gid) {
            document.getElementById("img2").src = "<%=path%>/<%=adminName%>/" + gid + ".jpg";
            showimg.style.transform = "scaleY(1)"
        }

        function isCheck(e) {
            if (e.checked){
                addbottom.style.transform = "scaleX(1)"
            }else {
                addbottom.style.transform = "scaleX(0)"
            }
        }

    </script>
</html>
