create database if not exists personal_website;

use personal_website;




-- 用户信息表
CREATE TABLE IF NOT EXISTS user_info (
                                         id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
                                         username VARCHAR(50) NOT NULL COMMENT '用户名',
                                         password VARCHAR(100) NOT NULL COMMENT '密码',
                                         real_name VARCHAR(50) COMMENT '真实姓名',
                                         email VARCHAR(100) COMMENT '邮箱',
                                         phone VARCHAR(20) COMMENT '手机号',
                                         address VARCHAR(200) COMMENT '地址',
                                         create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- 家乡文化表
CREATE TABLE IF NOT EXISTS hometown_culture (
                                                id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
                                                title VARCHAR(100) NOT NULL COMMENT '标题',
                                                content TEXT COMMENT '内容',
                                                image_url VARCHAR(200) COMMENT '图片URL',
                                                create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家乡文化表';

-- 特产信息表
CREATE TABLE IF NOT EXISTS local_product (
                                             id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
                                             name VARCHAR(100) NOT NULL COMMENT '特产名称',
                                             description TEXT COMMENT '特产描述',
                                             price DECIMAL(10,2) COMMENT '价格',
                                             image_url VARCHAR(200) COMMENT '图片URL',
                                             create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='特产信息表';

-- 旅游景点表
CREATE TABLE IF NOT EXISTS tourist_spot (
                                            id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
                                            name VARCHAR(100) NOT NULL COMMENT '景点名称',
                                            description TEXT COMMENT '景点描述',
                                            address VARCHAR(200) COMMENT '景点地址',
                                            ticket_price DECIMAL(10,2) COMMENT '门票价格',
                                            image_url VARCHAR(200) COMMENT '图片URL',
                                            create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='旅游景点表';

-- 插入测试数据
INSERT INTO user_info (username, password, real_name, email, phone) VALUES
    ('admin', '123456', '管理员', 'admin@example.com', '13800138000');

INSERT INTO hometown_culture (title, content, image_url) VALUES
                                                             ('传统文化', '这里是传统文化的详细介绍...', '/images/culture1.jpg'),
                                                             ('民间艺术', '这里是民间艺术的详细介绍...', '/images/culture2.jpg'),
                                                             ('地方特色', '这里是地方特色的详细介绍...', '/images/culture3.jpg');

INSERT INTO local_product (name, description, price, image_url) VALUES
                                                                    ('特产1', '这是特产1的详细描述...', 99.99, '/images/product1.jpg'),
                                                                    ('特产2', '这是特产2的详细描述...', 199.99, '/images/product2.jpg'),
                                                                    ('特产3', '这是特产3的详细描述...', 299.99, '/images/product3.jpg');

INSERT INTO tourist_spot (name, description, address, ticket_price, image_url) VALUES
                                                                                   ('景点1', '这是景点1的详细描述...', '景点1地址', 50.00, '/images/spot1.jpg'),
                                                                                   ('景点2', '这是景点2的详细描述...', '景点2地址', 80.00, '/images/spot2.jpg'),
                                                                                   ('景点3', '这是景点3的详细描述...', '景点3地址', 100.00, '/images/spot3.jpg');