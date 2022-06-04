package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/9-8:35
 */

import com.Utils.Utils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.business.EBofactory;
import com.entity.EntityModel;
import com.entity.GoodsModel;

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
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@MultipartConfig(location = "D:\\", fileSizeThreshold = 1024)
@WebServlet(name = "merchantsServlet", value = "/merchantsServlet")
public class merchantsServlet extends HttpServlet {
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

    protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        GoodsModel goodsModel = getGoodsModel(request);
        EBofactory.getgoodsebiempl().insertGoods(goodsModel);
        Utils.getAllGoods(request, eid, 0, 15);
        Utils.getCount(request, eid);
        request.getRequestDispatcher("jsp/mechants/merchants.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        GoodsModel goodsModel = getGoodsModel(request);
        EBofactory.getgoodsebiempl().updateGoods(goodsModel);
        Utils.getAllGoods(request, eid, 0, 15);
        Utils.getCount(request, eid);
        request.getRequestDispatcher("jsp/merchants/merchants.jsp").forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        String gid = Utils.utf_8(request.getParameter("gid"));
        EBofactory.getgoodsebiempl().deleteGoods(gid, eid);
        Utils.getAllGoods(request, eid, 0, 15);
        Utils.getCount(request, eid);
        request.getRequestDispatcher("jsp/merchants/merchants.jsp").forward(request, response);
    }


    protected void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        String selectText = request.getParameter("selectGid");
        String selectOption = request.getParameter("selectOption");
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        ArrayList<GoodsModel> arrayList = new ArrayList<>();
        if ("all".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsAll(selectText, eid, 15 * (pageNum - 1), 15 * pageNum);
        } else if ("selectGid".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsGid(selectText, eid, 15 * (pageNum - 1), 15 * pageNum);
        } else if ("selectGname".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsGname(selectText, eid, 15 * (pageNum - 1), 15 * pageNum);
        } else if ("selectGcategory".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsGcategory(selectText, eid, 15 * (pageNum - 1), 15 * pageNum);
        }
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(arrayList);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    protected void paging(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        List<GoodsModel> arrayList = EBofactory.getgoodsebiempl().selectGoodsList(eid, 15 * (pageNum - 1), 15 * pageNum);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(arrayList);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    protected void all(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        Utils.getAllGoods(request, eid, 0, 15);
        Utils.getCount(request, eid);
        request.getRequestDispatcher("jsp/merchants/merchants.jsp").forward(request, response);
    }

    private GoodsModel getGoodsModel(HttpServletRequest request) throws IOException, ServletException {
        String eid = getEid(request);
        String gid = Utils.utf_8(request.getParameter("gid"));
        String name = Utils.utf_8(request.getParameter("gname"));
        String category = Utils.utf_8(request.getParameter("gcategory"));
        String describe = Utils.utf_8(request.getParameter("gdescribe"));
        String gname = (Objects.deepEquals(name, "") ? "-" : name);
        String gcategory = (Objects.deepEquals(category, "") ? "<空>" : category);
        String gdescribe = (Objects.deepEquals(describe, "") ? "<空>" : describe);
        String num = request.getParameter("gnum");
        String price = request.getParameter("gprice");
        String inprice = request.getParameter("ginprice");
        String isVip = request.getParameter("isvip");
        int gnum = (Objects.equals(num, "") ? 0 : Integer.parseInt(num));
        double gprice = (Objects.deepEquals(price, "") ? 0.0 : Double.parseDouble(price));
        double ginprice = (Objects.deepEquals(inprice, "") ? 0.0 : Double.parseDouble(inprice));
        GoodsModel goodsModel = new GoodsModel(eid, gid, gname, gcategory, gprice, ginprice, gnum, gdescribe, isVip);
//        上传主图
        String path = this.getServletContext().getRealPath("/");
        Part p = request.getPart("file");
        if (p.getSize() > 1024 * 1024) {
            p.delete();
        } else {
            path = path + "\\Product_main_photo\\" + eid;
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            String filename = gid + ".jpg";
            if (!Objects.equals(p.getSubmittedFileName(), "")) {
                p.write(path + "\\" + filename);
            }
        }
        return goodsModel;
    }

    private String getEid(HttpServletRequest request) {
        return Utils.utf_8((String) request.getSession().getAttribute("eid"));
    }

    protected void getEmployeeOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<List<EntityModel>> arrayList;
        String search = request.getParameter("search");
        search = (search == null ? "" : search);
        String eid = request.getParameter("eid");
        String value = request.getParameter("value");
        String begin = request.getParameter("begin");
        String end = request.getParameter("end");
//        有时间
        if (!Objects.equals(begin, "") && !Objects.equals(end, "")) {
//            全部
            if ("all".equals(value)) {
                arrayList = EBofactory.getotherEbimpl().getList(eid, "yes", "", begin, end, search, "alldata");
            } else {
                arrayList = EBofactory.getotherEbimpl().getList(eid, "yes", value, begin, end, search, "isdate");
            }
        } else {
            if ("all".equals(value)) {
                arrayList = EBofactory.getotherEbimpl().getList(eid, "yes", "", "", "", search, "all");
            } else {
                arrayList = EBofactory.getotherEbimpl().getList(eid, "yes", value, "", "", search, "ondate");
            }
        }
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(arrayList);
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(jsonArray);
    }

    protected void setTisdelivey(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = request.getParameter("eid");
        String oid1 = request.getParameter("oid");
        String[] oid = oid1.split(",");
        for (String s : oid) {
            EBofactory.getotherEbimpl().setTisdelivey(eid, s);
        }
        response.setContentType("text/xml;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setCharacterEncoding("UTF-8");

    }
}
