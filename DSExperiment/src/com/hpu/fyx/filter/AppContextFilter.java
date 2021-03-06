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

import com.hpu.fyx.common.AppContext;
import com.hpu.fyx.common.Constants;
import com.hpu.fyx.model.User;

public class AppContextFilter implements Filter {

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        AppContext.setContextPath(request.getContextPath());

        AppContext appContext= AppContext.getContext();

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute(Constants.USER);
        appContext.addObject(Constants.APP_CONTEXT_USER, user);

        appContext.addObject(Constants.APP_CONTEXT_SESSION, session);

        try {
            filterChain.doFilter(request, response);
        } finally {
            appContext.clear();
        }
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {

    }
}
