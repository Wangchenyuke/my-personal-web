package com.example.personalwebsite.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("tourist_spot")
public class TouristSpot {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private String description;
    private String address;
    private BigDecimal ticketPrice;
    private String imageUrl;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
} 