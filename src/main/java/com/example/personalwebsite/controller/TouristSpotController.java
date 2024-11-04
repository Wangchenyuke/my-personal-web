package com.example.personalwebsite.controller;

import com.example.personalwebsite.entity.TouristSpot;
import com.example.personalwebsite.service.TouristSpotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tourist")
public class TouristSpotController {
    
    @Autowired
    private TouristSpotService touristSpotService;
    
    @GetMapping("/list")
    public String list(Model model) {
        List<TouristSpot> spots = touristSpotService.list();
        model.addAttribute("spots", spots);
        return "tourist/list";
    }
    
    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@RequestBody TouristSpot spot) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (touristSpotService.save(spot)) {
                result.put("code", 200);
                result.put("msg", "添加成功");
            } else {
                result.put("code", 500);
                result.put("msg", "添加失败");
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "系统错误：" + e.getMessage());
        }
        return result;
    }
    
    @GetMapping("/get/{id}")
    @ResponseBody
    public Map<String, Object> getById(@PathVariable Long id) {
        Map<String, Object> result = new HashMap<>();
        try {
            TouristSpot spot = touristSpotService.getById(id);
            result.put("code", 200);
            result.put("data", spot);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "系统错误：" + e.getMessage());
        }
        return result;
    }
    
    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> update(@RequestBody TouristSpot spot) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (touristSpotService.update(spot)) {
                result.put("code", 200);
                result.put("msg", "更新成功");
            } else {
                result.put("code", 500);
                result.put("msg", "更新失败");
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "系统错误：" + e.getMessage());
        }
        return result;
    }
    
    @PostMapping("/delete/{id}")
    @ResponseBody
    public Map<String, Object> delete(@PathVariable Long id) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (touristSpotService.delete(id)) {
                result.put("code", 200);
                result.put("msg", "删除成功");
            } else {
                result.put("code", 500);
                result.put("msg", "删除失败");
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "系统错误：" + e.getMessage());
        }
        return result;
    }
} 