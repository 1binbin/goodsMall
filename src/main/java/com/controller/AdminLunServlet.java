package com.controller; /**
 * @Author hongxiaobin
 * @Time 2022/5/8-19:01
 */

import com.Utils.Utils;
import com.business.EBofactory;
import com.entity.AdminModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "AdminLUnServlet", value = "/AdminLUnServlet")
@MultipartConfig(location = "D:\\", fileSizeThreshold = 1024)
public class AdminLunServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = this.getServletContext().getRealPath("/");
        String select =  request.getParameter("seleetc");
        Part p = request.getPart("file");
        if (p.getSize() > 1024 * 1024) {
            p.delete();
        } else {
            path = path + "\\shuffling_img\\";
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            String filename = select + ".jpg";
            if (!Objects.equals(p.getSubmittedFileName(), "")) {
                p.write(path + "\\" + filename);
            }
        }
        request.getRequestDispatcher("jsp/admin/admin.jsp").forward(request,response);
    }
}
