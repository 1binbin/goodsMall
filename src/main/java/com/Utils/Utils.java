package com.Utils;

import com.business.EBofactory;
import com.entity.CountModel;
import com.entity.GoodsModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

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

    public static void getAllGoods(HttpServletRequest request, String eid, int start, int end) {
        ArrayList<GoodsModel> arrayList = (ArrayList<GoodsModel>) EBofactory.getgoodsebiempl().selectGoodsList(eid, start, end);
        request.getSession().setAttribute("allGoods", arrayList);
    }

    public static int getCount(HttpServletRequest request, String eid) {
        int count =EBofactory.getCountbiempl().getallCount(eid);
        request.getSession().setAttribute("allgoodsCount", count);
        return  count;
    }

    /**
     * 乱码处理
     *
     * @Param:
     * @Return:
     */
    public static String utf_8(String s) {
        return new String(s.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
    }
}
