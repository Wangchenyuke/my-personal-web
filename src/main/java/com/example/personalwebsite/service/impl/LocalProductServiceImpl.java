package com.example.personalwebsite.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.personalwebsite.entity.LocalProduct;
import com.example.personalwebsite.mapper.LocalProductMapper;
import com.example.personalwebsite.service.LocalProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LocalProductServiceImpl extends ServiceImpl<LocalProductMapper, LocalProduct> implements LocalProductService {
    
    @Resource
    private LocalProductMapper localProductMapper;
    
    @Override
    public List<LocalProduct> list() {
        return localProductMapper.selectList(null);
    }
    
    @Override
    public boolean save(LocalProduct product) {
        return localProductMapper.insert(product) > 0;
    }
    
    @Override
    public boolean update(LocalProduct product) {
        return localProductMapper.updateById(product) > 0;
    }
    
    @Override
    public boolean delete(Long id) {
        return localProductMapper.deleteById(id) > 0;
    }
} 