<%@ page import="com.Utils.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.CustomerModel" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.controller.listener.SessionCounter" %>
<%@ page import="com.entity.GoodsModel" %>
<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/6/5
  Time: 13:19
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            List<CustomerModel> list = EBofactory.getcustomerebiempl().getCustomerVip1("");
        %>
        <title>天天淘-后台</title>
        <link rel="stylesheet" href="<%=path%>/css/admin.css">
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="adtop">
            <p>天天淘后台</p>
            <p>在线用户人数：<%=SessionCounter.getActiveSession()%>
            </p>
        </div>
        <div class="adbottom">
            <div class="adleft">
                <div class="adone">
                    <input type="radio" id="one" name="radio" onclick="change1()" checked class="radio">
                    <label for="one" class="label">首页装扮</label>
                    <div class="souye" id="shouye">
                        <div class="box">
                            <span>轮播图上传</span>
                            <div class="line"></div>
                            <div class="souyeone">
                                <div class="souyeoneleft">
                                    <img src="" alt="" id="img">
                                </div>
                                <div class="souyroneright">
                                    <form action="<%=path%>/AdminLUnServlet" enctype="multipart/form-data"
                                          method="post">
                                        <table>
                                            <tr>
                                                <td>选择图片</td>
                                                <td><input type="file" accept="image/jpeg" onchange="showimg11(this)"
                                                           name="file"></td>
                                            </tr>
                                            <tr>
                                                <td>选择顺序</td>
                                                <td><select name="seleetc" id="select">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                </select></td>
                                            </tr>
                                        </table>
                                        <input type="reset" value="重置" onclick="rese()">
                                        <input type="submit" value="上传">
                                    </form>
                                </div>
                            </div>
                            <span>轮播图预览</span>
                            <div class="line"></div>
                            <div class="souyetwo">
                                <ul>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/1.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/2.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/3.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/4.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/5.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/6.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/7.jpg" alt=""></div>
                                    </li>
                                    <li>
                                        <div class="img"><img src="<%=path%>/shuffling_img/8.jpg" alt=""></div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="adtwo">
                    <input type="radio" id="two" name="radio" onclick="change2()" class="radio">
                    <label for="two" class="label">会员管理</label>
                    <div class="huiyuan" id="huiyuan">
                        <div class="top">
                            <div class="seletc">
                                <span>会员状态筛选</span>
                                <select name="" id="selectc" onchange="selectChange()">
                                    <option value="all">全部</option>
                                    <option value="yes">冻结</option>
                                    <option value="no">未冻结</option>
                                </select>
                            </div>
                            <%--搜索--%>
                            <form class="select">
                                <input type="text" placeholder="搜索内容" class="chooseinput1" name="selectContent"
                                       id="t-select1">
                                <div class="button" onclick="selectChange()"><i class="fa fa-search" aria-hidden="true"
                                                                                id="t-btnaa"></i></div>
                            </form>
                        </div>
                        <div class="table">
                            <table class="table111">
                                <tr>
                                    <td>会员编号</td>
                                    <td>会员姓名</td>
                                    <td>会员昵称</td>
                                    <td>会员性别</td>
                                    <td>会员类别</td>
                                    <td>注册日期</td>
                                    <td>到期日期</td>
                                    <td>操作</td>
                                </tr>
                            </table>
                            <div class="table1">
                                <table id="table">
                                    <%
                                        if (!list.isEmpty()) {
                                            for (int i = 0; i < list.size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=list.get(i).getCid()%>
                                        </td>
                                        <td><%=list.get(i).getCname()%>
                                        </td>
                                        <td><%=list.get(i).getCnickname()%>
                                        </td>
                                        <td><%=list.get(i).getCsex()%>
                                        </td>
                                        <td><%=list.get(i).getVcategory()%>
                                        </td>
                                        <td><%=list.get(i).getVindate()%>
                                        </td>
                                        <td><%=list.get(i).getVoutdate()%>
                                        </td>
                                        <td>
                                            <button onclick="setStatus('<%=list.get(i).getCid()%>')" id="vipbutton"><%=list.get(i).getVstatus()%>
                                            </button>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="adthree">
                    <input type="checkbox" id="three">
                    <label for="three" class="label">商品类别</label>
                    <div class="gcategory">
                        <div class="box1">
                            <div class="box1-top">
                                <input type="radio" name="select" id="sone" checked class="gradio" onclick="setone()">
                                <label for="sone">添加</label>
                                <input type="radio" name="select" id="stwo" class="gradio" onclick="settwo()">
                                <label for="stwo">删除</label>
                                <input type="radio" name="select" id="wthree" class="gradio" onclick="setthree()">
                                <label for="wthree">修改</label>
                            </div>
                            <div class="box1-middle">
                                <table>
                                    <tr>
                                        <td>操作对象</td>
                                        <td>
                                            <select name="" id="gselect" disabled>
                                                <%
                                                    List<GoodsModel> list1 = EBofactory.getgoodsebiempl().getGcategory();
                                                    if (!list1.isEmpty()) {
                                                        for (int i = 0; i < list1.size(); i++) {
                                                %>
                                                <option value="<%=list1.get(i).getGcategory()%>"><%=list1.get(i).getGcategory()%>
                                                </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>操作内容</td>
                                        <td><input type="text" placeholder="添加\修改内容" id="gtext" required></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="box1-bottom">
                                <button>重置</button>
                                <button onclick="submitgcategory()">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function change1() {
            document.getElementById("shouye").style.display = "block";
            document.getElementById("huiyuan").style.display = "none";
        }

        function change2() {
            document.getElementById("shouye").style.display = "none";
            document.getElementById("huiyuan").style.display = "block";
        }

        function showimg11(cell) {
            document.getElementById('img').src = window.URL.createObjectURL(cell.files[0]);
        }

        function rese() {
            document.getElementById('img').src = "";
        }

        function selectChange() {
            var search = document.getElementById("t-select1").value;
            var select1 = document.getElementById("selectc");
            var index = select1.selectedIndex;
            var select = select1.options[index].value;
            var url = "<%=path%>/AdminServlet?action=selectvip&search=" + search + "&select=" + select + "&type=" + select;
            let xml = new XMLHttpRequest();
            xml.open("get", url, true)
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    let vals = xml.responseText;
                    let jsonArr = eval(vals);
                    let str = "";
                    for (let i = 0; i < jsonArr.length; i++) {
                        str += "<tr>";
                        str += "<td>" + jsonArr[i].cid + "</td>";
                        str += "<td>" + jsonArr[i].cname + "</td>";
                        str += "<td>" + jsonArr[i].cnickname + "</td>";
                        str += "<td>" + jsonArr[i].csex + "</td>";
                        str += "<td>" + jsonArr[i].vcategory + "</td>";
                        str += "<td>" + jsonArr[i].vindate + "</td>";
                        str += "<td>" + jsonArr[i].voutdate + "</td>";
                        str += "<td><button onclick=\"setStatus('" + jsonArr[i].cid + "')\"  id=\"vipbutton\">" + jsonArr[i].vstatus + "</button></td>";
                        str += "</tr>";
                    }
                    document.getElementById("table").innerHTML = str;
                }
            }
            xml.send(null)
        }

        function setStatus( cid) {
            var m =  document.getElementById("vipbutton").innerText;
            var status;
            var change;
            if (m === '冻结') {
                status = 'no'
                change = '解冻'
            } else {
                status = 'yes'
                change = '冻结';
            }
            if (window.confirm("是否" + m)) {
                var url = "<%=path%>/AdminServlet?action=updatevip&vstatus=" + status + "&cid=" + cid;
                let xml = new XMLHttpRequest();
                xml.open("get", url, true);
                xml.onreadystatechange = function () {
                    if (xml.readyState === 4 && xml.status === 200) {
                        alert("操作成功");
                        document.getElementById("vipbutton").innerText = change;
                    }
                }
                xml.send(null);
            }
        }

        function setone() {
            document.getElementById("gselect").disabled = true;
            document.getElementById("gtext").disabled = false;
        }

        function settwo() {
            document.getElementById("gselect").disabled = false;
            document.getElementById("gtext").disabled = true;
        }

        function setthree() {
            document.getElementById("gselect").disabled = false;
            document.getElementById("gtext").disabled = false;
        }

        function submitgcategory() {
            var radio = document.getElementsByClassName("gradio");
            var select;
            for (let i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    select = radio[i].id;
                }
            }
            var url;
            var gselect1 = document.getElementById("gselect").value;
            var newg = document.getElementById("gtext").value;
            if (select === "sone") {
                url = "<%=path%>/AdminServlet?action=setGcategory&type=add&g=" + newg;
            } else if (select === "stwo") {
                url = "<%=path%>/AdminServlet?action=setGcategory&type=delete&g=" + gselect1;
            } else if (select === "wthree") {
                url = "<%=path%>/AdminServlet?action=setGcategory&type=update&g=" + newg + "&gselect=" + gselect1;
            }
            let xml = new XMLHttpRequest();
            xml.open("get", url, true);
            xml.onreadystatechange = function () {
                if (xml.readyState === 4 && xml.status === 200) {
                    let vals = xml.responseText;
                    let jsonArr = eval(vals);
                    alert(jsonArr[0]);
                    window.location.reload();
                }
            }
            xml.send(null);
        }
    </script>
</html>
