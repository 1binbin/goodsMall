package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/8-19:01
 */

import com.Utils.Utils;
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
import java.util.Objects;
import java.util.Random;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String aid = request.getParameter("aid");
        String apassword = request.getParameter("apassword");
        AdminModel adminModel = new AdminModel(aid,apassword);
        if (EBofactory.getAdminEbiImpl().isLogin(adminModel)){
            request.getRequestDispatcher("jsp/admin/admin.jsp").forward(request,response);
        }else {
            Utils.alter(response, "<script type='text/javascript'>alert('用户名或密码错误！')</script>", "<script type='text/javascript'>location.href='jsp/admin/adminLogin.jsp'</script>");
        }
    }
}
