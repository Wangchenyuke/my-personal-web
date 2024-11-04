package com.example.personalwebsite.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.personalwebsite.entity.UserInfo;
import java.util.List;

public interface UserInfoService extends IService<UserInfo> {
    UserInfo login(String username, String password);
    List<UserInfo> list();
    boolean save(UserInfo userInfo);
    boolean update(UserInfo userInfo);
    boolean delete(Long id);
} 