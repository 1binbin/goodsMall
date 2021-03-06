package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/9-8:35
 */

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.business.Daofactory;
import com.business.EBofactory;
import com.entity.CustomerModel;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "customerServlet", value = "/customerServlet")
@MultipartConfig(location = "D:\\", fileSizeThreshold = 1024)
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
        ShoppingcartModel shoppingcartModel = new ShoppingcartModel(cid, eid, gid);
        EBofactory.getShoppingcartempl().insertCart(shoppingcartModel);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    protected void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rname = request.getParameter("rname");
        String cid = request.getParameter("cid");
        double tpay = Double.parseDouble(request.getParameter("tpay").substring(1));
        String arr = request.getParameter("arr");
        String[] split = arr.split(",");
        String oid = request.getParameter("oid");
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime localDateTime = LocalDateTime.now();
        String tdate1 = dateTimeFormatter.format(localDateTime);
        LocalDateTime tdate = LocalDateTime.parse(tdate1, dateTimeFormatter);
//        ?????????eid,gid,num
        EntityModel entityModel = new EntityModel(oid, cid, rname, tdate, tpay, "no", "no");
        EBofactory.getotherEbimpl().insertTicket(entityModel);
        for (int i = 0; i < split.length; i += 3) {
            EBofactory.getotherEbimpl().insertOrder(oid, split[i + 1], split[i], Integer.parseInt(split[i + 2]));
        }
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    protected void updateTispay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String oid = request.getParameter("oid");
        String arr = request.getParameter("arr");
        String[] split = arr.split(",");
        for (int i = 0; i < split.length; i+=3) {
            EBofactory.getgoodsebiempl().setGoods(split[i+1], split[i], Integer.parseInt(split[i+2]));
        }
        EBofactory.getotherEbimpl().uodateTicket("yes", oid, cid);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    protected void insertVip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String vcategory = request.getParameter("vcategory");
        EBofactory.getcustomerebiempl().insertVip(cid, vcategory);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    /*????????????*/
    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<GoodsModel> goodsModels;
        if (search != null) {
            goodsModels = EBofactory.getgoodsebiempl().getGoodsSearch(search);
        } else {
            goodsModels = EBofactory.getgoodsebiempl().getGoodsAll();
        }
        request.getSession().setAttribute("search", search == null ? "" : search);
        request.getSession().setAttribute("goods", goodsModels);
        request.getRequestDispatcher("jsp/user/showSelectGoods.jsp").forward(request, response);
    }

    protected void searchGcaetgory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<GoodsModel> goodsModels = EBofactory.getgoodsebiempl().gteGcategory(search);
        request.getSession().setAttribute("search", "");
        request.getSession().setAttribute("search1", search);
        request.getSession().setAttribute("goods", goodsModels);
        request.getRequestDispatcher("jsp/user/showSelectGoods.jsp").forward(request, response);
    }

    protected void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String search = request.getParameter("search");
        search = search == null ? "" : search;
        String gcategory = request.getParameter("category");
        List<GoodsModel> list = null;
        if ("one".equals(type)) {
            list = EBofactory.getgoodsebiempl().getGoodsGcategory(gcategory, search);
        } else if ("three".equals(type)) {
            double down = request.getParameter("down").length()==0?0:Double.parseDouble(request.getParameter("down"));
            double up = request.getParameter("up").length()==0?999999.99:Double.parseDouble(request.getParameter("up"));
            list = EBofactory.getgoodsebiempl().getGoodsPrice(down, up, search);
        } else if ("two".equals(type)) {
            list = EBofactory.getgoodsebiempl().getGoodsTime(search);
        }
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    /*???????????????*/
    protected void deleteChekedCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String arr = request.getParameter("arr");
        String cid = request.getParameter("cid");
        String[] split = arr.split(",");
        for (int i = 0; i < split.length; i+=2) {
            EBofactory.getShoppingcartempl().deleteCart(cid, split[i], split[i+1]);
        }
    }

    protected void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        EBofactory.getShoppingcartempl().deleteCartAll(cid);
    }

    /*???????????????*/
    protected void selectCart(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        String search = req.getParameter("search");
        String cid = req.getParameter("cid");
        search = search == null ? "" : search;
        List<List<ShoppingcartModel>> list = EBofactory.getShoppingcartempl().getCartEidSearch(cid, search);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    protected void delect(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        String gid = req.getParameter("gid");
        String eid = req.getParameter("eid");
        EBofactory.getShoppingcartempl().deleteCart(cid, eid, gid);
    }

    /*????????????*/
    protected void selectOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String pay = request.getParameter("pay");
        String delivey = request.getParameter("delivey");
        String over = request.getParameter("over");
        String type = request.getParameter("type");
        String search = request.getParameter("search");
        search = (search == null ? "" : search);
        List<List<EntityModel>> list = EBofactory.getotherEbimpl().getSelectTicket(cid, pay, delivey, over, type, search);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    /*????????????*/
    protected void updateTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String oid = request.getParameter("oid");
        String type = request.getParameter("type");
        switch (type) {
            case "one":
                EBofactory.getotherEbimpl().updateTisover(cid, oid);
                break;
            case "two":
                EBofactory.getotherEbimpl().deleteOrder(cid, oid);
                break;
            case "three":
                EBofactory.getotherEbimpl().cancelOrder(cid, oid);
                break;
        }
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    protected void gotoPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String oid = request.getParameter("oid");
        String[] arr = EBofactory.getotherEbimpl().getLIst(cid, oid);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(arr);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    /*??????????????????*/
    protected void updatePerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String cname = request.getParameter("cname");
        String cnickname = request.getParameter("cnickname");
        String cesx = request.getParameter("cesx");
        EBofactory.getcustomerebiempl().updatePerson(cid, cname, cnickname, cesx);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    /*????????????*/
    protected void touxiang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = this.getServletContext().getRealPath("/");
        String cid = (String) request.getSession().getAttribute("cid");
        Part p = request.getPart("touxiang");
        if (p.getSize() > 1024 * 1024) {
            p.delete();
        } else {
            path = path + "\\personImg\\";
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            String filename = cid + ".jpg";
            if (!Objects.equals(p.getSubmittedFileName(), "")) {
                p.write(path + "\\" + filename);
            }
        }
        request.getRequestDispatcher("jsp/user/user.jsp").forward(request, response);
    }

    /*??????*/
    protected void updateRadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rname = request.getParameter("rname");
        String radd = request.getParameter("radd");
        String cid = request.getParameter("cid");
        String type = request.getParameter("type");
        if ("one".equals(type)) {
            EBofactory.getcustomerebiempl().addRadd(cid, rname, radd);
        } else {
            String old = request.getParameter("old");
            EBofactory.getcustomerebiempl().updateRadd(cid, rname, radd, old);
        }
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }

    protected void deleetvip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        boolean[] arr = new boolean[1];
        arr[0] = EBofactory.getcustomerebiempl().delete(cid);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(arr);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    protected void setFocus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String eid = request.getParameter("eid");
        EBofactory.getotherEbimpl().getFocus(cid, eid);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
    }
    protected void showFocus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String eid = request.getParameter("eid");
        List<EntityModel> list = Daofactory.getotherDaoImpl().getFollow(cid, eid);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }
    protected void showFansGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        List<GoodsModel> list = Daofactory.getgoodsdaoimpl().likeGoods(cid);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }
    protected void isPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String arr = request.getParameter("arr");
        String[] arr1 = arr.split(",");
        boolean is = EBofactory.getgoodsebiempl().isPay(arr1[0],arr1[1], Integer.parseInt(arr1[2]));
        String[] list = new String[]{is+""};
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }
}
