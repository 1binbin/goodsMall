<%@ page import="com.entity.EmployeeModel" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="com.entity.GoodsModel" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/5/5
  Time: 19:20
  Description: 注册登录与忘记密码界面
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
            Cookie[] cookies = request.getCookies();
            String username = "";
            if (cookies!=null){
                for (Cookie cookie:cookies){
                    if ("username".equals(cookie.getName())){
                        username = cookie.getValue();
                    }
                }
            }
            if (username.endsWith("admin")){
//                String adminName = (String) request.getSession().getAttribute("adminName");
                String eid = username.substring(0,username.length()-5);
                ArrayList<GoodsModel> arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsList(eid,0,8);
                System.out.println(arrayList.size());
                int count = EBofactory.getCountbiempl().getallCount(eid);
                request.getSession().setAttribute("allGoods",arrayList);
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("allgoodsCount",count);
                request.getRequestDispatcher("../jsp/merchants/merchantsWait.jsp").forward(request,response);
            }
        %>
        <link href="<%=path%>/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/css/index.css">
        <title>51商城</title>
        <script type="text/javascript">
            function refrush_code(obj) {
                obj.setAttribute("src", obj.getAttribute("src").toString().split("?")[0] + "?id=" + Math.random());
            }
        </script>
    </head>
    <body>
        <div class="container right-panel-active">
            <!--            登录-->
            <div class="container_form container--singup">
                <form action="<%=path%>/IndexServlet" class="form" id="form1" method="post">
                    <h2 class="from_title">用户登录中心</h2>
                    <div class="acc">
                        <input type="text" placeholder="手机号" class="input" name="username" >
                        <input type="password" placeholder="密码" class="input" name="password" id="password">
                        <div class="code">
                            <input type="text" placeholder="验证码" class="input1" name="code">
                            <img src="<%=path%>/IndexServlet" alt="暂无图片" onclick="refrush_code(this)" title="点击刷新">
                        </div>
                    </div>
                    <div class="fn">
                        <label for="radio" class="lable"><input type="radio" name="role" value="user" id="radio"
                                                                checked><span><span></span></span>用户</label>
                        <label for="radio1" class="lable"><input type="radio" name="role" value="admin"
                                                                 id="radio1"><span><span></span></span>商家</label>
                        <label for="check"><input type="checkbox" id="check" name="keep" value="choose"><span><span></span></span>记住我</label>
                        <label for="check1" class="forgetlable"><input type="checkbox" id="check1"
                                                                       onclick="c()">忘记密码</label>
                    </div>
                    <div class="box">
                        <input type="submit" value="登录" class="btn" >
                        <input type="reset" value="重置" class="btn">
                    </div>
                </form>
                <%--                    忘记密码--%>
                <div class="forget" id="forget">
                    <form action="<%=path%>/ForgetServlet" class="form" id="form3" method="post">
                        <h2 class="from_title" id="h2">重置密码</h2>
                        <input type="text" placeholder="手机号" class="input" name="ephone" >
                        <input type="password" placeholder="新密码" class="input" name="fpassword" id="fpassword">
                        <div class="inputdiv"><p id="message2"></p></div>
                        <input type="password" placeholder="确认密码" class="input" name="spassword" id="ffpassword">
                        <div class="inputdiv"><p id="message5"></p></div>
                        <div class="code">
                            <input type="text" placeholder="验证码" class="input1" name="code">
                            <img src="<%=path%>/ForgetServlet" alt="暂无图片" onclick="refrush_code(this)" title="点击刷新">
                        </div>
                        <div class="fn">
                            <label for="radio1112" class="lable"><input type="radio" name="role" value="user" id="radio1112"
                                                                       checked><span><span></span></span>用户</label>
                            <label for="radio112" class="lable"><input type="radio" name="role" value="admin"
                                                                      id="radio112"><span><span></span></span>商家</label>
                        </div>
                        <div class="box">
                            <input type="submit" value="确定" class="btn" id="submit2">
                            <input type="reset" value="重置" class="btn">
                        </div>
                        <i class="fa fa-chevron-left icon" aria-hidden="true" onclick="back_return()">返回</i>
                    </form>
                </div>
            </div>

            <!--            注册-->
            <div class="container_form container--singin">
                <form action="<%=path%>/RegisterServlet" class="form" id="form2" method="post">
                    <h2 class="from_title">注册账号</h2>
                    <input type="text" placeholder="手机号" class="input" name="ephone" pattern="^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$">
                    <input type="password" placeholder="密码" class="input" name="fpassword" id="rfpassword">
                    <div class="inputdiv"><p id="message1"></p></div>
                    <input type="password" placeholder="确认密码" class="input" name="spassword" id="rspassword">
                    <div class="inputdiv"><p id="message4"></p></div>
                    <div class="code">
                        <input type="text" placeholder="验证码" class="input1" name="code">
                        <img src="<%=path%>/RegisterServlet" alt="暂无图片" onclick="refrush_code(this)" title="点击刷新">
                    </div>
                    <div class="fn">
                        <label for="radio111" class="lable"><input type="radio" name="role" value="user" id="radio111"
                                                                   checked><span><span></span></span>用户</label>
                        <label for="radio11" class="lable"><input type="radio" name="role" value="admin"
                                                                  id="radio11"><span><span></span></span>商家</label>
                    </div>
                    <div class="box">
                        <input type="submit" value="注册" class="btn" id="submit1">
                        <input type="reset" value="重置" class="btn">
                    </div>
                </form>
            </div>

            <div class="container_overlay">
                <div class="overlay">
                    <%--                    以下盒子可跟随移动--%>
                    <div class="overlay_panel overlay--left">
                        <button class="btn" id="singin">没有账号，点击注册</button>
                    </div>
                    <div class="overlay_panel overlay--right">
                        <button class="btn" id="singup">已有账号，直接登录</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        const singinBtn = document.getElementById("singin");
        const singupBtn = document.getElementById("singup");
        const conrainer = document.querySelector(".container");
        const check1 = document.getElementById("check1");
        const forget = document.getElementById("forget");
        singinBtn.addEventListener("click", () => {
            conrainer.classList.remove("right-panel-active");
            forget.style.transform = "scaleY(0)";
        })
        singupBtn.addEventListener("click", () => {
            conrainer.classList.add("right-panel-active")
        })

        function c() {
            forget.style.transform = "scaleY(1)";
        }

        function back_return() {
            forget.style.transform = "scaleY(0)";
        }
        var regu = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/
        var rfpassword = document.getElementById("rfpassword");
        var fpassword = document.getElementById("fpassword");
        var message1 = document.getElementById("message1");
        var message2 = document.getElementById("message2");
        //确认密码
        var rspassword = document.getElementById("rspassword");
        var ffpassword = document.getElementById("ffpassword");
        var message4 = document.getElementById("message4");
        var message5 = document.getElementById("message5");
        rfpassword.oninput = function (){
            if (!regu.test(rfpassword.value)){
                message1.innerHTML = "密码应为6-16位数字和字母组成";
                message1.style.color = "#ef4444"
                rspassword.disabled = true;
            }else {
                message1.innerHTML = "密码格式正确";
                message1.style.color = "green";
                rspassword.disabled = false;
            }
        }
        fpassword.oninput = function (){
            if (!regu.test(fpassword.value)){
                message2.innerHTML = "密码应为6-16位数字和字母组成";
                message2.style.color = "#ef4444"
                ffpassword.disabled = true;
            }else {
                message2.innerHTML = "密码格式正确";
                message2.style.color = "green";
                ffpassword.disabled = false;
            }
        }
    //    确认密码
        var submit1 = document.getElementById("submit1");
        var submit2 = document.getElementById("submit2");
        rspassword.oninput = function (){
            if (rfpassword.value!==rspassword.value){
                message4.innerHTML="与新密码不相同";
                message4.style.color = "#ef4444"
                submit1.disabled = true;
            }else {
                message4.innerHTML = "密码正确";
                message4.style.color = "green";
                submit1.disabled = false;
            }
        }
        ffpassword.oninput = function (){
            if (fpassword.value!==ffpassword.value){
                message5.innerHTML="与新密码不相同";
                message5.style.color = "#ef4444"
                submit2.disabled = true;
            }else {
                message5.innerHTML = "密码正确";
                message5.style.color = "green";
                submit2.disabled = false;
            }
        }
    </script>
</html>
