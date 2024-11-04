package com.example.personalwebsite.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.personalwebsite.entity.TouristSpot;
import java.util.List;

public interface TouristSpotService extends IService<TouristSpot> {
    List<TouristSpot> list();
    boolean save(TouristSpot spot);
    boolean update(TouristSpot spot);
    boolean delete(Long id);
} 