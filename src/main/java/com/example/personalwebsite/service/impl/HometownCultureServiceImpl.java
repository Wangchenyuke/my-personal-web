package com.example.personalwebsite.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.personalwebsite.entity.HometownCulture;
import com.example.personalwebsite.mapper.HometownCultureMapper;
import com.example.personalwebsite.service.HometownCultureService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("hometownCultureService")
public class HometownCultureServiceImpl extends ServiceImpl<HometownCultureMapper, HometownCulture> implements HometownCultureService {
    
    @Resource
    private HometownCultureMapper hometownCultureMapper;
    
    @Override
    public List<HometownCulture> list() {
        return hometownCultureMapper.selectList(null);
    }
    
    @Override
    public boolean save(HometownCulture culture) {
        return hometownCultureMapper.insert(culture) > 0;
    }
    
    @Override
    public boolean update(HometownCulture culture) {
        return hometownCultureMapper.updateById(culture) > 0;
    }
    
    @Override
    public boolean delete(Long id) {
        return hometownCultureMapper.deleteById(id) > 0;
    }
} 