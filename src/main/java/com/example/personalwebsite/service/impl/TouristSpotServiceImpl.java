package com.example.personalwebsite.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.personalwebsite.entity.TouristSpot;
import com.example.personalwebsite.mapper.TouristSpotMapper;
import com.example.personalwebsite.service.TouristSpotService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TouristSpotServiceImpl extends ServiceImpl<TouristSpotMapper, TouristSpot> implements TouristSpotService {
    
    @Resource
    private TouristSpotMapper touristSpotMapper;
    
    @Override
    public List<TouristSpot> list() {
        return touristSpotMapper.selectList(null);
    }
    
    @Override
    public boolean save(TouristSpot spot) {
        return touristSpotMapper.insert(spot) > 0;
    }
    
    @Override
    public boolean update(TouristSpot spot) {
        return touristSpotMapper.updateById(spot) > 0;
    }
    
    @Override
    public boolean delete(Long id) {
        return touristSpotMapper.deleteById(id) > 0;
    }
} 