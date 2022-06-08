<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.GoodsModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.EntityModel" %>
<%@ page import="com.entity.EmployeeModel" %>
<%--
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
            String name = (String) request.getSession().getAttribute("username");
            String eid = (String) request.getSession().getAttribute("eid");
            int count = (int) request.getSession().getAttribute("allgoodsCount");
            int pageCount = count / 15 + 1;
            List<GoodsModel> list = EBofactory.getgoodsebiempl().getGcategory();
            List<List<EntityModel>> listList = EBofactory.getotherEbimpl().getList(eid, "yes", "", "", "", "", "all");
            List<EmployeeModel> list1 = EBofactory.getemployeeebiempl().getEmployee(eid);
        %>
        <title>管理员</title>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=path%>/css/merchants.css" rel="stylesheet">
    </head>
    <script type="text/javascript">
        function deleteCheck(deleteGid) {
            if (window.confirm("确定删除以下商品？\n商品编号：" + deleteGid)) {
                window.open("<%=path%>/merchantsServlet?action=delete&gid=" + deleteGid, "_self")
            }
        }

        //    搜索
        function selectSearch() {
            const selectText = document.getElementById("select").value;
            const myselect = document.getElementById("selecteange");
            const index = myselect.selectedIndex;
            const url = "<%=path%>/merchantsServlet?action=select&selectGid=" + selectText + "&selectOption=" + myselect.options[index].value;
            window.open(url, "_self");
        }

        function outlogin() {
            if (window.confirm("确定是否退出登录？")) {
                let xml = new XMLHttpRequest();
                xml.open("GET", "<%=path%>/merchantsPersonServlet?action=deleteCookie", true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        window.open("<%=path%>/jsp/index.jsp", "_self")
                    }
                }
                xml.send(null);
            }
        }
    </script>
    <body>
        <div class="navbar">
            <input type="checkbox" id="checkbox">
            <label for="checkbox" class="label">
                <i class="fa fa-bars check" aria-hidden="true"></i>
            </label>
            <p id="outlogin" onclick="outlogin()">退出登录</p>
            <div class="main">
                <div class="left">
                    <ul>
                        <li>
                            <img src="<%=path%>/merchantsImg/<%=eid%>.jpg" alt="暂无图片">
                            <span>欢迎您，<%=name%></span>
                        </li>
                        <li>
                            <a href="javascript:void(0);" id="b" onclick="bOnclick()">
                                <i class="fa fa-sitemap" aria-hidden="true"></i>
                                <span>商品管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" id="c" onclick="cOnclick()">
                                <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                                <span>订单列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" id="d" onclick="showPerson()">
                                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                <span>个人中心</span>
                            </a>
                            <div class="personinfonation" id="personinfonation">
                                <div class="personalnformation">
                                    <div>
                                        <span>个人信息</span>
                                        <span onclick="reruen()">返回</span>
                                    </div>
                                    <div class="line"></div>
                                    <table class="table">
                                        <tr>
                                            <td>头像</td>
                                            <td>
                                                <form action="<%=path%>/merchantsPersonServlet" method="post"
                                                      enctype="multipart/form-data" id="form">
                                                    <input type="hidden" name="action" value="touxiang">
                                                    <input type="file" accept="image/jpeg" name="touxiang">
                                                    <input type="submit" value="点击上传" id="touxiang">
                                                </form>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>账号</td>
                                            <td><input type="text" id="eid" readonly="readonly"
                                                       value="<%=list1.get(0).getEid()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>姓名</td>
                                            <td><input type="text" id="ename" readonly="readonly"
                                                       value="<%=list1.get(0).getEname()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>店名</td>
                                            <td><input type="text" id="estorename" readonly="readonly"
                                                       value="<%=list1.get(0).getEstorename()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>电话</td>
                                            <td><input type="text" id="ephone" readonly="readonly"
                                                       value="<%=list1.get(0).getEphone()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>地址</td>
                                            <td><input type="text" id="eaddress" readonly="readonly"
                                                       value="<%=list1.get(0).getEaddress()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>密码</td>
                                            <td><span id="a"
                                                      onclick="window.open('<%=path%>/jsp/index.jsp')">点击前往重置密码</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>性别</td>
                                            <td>
                                                <div class="q" id="q">
                                                    <input type="text" readonly="readonly"
                                                           value="<%=list1.get(0).getEsex()!=null?(list1.get(0).getEsex().equals("male")?"男":"女"):"null"%>">
                                                </div>
                                                <div class="w" id="w">
                                                    <input class="ssex" type="radio" name="csex" value="male"
                                                           readonly="readonly" id="nan" checked>男
                                                    <input class="ssex" type="radio" name="csex" value="fmale"
                                                           readonly="readonly" id="nv">女
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="perbottom">
                                        <button onclick="okupdate1()">点击修改</button>
                                        <button onclick="updatePerson1('<%=path%>')" disabled="disabled" id="okButton">
                                            确认修改
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="right">
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
                                <div class="button" onclick="showgoods()"><i class="fa fa-search" aria-hidden="true"
                                                                             id="btnaa"></i></div>
                            </form>
                            <%--所有商品--%>
                            <table class="goods_head">
                                <tr>
                                    <th>商品编号</th>
                                    <th>商品名称</th>
                                    <th>商品类别</th>
                                    <th>库存量</th>
                                    <th>商品进价</th>
                                    <th>商品价格</th>
                                    <th>查看详情</th>
                                    <th>删除</th>
                                    <th>修改</th>
                                </tr>
                            </table>
                            <div class="box">
                                <table class="goods" id="goodstable">
                                    <%--录入商品表格信息--%>
                                    <%
                                        if (arrayList != null) {
                                            System.out.println(arrayList.size());
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
                                        </td>
                                        <td><%=goods.getGinprice()%>
                                        </td>
                                        <td><%=goods.getGprice()%>
                                        </td>
                                        <td onclick="showgoodsimg('<%=goods.getGid()%>','<%=goods.getGdescribe()%>')"><i
                                                class="fa fa-info-circle"
                                                aria-hidden="true"></i></td>
                                        <td onclick="deleteCheck('<%=goods.getGid()%>')"><i class="fa fa-trash-o"
                                                                                            aria-hidden="true"></i></td>
                                        <td onclick='update("<%=goods.getGid()%>","<%=goods.getGname()%>","<%=goods.getGcategory()%>","<%=goods.getGnum()%>","<%=goods.getGinprice()%>","<%=goods.getGprice()%>","<%=goods.getGdescribe()%>")'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i></td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                </table>
                            </div>
                            <ul class="paging">
                                <li class="pageCount">第&nbsp;<span id="pagenum">1</span>&nbsp;页</li>
                                <li class="pageCount"> /</li>
                                <li class="pageCount">共&nbsp;<span id="allcount"><%=pageCount%></span>&nbsp;页</li>
                                <li class="pageCount">跳转到第</li>
                                <li class="pageCount"><input id="jumpNumChoose" type="number" class="pageSelect" min="1"
                                                             max="<%=pageCount%>"></li>
                                <li class="pageCount">页</li>
                                <li class="pageCount" onclick="jumpPage(1)">跳转</li>
                                <li class="pageCount" onclick="jumpPage(2)">首页</li>
                                <li class="pageCount" onclick="jumpPage(3)">上一页</li>
                                <li class="pageCount" onclick="jumpPage(4)">下一页</li>
                            </ul>
                            <input type="checkbox" id="add" onclick="isCheck(this)">
                            <label for="add" class="addGoods">
                                <i class="fa fa-plus" aria-hidden="true" id="ia"></i></label>
                            <%--添加商品--%>
                            <div class="addbottom" id="addbottom">
                                <div class="addleft" id="localImg">
                                    <img src="" alt="暂无图片" class="img_goods" id="img">
                                </div>
                                <form action="<%=path%>/merchantsServlet" class="addform" enctype="multipart/form-data"
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
                                        <select class="minput" name="gcategory">
                                            <%
                                                if (!list.isEmpty()) {
                                                    for (GoodsModel goodsModel : list) {
                                            %>
                                            <option value="<%=goodsModel.getGcategory()%>"><%=goodsModel.getGcategory()%>
                                            </option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select><br>
                                        <p class="im">库存量</p>
                                        <input type="text" name="gnum" class="minput"><br>
                                        <p class="im">商品进价</p>
                                        <input type="text" name="ginprice" class="minput"><br>
                                        <p class="im">商品售价</p>
                                        <input type="text" name="gprice" class="minput"><br>
                                        <p class="im">会员商品</p>
                                        <select class="minput" name="isvip">
                                            <option value="yes">是</option>
                                            <option value="no">否</option>
                                        </select>
                                        <div class="boxtextarea">
                                            <p class="im imm">商品描述</p>
                                            <textarea name="gdescribe" class="minput textarea"
                                                      maxlength="120"></textarea>
                                        </div>
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
                                <form action="<%=path%>/merchantsServlet" class="addform" enctype="multipart/form-data"
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
                                        <select class="minput" name="gcategory" id="ugcategory">
                                            <%
                                                if (!list.isEmpty()) {
                                                    for (GoodsModel goodsModel : list) {
                                            %>
                                            <option value="<%=goodsModel.getGcategory()%>"><%=goodsModel.getGcategory()%>
                                            </option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select><br>
                                        <p class="im">库存量</p>
                                        <input type="text" name="gnum" class="minput" id="ugnum"><br>
                                        <p class="im">商品进价</p>
                                        <input type="text" name="ginprice" class="minput" id="uginprice"><br>
                                        <p class="im">商品售价</p>
                                        <input type="text" name="gprice" class="minput" id="ugprice"><br>
                                        <p class="im">会员商品</p>
                                        <select class="minput" name="isvip">
                                            <option value="yes">是</option>
                                            <option value="no">否</option>
                                        </select>
                                        <div class="boxtextarea">
                                            <p class="im imm">商品描述</p>
                                            <textarea name="gdescribe" class="minput textarea"
                                                      maxlength="120" id="ugdescribe"></textarea>
                                        </div>
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
                                <div class="left">
                                    <div class="addleft">
                                        <img src="" alt="暂无图片" class="img_goods" id="img2">
                                    </div>
                                    <div class="ditaboxtextarea">
                                        <p>商品描述</p>
                                        <textarea disabled="disabled" id="goodsImgtextarea"></textarea>
                                    </div>
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
                        <div class="top">
                            <p class="p">所有订单列表</p>
                            <%--搜索--%>
                            <form class="select">
                                <input type="text" placeholder="搜索内容" class="chooseinput1" name="selectContent"
                                       id="t-select1">
                                <div class="button" onclick="change(<%=eid%>)"><i class="fa fa-search"
                                                                                  aria-hidden="true"
                                                                                  id="t-btnaa"></i></div>
                            </form>
                        </div>
                        <div class="bottom">
                            <div class="bottom-top">
                                <span>发货状态筛选</span>
                                <select name="" id="status" onchange="isDisabled(<%=eid%>)">
                                    <option value="all">全部</option>
                                    <option value="no">未发货</option>
                                    <option value="yes">已发货</option>
                                </select>
                                <span>时间筛选</span>
                                <input type="date" id="begin" onchange="change(<%=eid%>)">
                                <span>-</span>
                                <input type="date" id="end" onchange="change(<%=eid%>)">
                                <button id="button" onclick="tiddelivey(<%=eid%>)">一键发货</button>
                            </div>
                            <div class="bottom-bottom">
                                <div class="bar">
                                    <span>选择</span>
                                    <span>订单编号</span>
                                    <span>下单时间</span>
                                    <span>商品编号</span>
                                    <span>收货信息</span>
                                    <span>发货状态</span>
                                </div>
                                <div class="table">
                                    <table id="table">
                                        <%
                                            for (int i = 0; i < listList.size(); i++) {
                                        %>
                                        <tr>
                                            <td><input type="checkbox"
                                                       class="orderChecked <%=listList.get(i).get(0).getOid()%>"></td>
                                            <td><%=listList.get(i).get(0).getOid()%>
                                            </td>
                                            <td><%=listList.get(i).get(0).getTdate()%>
                                            </td>
                                            <td>
                                                <%
                                                    for (int j = 0; j < listList.get(i).size(); j++) {
                                                %>
                                                <p><%=listList.get(i).get(j).getGid()%>
                                                </p>
                                                <%
                                                    }
                                                %>
                                            </td>
                                            <td>
                                                <p><%=listList.get(i).get(0).getRname()%>
                                                </p>
                                                <p><%=listList.get(i).get(0).getRadd()%>
                                                </p>
                                            </td>
                                            <td><%=listList.get(i).get(0).getMessage()%>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                                <div class="bb-bottom">
                                    <input type="checkbox" id="allChecked" onclick="orderChecked()">
                                    <label for="allChecked">全选</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function update(gid, gname, gcategory, gnum, ginprice, gpeice, gdescribe) {
                updatebottom.style.transform = "scaleX(1)"
                document.getElementById("img1").src = "<%=path%>/Product_main_photo/<%=eid%>/" + gid + ".jpg";
                document.getElementById("ugid").value = gid;
                document.getElementById("ugname").value = gname;
                document.getElementById("ugnum").value = gnum;
                document.getElementById("uginprice").value = ginprice;
                document.getElementById("ugprice").value = gpeice;
                document.getElementById("ugcategory").value = gcategory;
                document.getElementById("ugdescribe").value = gdescribe;
            }

            function showgoodsimg(gid, gdescribe) {
                document.getElementById("img2").src = "<%=path%>/Product_main_photo/<%=eid%>/" + gid + ".jpg";
                if (gdescribe != null) {
                    document.getElementById("goodsImgtextarea").value = gdescribe;
                }
                showimg.style.transform = "scaleY(1)"
            }

            let choice;

            //    刷新
            function allGoods() {
                choice = 2;
                window.open("<%=path%>/merchantsServlet?action=all", "_self")
            }

            //查询商品
            function showgoods() {
                choice = 1;
                const selectText = document.getElementById("select").value;
                const myselect = document.getElementById("selecteange");
                const index = myselect.selectedIndex;
                const url = "<%=path%>/merchantsServlet?action=select&selectGid=" + selectText + "&selectOption=" + myselect.options[index].value + "&pageNum=1";
                let xml = new XMLHttpRequest();
                xml.open("get", url, true)
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        let vals = xml.responseText;
                        let jsonArr = eval(vals);
                        tableinner(jsonArr);
                        for (let goods of jsonArr) {
                            document.getElementById("allcount").innerText = Math.floor(Number(goods.allCount) / 15) + 1;
                            document.getElementById("jumpNumChoose").max = Math.floor(Number(goods.allCount) / 15) + 1;
                            break;
                        }
                    }
                }
                xml.send(null);
            }

            //    跳转到首页
            function jumpPage(pagenum) {
                const pageNow = document.getElementById("pagenum").innerText;
                const pageNow1 = document.getElementById("jumpNumChoose").value;
                const maxPage = document.getElementById("allcount").innerText;
                //跳转到的页数
                let jumpPage;
                switch (pagenum) {
                    case 1:
                        if (Number(pageNow1) > Number(maxPage) || Number(pageNow1) < 0) {
                            alert("选择页数超过最大页数或小于0")
                            document.getElementById("jumpNumChoose").focus();
                            return false;
                        }
                        jumpPage = pageNow1;
                        break;
                    case 2:
                        jumpPage = 1;
                        break;
                    case 3:
                        if (Number(pageNow) - 1 > 0) {
                            jumpPage = Number(pageNow) - 1;
                        } else {
                            jumpPage = 1;
                        }
                        break;
                    case 4:
                        if (Number(pageNow) + 1 <= maxPage) {
                            jumpPage = Number(pageNow) + 1;
                        } else {
                            jumpPage = maxPage;
                        }
                        break;
                }
                let url;
                switch (choice) {
                    case 1:
                        const selectText = document.getElementById("select").value;
                        const myselect = document.getElementById("selecteange");
                        const index = myselect.selectedIndex;
                        url = "<%=path%>/merchantsServlet?action=select&selectGid=" + selectText + "&selectOption=" + myselect.options[index].value + "&pageNum=" + jumpPage;
                        break;
                    case 2:
                        //所有
                        url = "<%=path%>/merchantsServlet?action=paging&pageNum=" + jumpPage;
                        break;
                }
                let xml = new XMLHttpRequest();
                xml.open("get", url, true)
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        let vals = xml.responseText;
                        let jsonArr = eval(vals);
                        tableinner(jsonArr);
                        document.getElementById("pagenum").innerText = jumpPage;
                    }
                }
                xml.send(null);
            }

            function check(form) {
                //    商品编号输入框不为空
                if (form.gid.value === "") {
                    alert("商品编号为空");
                    form.gid.focus();
                    return false;
                }
                //    验证价格最多两位小数
                const regu = /^(([0-9]+)|([0-9]+\.[0-9]{0,2}))$/;
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
                const regu1 = /^\d+$/;
                if (form.gnum.value !== "" && !regu1.test(form.gnum.value)) {
                    alert("库存量请输入非负整数")
                    form.gnum.focus();
                    return false;
                }
            }

            choice = 2;
            const first = document.getElementById("first")
            const second = document.getElementById("second")
            const third = document.getElementById("third")
            const a = document.getElementById("a")
            const b = document.getElementById("b")
            const c = document.getElementById("c")
            const d = document.getElementById("d")
            const updatebottom = document.getElementById("updatebottom")
            const addbottom = document.getElementById("addbottom")
            const showimg = document.getElementById("showimg")

            function bOnclick() {
                second.style.display = "block";
                third.style.display = "none";
            }

            function cOnclick() {
                second.style.display = "none";
                third.style.display = "block";
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

            function isCheck(e) {
                if (e.checked) {
                    addbottom.style.transform = "scaleX(1)"
                } else {
                    addbottom.style.transform = "scaleX(0)"
                }
            }

            function tableinner(jsonArr) {
                let temp = '';
                let table = document.getElementById("goodstable");
                for (let goods of jsonArr) {
                    const a = "showgoodsimg('" + goods.gid + "','" + goods.gdescribe + "')";
                    const b = "deleteCheck('" + goods.gid + "')";
                    const c = "update('" + goods.gid + "','" + goods.gname + "','" + goods.gcategory + "','" + goods.gnum + "','" + goods.ginprice + "','" + goods.gprice + "')";
                    temp +=
                        '<tr>' +
                        '<td>' + goods.gid + '</td>' +
                        '<td>' + goods.gname + '</td>' +
                        '<td>' + goods.gcategory + '</td>' +
                        '<td>' + goods.gnum + '</td>' +
                        '<td>' + goods.ginprice + '</td>' +
                        '<td>' + goods.gprice + '</td>' +
                        '<td onclick=' + a + '><i class="fa fa-info-circle" aria-hidden="true"></i></td>' +
                        '<td onclick=' + b + '><i class="fa fa-trash-o" aria-hidden="true"></i></td>' +
                        '<td onclick=' + c + '><i class="fa fa-pencil-square-o" aria-hidden="true"></i></td>' +
                        '</tr>'
                }
                table.innerHTML = temp;
            }

            function isDisabled(eid) {
                const select = document.getElementById("status");
                const index = select.selectedIndex;
                if (select[index].value === "yes") {
                    document.getElementById("button").style.display = "none";
                } else {
                    document.getElementById("button").style.display = "block";
                }
                change(eid)
            }

            function orderChecked() {
                const input = document.getElementsByClassName("orderChecked");
                if (document.getElementById("allChecked").checked) {
                    for (let i = 0; i < input.length; i++) {
                        input[i].checked = true;
                    }
                } else {
                    for (let i = 0; i < input.length; i++) {
                        input[i].checked = false;
                    }
                }
            }

            function change(eid) {
                var search = document.getElementById("t-select1").value;
                var begin = document.getElementById("begin").value;
                var end = document.getElementById("end").value;
                var choose = document.getElementById("status")
                var index = choose.selectedIndex;
                var value = choose.options[index].value;
                var url;
                url = "<%=path%>/merchantsServlet?action=getEmployeeOrder&eid=" + eid + "&search=" + search + "&value=" + value + "&begin=" + begin + "&end=" + end;
                let xml = new XMLHttpRequest();
                xml.open("get", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        let vals = xml.responseText;
                        let jsonArr = eval(vals);
                        var item = "";
                        for (let i = 0; i < jsonArr.length; i++) {
                            item += "<tr>" +
                                "<td><input type=\"checkbox\" class=\"orderChecked" + " " + jsonArr[i][0].oid + "\"></td>" +
                                "<td>" + jsonArr[i][0].oid + "</td>" +
                                "<td>" + jsonArr[i][0].tdate + "</td>" +
                                "<td>";
                            let items = "";
                            for (let j = 0; j < jsonArr[i].length; j++) {
                                items += "<p>" + jsonArr[i][j].gid + "</p>";
                            }
                            item += items;
                            item += "</td>" +
                                "<td>" +
                                "<p>" + jsonArr[i][0].rname + "</p>" +
                                "<p>" + jsonArr[i][0].radd + "</p>" +
                                "</td>" +
                                "<td>" + jsonArr[i][0].message + "</td>" +
                                "</tr>";
                        }
                        document.getElementById("table").innerHTML = item;
                    }
                }
                xml.send(null)
            }

            function tiddelivey(eid) {
                var orderChecked = document.getElementsByClassName("orderChecked");
                var oid = [];
                let index = 0;
                for (let i = 0; i < orderChecked.length; i++) {
                    if (orderChecked[i].checked) {
                        oid[index] = orderChecked[i].className.split(" ")[1];
                        index++;
                    }
                }
                var url = "<%=path%>/merchantsServlet?action=setTisdelivey&eid=" + eid + "&oid=" + oid;
                let xml = new XMLHttpRequest();
                xml.open("get", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        alert("一键发货成功");
                        change(eid)
                    }
                }
                xml.send(null)
            }

            function showPerson() {
                document.getElementById("personinfonation").style.display = 'block';
            }

            function okupdate1() {
                document.getElementById("q").style.display = "none";
                document.getElementById("w").style.display = "block";
                document.getElementById("okButton").removeAttribute("disabled")
                document.getElementById("ename").removeAttribute("readonly");
                document.getElementById("estorename").removeAttribute("readonly");
                document.getElementById("ephone").removeAttribute("readonly");
                document.getElementById("eaddress").removeAttribute("readonly");
            }

            function updatePerson1(path) {
                var eid = document.getElementById("eid").value;
                var ename = document.getElementById("ename").value;
                var estorename = document.getElementById("estorename").value;
                var ephone = document.getElementById("ephone").value;
                var eaddress = document.getElementById("eaddress").value;
                var sex = document.getElementsByClassName("ssex")
                var sex1;
                for (let i = 0; i < sex.length; i++) {
                    if (sex[i].checked) {
                        sex1 = sex[i].value;
                    }
                }
                var url = path + "/merchantsPersonServlet?action=update&eid=" + eid + "&ename=" + ename + "&estorename=" + estorename + "&cesx=" + sex1 + "&ephone=" + ephone + "&eaddress=" + eaddress;
                let xml = new XMLHttpRequest();
                xml.open("get", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        alert("修改成功")
                        window.location.reload()
                    }
                }
                xml.send(null)
            }

            function reruen() {
                document.getElementById("personinfonation").style.display = 'none';
            }
        </script>
    </body>
</html>
