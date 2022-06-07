package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/9-8:35
 */

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.business.EBofactory;
import com.entity.EmployeeModel;
import com.entity.EntityModel;
import com.entity.GoodsModel;
import com.entity.ShoppingcartModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "merchantsPersonServlet", value = "/merchantsPersonServlet")
@MultipartConfig(location = "D:\\", fileSizeThreshold = 1024)
public class merchantsPersonServlet extends HttpServlet {
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
        doGet(request, response);
    }
    /*修改头像*/
    protected void touxiang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = this.getServletContext().getRealPath("/");
        String eid = (String) request.getSession().getAttribute("eid");
        Part p = request.getPart("touxiang");
        if (p.getSize() > 1024 * 1024) {
            p.delete();
        } else {
            path = path + "\\merchantsImg\\";
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            String filename = eid + ".jpg";
            if (!Objects.equals(p.getSubmittedFileName(), "")) {
                p.write(path + "\\" + filename);
            }
        }
        request.getRequestDispatcher("jsp/merchants/merchants.jsp").forward(request, response);
    }

    /*地址*/
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = request.getParameter("eid");
        String ename = request.getParameter("ename");
        String estorename = request.getParameter("estorename");
        String ephone = request.getParameter("ephone");
        String eaddress = request.getParameter("eaddress");
        String cesx = request.getParameter("cesx");
        EmployeeModel employeeModel = new EmployeeModel(eid,"",eaddress,cesx,ename,estorename,ephone);
        EBofactory.getemployeeebiempl().updateEmployeeAll(employeeModel);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

}
