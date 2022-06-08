package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/8-19:01
 */

import com.Utils.Utils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.business.EBofactory;
import com.entity.AdminModel;
import com.entity.CustomerModel;
import com.entity.EmployeeModel;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Objects;
import java.util.Random;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            try {
                Method method = this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(this, request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            this.doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String aid = request.getParameter("aid");
        String apassword = request.getParameter("apassword");
        AdminModel adminModel = new AdminModel(aid,apassword);
        if (EBofactory.getAdminEbiImpl().isLogin(adminModel)){
            request.getSession().setAttribute("aid",aid);
            request.getRequestDispatcher("jsp/admin/admin.jsp").forward(request,response);
        }else {
            Utils.alter(response, "<script type='text/javascript'>alert('用户名或密码错误！')</script>", "<script type='text/javascript'>location.href='jsp/admin/adminLogin.jsp'</script>");
        }
    }
    protected void updatevip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String vstatus = request.getParameter("vstatus");
        EBofactory.getcustomerebiempl().setCustomerVIp(vstatus,cid);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }
    protected void selectvip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        search = search==null?"":search;
        String select =  request.getParameter("select");
        String type = request.getParameter("type");
        List<CustomerModel> list = null;
        if ("all".equals(type)){
            list = EBofactory.getcustomerebiempl().getCustomerVip1(search);
        }else if ("other".equals(type)){
            list = EBofactory.getcustomerebiempl().getCustomerVip(search, select);
        }
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }
    protected void setGcategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String g = request.getParameter("g");
        String[] mesag = new String[1];
        if ("add".equals(type)){
            if (EBofactory.getgoodsebiempl().insertGcategory(g)){
                mesag[0] = "添加成功！";
            }else {
                mesag[0] = "添加失败！";
            }
        }else if ("delete".equals(type)){
            if (EBofactory.getgoodsebiempl().deleteGcategory(g)) {
                mesag[0] = "删除成功！";
            }else {
                mesag[0] = "删除失败！";
            }
        }else if ("update".equals(type)){
            String gselect = request.getParameter("gselect");
            if (EBofactory.getgoodsebiempl().setGcategory(gselect,g)) {
                mesag[0] = "修改成功！";
            }else {
                mesag[0] = "修改失败！";
            }
        }
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(mesag);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }
}
