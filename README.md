### 项目介绍
    
　　jboot-admin是基于[jboot](https://github.com/yangfuhai/jboot)全家桶构建的微服务实战项目，以微服务快速迭代开发为架构思想，目前包含后台管理模块、微信公众号模块，将来计划按照电商业务加入秒杀、商品、订单、app、小程序等模块。微服务模块分为api层、实体层、调用层、实现层、基础层，包含代码生成、用户角色权限、数据字典、日志管理、服务治理、服务监控、链路跟踪等功能。无论是学习jboot还是作为项目脚手架开发都是一个很好的选择。

　　jboot-admin主要的开发理念就是简单快速，所以框架里还包含一些其他特性，比如：

 - 简单好用的代码生成：微服务每个模块每层都可自动生成，只做核心代码开发，省去大量开发时间。
 - 牛逼的统一异常：分为业务、校验、系统异常，任何地方抛出异常都常可直接转化为前端提示，无需过多编码。
 - 快速的数据字典：将字典通过管理端配置，任何模块都可直接使用。
 - 业务状态管理：业务状态单独管理，即解耦了业务与状态又满足了分布式项目使用，在任何需要转码的地方都可直接使用。
 
 还有很多很多期待你在使用中发现。

 **感兴趣有疑问的可以加jboot群交流：601440615** 

### 技术选型

 - 核心框架：jboot 1.4.9/jfinal 3.4
 - 模版引擎：jfinal enjoy
 - 注册中心：consul/zookeeper
 - RPC：motan/dubbo
 - RPC治理：motan-manager
 - 安全框架：shiro/jwt [jwt + shiro 无状态认证授权 demo](./jboot-b2c/README.md)
 - 缓存框架：ehcache/redis
 - 容错隔离：hystrix
 - 调用监控：hystrix-dashboard
 - 链路跟踪：zipkin
 - 页面ui：layui 2.2.5

### 模块说明

项目为使用maven构建的多模块项目

 - jboot-admin-parent：父模块，主要管理依赖
 - jboot-admin-base：框架相关代码
 - jboot-admin：后台管理客户端模块
 - jboot-wechat：微信公众号客户端模块，客户端demo
 - jboot-b2c：b2c客户端模块，客户的demo
 - jboot-admin-service：系统服务端模块，包含api、entity、provider三个子模块
 - jboot-admin-service-api：系统服务api模块，定义服务端与客户端api标准
 - jboot-admin-service-entity：系统服务实体模块，定义服务所需model、dto、服务状态类
 - jboot-admin-service-provider：系统服务实现模块，针对api的实现
 - jboot-b2c-service：B2C服务端模块，包含api、entity、provider三个子模块
 - jboot-b2c-service-api：B2C服务api模块，定义服务端与客户端api标准
 - jboot-b2c-service-entity：B2C服务实体模块，定义服务所需model、dto、服务状态类
 - jboot-b2c-service-provider：B2C服务实现模块，针对api的实现
 
### 重要更新

    1、2018-01-18： 添加微信公众号模块jboot-wechat，微信公众号demo
    2、2018-01-23： 添加B2C服务端模块jboot-b2c-service，b2c商品管理demo
    3、2018-01-25： 添加B2C客户端模块，初始化上传，作为商城秒杀demo模块
    4、2018-02-01： B2C客户端添加 JWT 前后分离验证 demo 
 
### 项目使用

**请使用jdk8及以上版本，数据库为mysql。** 

    1、建立后台管理数据库：doc/sql/jboot-admin.sql，数据库名：jboot-admin，用户名密码root/root
    2、建立B2C数据库：doc/sql/jboot-b2c.sql，数据库名：jboot-b2c，用户名密码root/root
    3、启动consul或zookeeper，目前配置文件默认为consul+motan，如需替换dubbo + zookeeper可参考下面配置进行更改
    4、启动redis，需要配置密码为 123456，可在配置文件进行修改
    5、如需更改db/redis/consul/zookeeper等配置请更新客户端配置文件：jboot-admin/resources/jboot.properties
    6、如需更改db/redis/consul/zookeeper数据库配置请更新服务端配置文件：jboot-admin-service/jboot-admin-service-provider/resources/jboot.properties
    7、启动客户端：客户端启动入口：io.jboot.admin.Application
    8、启动服务端：服务端启动入口：io.jboot.admin.service.provider.app.Application
    9、启动B2C服务端：服务端启动入口：io.jboot.b2c.service.provider.app.Application
    10、浏览器访问：localhost:8888，默认用户名密码：admin/123123
        
    附加：
    监控相关功能需要安装对应服务才可正常使用
    注册中心监控需要安装：consul或zookeeper
    服务调用监控需要安装：hystrix-dashboard
    链路跟踪监控需要安装：zipkin-server
    服务治理需要安装：motan-manager
    这些都可以在网上下载或者自己编译，当然也可以加群下载
    
    
### 配置说明

可以在配置文件中更改db、consul、zookeeper、cache、mq等配置

客户端配置文件：jboot-admin/resources/jboot.properties<br>
服务端配置文件：jboot-admin-service/jboot-admin-service-provider/resources/jboot.properties    
    
motan + consul配置示例
   
    #use motan + consul
    jboot.rpc.type = motan
    jboot.rpc.registryType = consul
    jboot.rpc.registryAddress = 127.0.0.1:8500
    
dubbo + zookeeper配置示例

    #use dubbo + zookeeper
    jboot.rpc.type = dubbo
    jboot.rpc.registryType = zookeeper
    jboot.rpc.registryAddress = 127.0.0.1:2181
    
### 代码生成

对jboot 代码生成进行了配置文件的封装，使用更简单方便

1、配置代码生成配置文件，包含数据库配置与代码生成包相关配置
    
    配置文件位置：
    各模块 resources/jboot.properties

2、执行代码生成类

    代码生成入口：
    service interface api生成：io.jboot.admin.service.api.ge.GenCode
    model 实体生成：io.jboot.admin.service.entity.GenCode
    service impl 实现层生成：io.jboot.admin.service.provider.ge.GenCode

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
