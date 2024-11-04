package com.example.personalwebsite.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        
        // 如果用户未登录，重定向到登录页面
        if (user == null) {
            response.sendRedirect("/user/login");
            return false;
        }
        return true;
    }
} 