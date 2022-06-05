<%@ page import="com.Utils.Utils" %><%--
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
            String aid = request.getParameter("aid");
        %>
        <title>天天淘-后台</title>
        <link rel="stylesheet" href="<%=path%>/css/admin.css">
    </head>
    <body>
        <div class="adtop">
            <p>天天淘后台</p>
        </div>
        <div class="adbottom">
            <div class="adleft">
                <div class="adone">
                    <input type="radio" id="one" checked name="radio" onclick="change1()">
                    <label for="one">首页装扮</label>
                    <div class="souye" id="shouye">
                        <div class="box">
                            <span>轮播图上传</span>
                            <div class="line"></div>
                            <div class="souyeone">
                                <div class="souyeoneleft">
                                    <img src="" alt="" id="img">
                                </div>
                                <div class="souyroneright">
                                    <form action="<%=path%>/AdminLUnServlet" enctype="multipart/form-data" method="post">
                                        <table>
                                            <tr>
                                                <td>选择图片</td>
                                                <td><input type="file" accept="image/jpeg"  onchange="showimg11(this)" name="file"></td>
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
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/1.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/2.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/3.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/4.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/5.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/6.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/7.jpg" alt=""></div></li>
                                    <li><div class="img"><img src="<%=path%>/shuffling_img/8.jpg" alt=""></div></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="adtwo">
                    <input type="radio" id="two" name="radio" onclick="change2()">
                    <label for="two">会员管理</label>
                    <div class="huiyuan" id="huiyuan">

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
    </script>
</html>
