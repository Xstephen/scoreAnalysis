package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.User;

public interface UserService {
    //检验用户登录
    User checkLogin(String username,String password);
}
