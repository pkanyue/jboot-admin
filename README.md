### 项目介绍
    
　　jboot-admin是基于强大的微服务框架[jboot](https://github.com/yangfuhai/jboot)开发的后台管理框架，采用微服务架构设计思想，分为api层、服务实体层、服务调用层、服务实现层、服务基础层，涵盖了jboot提供的大部分功能，包含代码生成、认证权限、数据字典、日志管理、服务治理、服务监控、链路跟踪等功能，包含很多jboot微服务实战开发技巧，无论是学习jboot微服务开发还是作为鲜项目脚手架开发都是一个不错的选择。   

　　jboot-admin主要的开发理念就是简单快速，所以框架里还包含一些其他特性，比如：统一异常，省去了很多if else去返回提示，抛出的异常可直接转化为前端提示。数据字典缓存、数据字典指令、状态指令，解耦了业务、状态、数据字典，在需要decode的地方直接使用指令即可。还有很多很多期待你去代码里发现。

 **感兴趣有疑问的可以加jboot群交流：601440615** 

### 技术选型

 - 核心框架：jboot 1.2.7
 - 模版引擎：jfinal enjoy
 - 注册中心：consul/zookeeper
 - RPC：motan/dubbo
 - RPC治理：motan-manager
 - 安全框架：shiro
 - 缓存框架：ehcache/redis
 - 容错隔离：hystrix
 - 调用监控：hystrix-dashboard
 - 链路跟踪：zipkin
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
    2、启动consul或zookeeper，目前配置文件默认为motan，可进行更改，根据注释修改即可
    3、启动redis，默认密码为 123456，可在配置文件进行修改
    4、如需更改redis/consul等配置请更新客户端配置文件：jboot-admin/resources/jboot.properties
    5、如需更改redis/consul/数据库配置请更新服务端配置文件：jboot-admin-service/jboot-admin-service-provider/resources/jboot.properties
    6、启动客户端：客户端启动入口：io.jboot.admin.Application
    7、启动服务端：服务端启动入口：io.jboot.admin.service.provider.app.Application
    8、浏览器访问：localhost:8888，默认用户名密码：admin/123123
    
    附加：
    监控相关功能需要安装对应服务才可正常使用
    注册中心监控需要安装：consul
    服务调用监控需要安装：hystrix-dashboard
    链路跟踪监控需要安装：zipkin-server
    服务治理需要安装：motan-manager
    这些都可以在网上下载或者自己编译，当然也可以加群下载
    
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

登录界面：
![登录界面](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/0.png "登录界面")
资源管理：分为菜单与功能两种类型，菜单为左侧菜单树，功能为页面具体按钮或超链或其他资源内容，配置在资源管理内的资源只有通过授权后才可进行访问。
![资源管理](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/1.png "资源管理")
用户管理：配置系统的登录用户，并配置改用户角色。
![用户管理](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/4.png "用户管理")
角色管理：配置系统内角色，并配置角色具有哪些资源的权限。
![角色管理](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/3.png "角色管理")
数据管理：配置系统所需的字典参数，存储在缓存内，可灵活使用。
![数据管理](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/5.png "数据管理")
注册中心监控：监控注册中心页面
![注册中心监控](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/6.png "注册中心监控")
服务调用监控：hystrix服务调用监控
![服务调用监控](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/7.png "服务调用监控")
服务链路跟踪：zipkin链路跟踪
![服务链路跟踪](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/8.png "服务链路跟踪")
服务治理：motan-manager服务治理
![服务治理](https://raw.githubusercontent.com/pkanyue/jboot-admin/master/doc/img/9.png "服务治理")

### 感谢

 - jboot：https://github.com/yangfuhai/jboot
 - jfinal：http://git.oschina.net/jfinal/jfinal
 - layui：https://github.com/sentsin/layui
