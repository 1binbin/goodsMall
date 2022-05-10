package com.Utils;

import com.business.EBofactory;
import com.entity.EmployeeModel;
import com.entity.GoodsModel;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

/**
 * @Author hongxiaobin
 * @Time 2022/5/7-19:08
 * s ->"<script type='text/javascript'>alert('用户名或密码不存在！')</script>"
 * h ->"<script type='text/javascript'>location.href='html/login.html'</script>"
 */
public class Utils {
    public static void alter(HttpServletResponse response, String s, String h) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(s);
        out.print(h);
        out.flush();
        out.close();
    }
    public static void getAllGoods(HttpServletRequest request) {
        ArrayList<GoodsModel> arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsList();
        request.getSession().setAttribute("allGoods", arrayList);
    }
}
