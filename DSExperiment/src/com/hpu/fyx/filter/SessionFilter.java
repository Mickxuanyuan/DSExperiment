package com.hpu.fyx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hpu.fyx.common.Constants;
import com.hpu.fyx.model.User;
import com.hpu.fyx.utils.PathUtil;

public class SessionFilter implements Filter {

    private String notNeedLoginPages = "";
    protected FilterConfig filterConfig;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        if(filterConfig.getInitParameter("notNeedLoginPages") != null) {
            notNeedLoginPages = filterConfig.getInitParameter("notNeedLoginPages");
        }

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String uri =  request.getRequestURI();
        String requestedUri = uri.substring(request.getContextPath().length() + 1);

        String [] pages = notNeedLoginPages.split(",");
        boolean isAllow = false;
        for(String page : pages) {
            if (page.equals(requestedUri)) {
                isAllow = true;
                break;
            }
        }

        if (isAllow) {
            filterChain.doFilter(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute(Constants.USER);
            System.out.println(user);
            if (user == null) {
            	response.sendRedirect(PathUtil.getFullPath("user/login"));
            } else {
                filterChain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
        this.notNeedLoginPages = null;

    }
}