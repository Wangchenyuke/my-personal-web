package com.example.personalwebsite.controller;

import com.example.personalwebsite.entity.HometownCulture;
import com.example.personalwebsite.service.HometownCultureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/culture")
public class HometownCultureController {
    
    @Autowired
    private HometownCultureService cultureService;
    
    @GetMapping("/list")
    public String list(Model model) {
        List<HometownCulture> cultures = cultureService.list();
        model.addAttribute("cultures", cultures);
        return "culture/list";
    }
    
    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(@RequestBody HometownCulture culture) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (cultureService.save(culture)) {
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
            HometownCulture culture = cultureService.getById(id);
            result.put("code", 200);
            result.put("data", culture);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "系统错误：" + e.getMessage());
        }
        return result;
    }
    
    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> update(@RequestBody HometownCulture culture) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (cultureService.update(culture)) {
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
            if (cultureService.delete(id)) {
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