package com.example.personalwebsite.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.personalwebsite.entity.UserInfo;
import com.example.personalwebsite.mapper.UserInfoMapper;
import com.example.personalwebsite.service.UserInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {
    
    @Resource
    private UserInfoMapper userInfoMapper;
    
    @Override
    public UserInfo login(String username, String password) {
        return userInfoMapper.selectOne(new QueryWrapper<UserInfo>()
                .eq("username", username)
                .eq("password", password));
    }
    
    @Override
    public List<UserInfo> list() {
        return userInfoMapper.selectList(null);
    }
    
    @Override
    public boolean save(UserInfo userInfo) {
        return userInfoMapper.insert(userInfo) > 0;
    }
    
    @Override
    public boolean update(UserInfo userInfo) {
        return userInfoMapper.updateById(userInfo) > 0;
    }
    
    @Override
    public boolean delete(Long id) {
        return userInfoMapper.deleteById(id) > 0;
    }
} 