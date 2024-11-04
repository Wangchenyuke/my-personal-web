package com.example.personalwebsite.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("hometown_culture")
public class HometownCulture {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String title;
    private String content;
    private String imageUrl;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
} 