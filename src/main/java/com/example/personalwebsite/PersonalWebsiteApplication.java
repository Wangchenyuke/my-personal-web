package com.example.personalwebsite;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.example.personalwebsite.mapper")
@ComponentScan(basePackages = {"com.example.personalwebsite"})
public class PersonalWebsiteApplication {
    public static void main(String[] args) {
        SpringApplication.run(PersonalWebsiteApplication.class, args);
    }
} 