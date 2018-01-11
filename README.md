### 项目介绍
    
　　jboot-admin为使用强大的微服务框架[jboot](https://github.com/yangfuhai/jboot)开发的后台管理系统，完全按照微服务思路设计开发，可用作后台系统项目脚手架，涵盖了jboot提供的大部分功能，包含代码生成、认证权限、数据字典、服务治理、服务监控、链路跟踪等功能，包含很多jboot微服务实战开发技巧，无论是学习jboot微服务还是作为脚手架开发都是一个不错的选择。   

 **感兴趣有疑问的可以加jboot群交流：601440615** 

### 技术选型

 - 核心框架：jboot 1.2.6
 - 模版引擎：enjoy
 - RPC：motan
 - 安全框架：shiro
 - 缓存框架：ehcache/redis
 - 页面ui：layui

### 模块说明

　　项目为使用maven构建的多模块项目

 - jboot-admin-parent：父模块，主要管理依赖
 - jboot-admin-base：框架相关代码
 - jboot-admin：客户端模块
 - jboot-admin-service：服务端模块，包含api、entity、provider三个模块
 - jboot-admin-service-api：服务api模块，定义服务端与客户端api标准
 - jboot-admin-service-entity：服务实体模块，定义服务所需model、dto管理服务状态
 - jboot-admin-service-provider：服务实现模块，针对api的实现
 
### 项目使用

    请使用jdk8及以上版本，数据库为mysql。
    1、建立数据库：doc/jboot-admin-mysql.sql，用户名密码root/root
    2、启动consul
    3、启动redis
    4、如需更改redis/consul等配置请更新客户端配置文件：jboot-admin/resources/jboot.properties
    5、如需更改redis/consul/数据库配置请更新服务端配置文件：jboot-admin-service/jboot-admin-service-provider/resources/jboot.properties
    6、启动客户端：客户端启动入口：io.jboot.admin.Application
    7、启动服务端：服务端启动入口：io.jboot.admin.service.provider.app.Application
    8、浏览器访问：localhost:8888，默认用户名密码：admin/123123

### 代码生成

    对jboot 代码生成进行了配置文件的封装，使用更简单方便
    
    先配置代码生成配置文件，包含数据库配置与代码生成包相关配置
    然后执行代码生成入口类

    provider实现类生成配置文件示例：
    #---------------------------------------------------------------------------------#
    # Generator Config
    # jboot.admin.serviceimpl.ge.entity.package: the entity package;
    # jboot.admin.serviceimpl.ge.servicepackage：service 接口 package
    # jboot.admin.serviceimpl.ge.serviceimplpackage：service 实现类 package
    # jboot.admin.serviceimpl.ge.localdev.removedtablenameprefixes: 需要移除表名前缀只留下后部分，多个逗号隔开
    # jboot.admin.serviceimpl.ge.localdev.excludedtable: 生成时不包含表名列表，多个逗号隔开
    # jboot.admin.serviceimpl.ge.excludedtableprefixes: 生成时不包含表前缀，多个逗号隔开
    #---------------------------------------------------------------------------------#
    jboot.admin.serviceimpl.ge.modelpackage=io.jboot.admin.service.entity.model
    jboot.admin.serviceimpl.ge.servicepackage=io.jboot.admin.service.api
    jboot.admin.serviceimpl.ge.serviceimplpackage=io.jboot.admin.service.provider
    jboot.admin.serviceimpl.ge.removedtablenameprefixes=sys_
    jboot.admin.serviceimpl.ge.excludedtable=
    jboot.admin.serviceimpl.ge.excludedtableprefixes=temp_,v_

    配置文件位置：
    各模块 resources/jboot.properties

    代码生成入口：
    service interface api生成：io.jboot.admin.service.api.ge.GenCode    
    model 实体生成：io.jboot.admin.service.entity.GenCode
    service impl 实现层生成：io.jboot.admin.service.provider.ge.GenCode

### 演示页面



### 感谢

 - jboot：https://github.com/yangfuhai/jboot
 - jfinal：http://git.oschina.net/jfinal/jfinal
 - layui：https://github.com/sentsin/layui
