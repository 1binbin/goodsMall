package com.controller;
/**
 * @Author hongxiaobin
 * @Time 2022/5/7-11:32
 */

import com.Utils.Utils;
import com.business.EBofactory;
import com.entity.CustomerModel;
import com.entity.EmployeeModel;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Random;

@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //产生验验证码
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        int width = 40;
        int height = 20;
        Random random = new Random();
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics graphiecs = img.getGraphics();
        graphiecs.setColor(new Color(243, 243, 243));
        graphiecs.fillRect(0, 0, width, height);
        int style = random.nextInt(4);
//        数字大小
        int size = random.nextInt(4) + 12;
        graphiecs.setFont(new Font("微软雅黑", style, size));
        StringBuilder srand = new StringBuilder();
//        产生随机数
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            srand.append(rand);
            graphiecs.setColor(new Color(random.nextInt(100), random.nextInt(150), random.nextInt(150)));
//            更改间距8
            graphiecs.drawString(rand, i * 10, 18);
        }
//        产生随机线条
        for (int i = 0; i < 10; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(10);
            int y1 = random.nextInt(10);
            graphiecs.drawLine(x, y, x + x1, y + y1);
        }
        request.getSession().setAttribute("yzm1", srand.toString());
        graphiecs.dispose();
        ImageIO.write(img, "jpeg", response.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imgcode = (String) request.getSession().getAttribute("yzm1");
        String code = request.getParameter("code");
        String username = Utils.utf_8(request.getParameter("username"));
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String[] keep = request.getParameterValues("keep");
        EmployeeModel employeeModel = new EmployeeModel(username, password,"null","null","null","null","null");
        CustomerModel customerModel = new CustomerModel(username, password,"null","null","null","null");
        if (!Objects.equals(username, "") && !Objects.equals(password, "") && !Objects.equals(code, "")) {
            if (imgcode.equals(code)) {
                boolean choose = (keep != null);
                Cookie cookie = new Cookie("username", username + role);
                cookie.setMaxAge(60 * 5);
                if ("admin".equals(role) && EBofactory.getemployeeebiempl().login(employeeModel)) {
                    //            商家
                    if (choose) {
                        response.addCookie(cookie);
                    }
                    Utils.getAllGoods(request, username,0,8);
                    Utils.getCount(request,username);
                    request.getSession().setAttribute("username", username + role);
                    request.getRequestDispatcher("jsp/merchants/merchantsWait.jsp").forward(request, response);
                } else if ("user".equals(role) && EBofactory.getcustomerebiempl().login(customerModel)) {
                    //            用户
                    if (choose) {
                        response.addCookie(cookie);
                    }
                    request.getSession().setAttribute("username", username + role);
                    request.getRequestDispatcher("jsp/user/userwait.jsp").forward(request, response);
                } else {
                    Utils.alter(response, "<script type='text/javascript'>alert('用户名、密码或角色错误！')</script>", "<script type='text/javascript'>location.href='jsp/index.jsp'</script>");
                }
            } else {
                Utils.alter(response, "<script type='text/javascript'>alert('验证码错误！')</script>", "<script type='text/javascript'>location.href='jsp/index.jsp'</script>");
            }
        } else {
            Utils.alter(response, "<script type='text/javascript'>alert('存在信息未输入！')</script>", "<script type='text/javascript'>location.href='jsp/index.jsp'</script>");
        }
    }
}
