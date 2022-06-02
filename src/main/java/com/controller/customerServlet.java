package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/9-8:35
 */

import com.business.EBofactory;
import com.entity.EntityModel;
import com.entity.ShoppingcartModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customerServlet")
public class customerServlet extends HttpServlet {
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
    protected void insertCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gid = request.getParameter("gid");
        String cid = request.getParameter("cid");
        String eid = request.getParameter("eid");
        ShoppingcartModel shoppingcartModel = new ShoppingcartModel(cid,eid,gid);
        EBofactory.getShoppingcartempl().insertCart(shoppingcartModel);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }
    protected void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rname = request.getParameter("rname");
        String cid = request.getParameter("cid");
        double tpay = Double.parseDouble(request.getParameter("tpay"));
        String arr = request.getParameter("arr");
        String[] split = arr.split(",");
        String oid = request.getParameter("oid");
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime localDateTime = LocalDateTime.now();
        String tdate1 = dateTimeFormatter.format(localDateTime);
        LocalDateTime tdate = LocalDateTime.parse(tdate1,dateTimeFormatter);
//        分别为eid,gid,num
        for (int i = 0; i < split.length; i += 3) {
            EBofactory.getotherEbimpl().insertOrder(oid,split[i+1],split[i], Integer.parseInt(split[i+2]));
        }
        EntityModel entityModel = new EntityModel(oid,cid,rname,tdate,tpay,"no","no");
        EBofactory.getotherEbimpl().insertTicket(entityModel);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }
    protected void updateTispay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String oid = request.getParameter("oid");
        EBofactory.getotherEbimpl().uodateTicket("yes",oid,cid);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }
    protected void insertVip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String vcategory = request.getParameter("vcategory");
        EBofactory.getcustomerebiempl().insertVip(cid,vcategory);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }
}
