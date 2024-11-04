package com.example.personalwebsite.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.personalwebsite.entity.HometownCulture;
import java.util.List;

public interface HometownCultureService extends IService<HometownCulture> {
    List<HometownCulture> list();
    boolean save(HometownCulture culture);
    boolean update(HometownCulture culture);
    boolean delete(Long id);
} 