package com.sse.scoreAnalysis.interceptor;

import com.sse.scoreAnalysis.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        if(user!=null&&user.getRole()==2){
            return true;
        }else {
            request.setAttribute("info","您没有权限访问该路径！");
            //response.sendRedirect(request.getContextPath()+"/login");
            request.getRequestDispatcher("//main").forward(request, response);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
