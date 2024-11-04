package com.example.personalwebsite.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.personalwebsite.entity.LocalProduct;
import java.util.List;

public interface LocalProductService extends IService<LocalProduct> {
    List<LocalProduct> list();
    boolean save(LocalProduct product);
    boolean update(LocalProduct product);
    boolean delete(Long id);
} 