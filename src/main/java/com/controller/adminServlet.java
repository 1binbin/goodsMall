package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/9-8:35
 */

import com.Utils.Utils;
import com.business.Daofactory;
import com.business.EBofactory;
import com.entity.GoodsModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Objects;

@MultipartConfig(location = "D:\\", fileSizeThreshold = 1024)
@WebServlet(name = "adminServlet", value = "/adminServlet")
public class adminServlet extends HttpServlet {
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
        Utils.getAllGoods(request,eid);
        request.getRequestDispatcher("jsp/admin.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        GoodsModel goodsModel = getGoodsModel(request);
        EBofactory.getgoodsebiempl().updateGoods(goodsModel);
        Utils.getAllGoods(request,eid);
        request.getRequestDispatcher("jsp/admin.jsp").forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        String gid = request.getParameter("gid");
        EBofactory.getgoodsebiempl().deleteGoods(gid,eid);
        Utils.getAllGoods(request,eid);
        request.getRequestDispatcher("jsp/admin.jsp").forward(request, response);
    }


    protected void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eid = getEid(request);
        String selectText = request.getParameter("selectGid");
        String selectOption = request.getParameter("selectOption");
        ArrayList<GoodsModel> arrayList = new ArrayList<>();
        if ("all".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) Daofactory.getgoodsdaoimpl().getGoodsAll(selectText,eid);
        } else if ("selectGid".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) Daofactory.getgoodsdaoimpl().getGoods(selectText,eid);
        } else if ("selectGname".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) Daofactory.getgoodsdaoimpl().getGoodsGname(selectText,eid);
        } else if ("selectGcategory".equals(selectOption)) {
            arrayList = (ArrayList<GoodsModel>) Daofactory.getgoodsdaoimpl().getGoodsGcategory(selectText,eid);
        }
        request.getSession().setAttribute("allGoods", arrayList);
        request.getRequestDispatcher("jsp/admin.jsp").forward(request, response);
    }



    protected void all(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String eid = getEid(request);
        Utils.getAllGoods(request,eid);
        request.getRequestDispatcher("jsp/admin.jsp").forward(request, response);
    }

    private GoodsModel getGoodsModel(HttpServletRequest request) throws IOException, ServletException {
        String eid = getEid(request);
        String gid = request.getParameter("gid");
        String name = request.getParameter("gname");
        String category = request.getParameter("gcategory");
        String gname = (Objects.deepEquals(name, "") ? "-" : name);
        String gcategory = (Objects.deepEquals(category, "") ? "-" : category);
        String num = request.getParameter("gnum");
        String price = request.getParameter("gprice");
        String inprice = request.getParameter("ginprice");
        int gnum = (Objects.equals(num, "") ? 0 : Integer.parseInt(num));
        double gprice = (Objects.deepEquals(price, "") ? 0.0 : Double.parseDouble(price));
        double ginprice = (Objects.deepEquals(inprice, "") ? 0.0 : Double.parseDouble(inprice));
        GoodsModel goodsModel = new GoodsModel(gid, gname, gcategory, gprice, ginprice, gnum,eid);
//        上传主图
        String path = this.getServletContext().getRealPath("/");
        Part p = request.getPart("file");
        if (p.getSize() > 1024 * 1024) {
            p.delete();
        } else {
            path = path + "\\" + eid;
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
        String adminName = (String) request.getSession().getAttribute("adminName");
        return adminName.substring(0,adminName.length()-5);
    }
}
