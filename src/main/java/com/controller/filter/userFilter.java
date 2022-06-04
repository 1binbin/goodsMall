package com.controller.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Author hongxiaobin
 * @Time 2022/6/4-16:15
 */
@WebFilter(filterName = "userFilter", urlPatterns = {"/jsp/user/goodsCart.jsp", "/jsp/user/members.jsp", "/jsp/user/myOrder.jsp", "/jsp/user/order.jsp", "/jsp/user/pay.jsp"})
public class userFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60*60*24);
        String cid = (String) session.getAttribute("cid");
        if (cid == null) {
            servletResponse.setContentType("text/html;charset=utf-8");
            PrintWriter out = servletResponse.getWriter();
            out.print("<script type='text/javascript'>alert('请先登录！')</script>");
            out.print("<script type='text/javascript'>window.open('../../jsp/index.jsp','_self')</script>");
            out.flush();
            out.close();
            return;
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
