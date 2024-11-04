package com.example.personalwebsite.controller;

import com.example.personalwebsite.entity.UserInfo;
import com.example.personalwebsite.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
@CrossOrigin
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;
    
    @GetMapping("/login")
    public String loginPage() {
        return "user/login";
    }
    
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestParam String username, 
                                   @RequestParam String password, 
                                   HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        try {
            UserInfo user = userInfoService.login(username, password);
            if (user != null) {
                session.setAttribute("user", user);
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", user);
            } else {
                result.put("code", 401);
                result.put("msg", "用户名或密码错误");
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "系统错误：" + e.getMessage());
        }
        return result;
    }
    
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("users", userInfoService.list());
        return "user/list";
    }
    
    @GetMapping("/test")
    @ResponseBody
    public Map<String, Object> test() {
        Map<String, Object> result = new HashMap<>();
        result.put("code", 200);
        result.put("msg", "接口测试成功");
        return result;
    }
} 