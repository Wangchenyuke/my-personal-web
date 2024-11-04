package com.example.personalwebsite.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.personalwebsite.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {
} 