<%@ page import="com.entity.CustomerModel" %>
<%@ page import="com.business.EBofactory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--    修改个人信息--%>
<%
    List<CustomerModel> list = EBofactory.getcustomerebiempl().getCustomerMessage(cid);
    if (!list.isEmpty()) {
%>
<div class="personalnformation" id="personalnformation">
    <div>
        <span>个人信息</span>
        <span onclick="person(2)">返回</span>
    </div>
    <div class="line"></div>
    <table class="table">
        <tr>
            <td>头像</td>
            <td>
                <form action="" method="post" enctype="multipart/form-data" id="form">
                    <input type="file" accept="image/jpeg" name="touxiang">
                    <input type="submit" value="点击上传" id="touxiang">
                </form>
            </td>
        </tr>
        <tr>
            <td>账号</td>
            <td><input type="text" id="cid" readonly="readonly" value="<%=list.get(0).getCid()%>"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" id="cname" readonly="readonly" value="<%=list.get(0).getCname()%>"></td>
        </tr>
        <tr>
            <td>昵称</td>
            <td><input type="text" id="cnickname" readonly="readonly" value="<%=list.get(0).getCnickname()%>"></td>
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
                           value="<%=list.get(0).getCsex()!=null?(list.get(0).getCsex().equals("male")?"男":"女"):"null"%>">
                </div>
                <div class="w" id="w">
                    <input type="radio" name="csex" value="male" readonly="readonly" id="nan" checked>男
                    <input type="radio" name="csex" value="fmale" readonly="readonly" id="nv">女
                </div>
            </td>
        </tr>
    </table>
    <div class="perbottom">
        <button onclick="okupdate()">点击修改</button>
        <button>确认修改</button>
    </div>
    <span>收货地址</span>
    <div class="line" id="line"></div>
    <div class="per-top">
        <input type="radio" id="one" name="radd" checked>
        <label for="one" id="label1">添加地址</label>
        <input type="radio" id="two" name="radd">
        <label for="two" id="label2">修改地址</label>
        <div class="per-box">
            <div class="one">
                <table>
                    <tr>
                        <td>收货人</td>
                        <td><input type="text" name="rname1"></td>
                    </tr>
                    <tr>
                        <td>联系电话</td>
                        <td><input type="text" name="rname2"></td>
                    </tr>
                    <tr>
                        <td>收货地址</td>
                        <td><input type="text" name="radd"></td>
                    </tr>
                </table>

            </div>
            <div class="two">
                <span>修改对象</span>
                <div class="two-box">
                    <select name="" id="">
                        <%
                            for (CustomerModel customerModel : list) {
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
                        <td><input type="text" name="rname1"></td>
                    </tr>
                    <tr>
                        <td>联系电话</td>
                        <td><input type="text" name="rname2"></td>
                    </tr>
                    <tr>
                        <td>收货地址</td>
                        <td><input type="text" name="radd"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="per-bottom">
            <button>重置</button>
            <button>确认</button>
        </div>
    </div>
</div>
<%
    }
%>