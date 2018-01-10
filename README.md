### 项目介绍

　　jruc是一个基于jfinal+beetl的快速web开发框架，做了大量实用封装，最大化简化程序员开发流程，提高开发效率，现已经过多个项目运行考验，后续会继续优化下去，最后感谢开源，支持开源，支持极简开发！

　　框架支持Mysql/Oracle多数据源配置，支持Model代码自动生成，用户-角色-资源授权管理，支持用户名密码登录、token自动登录方式，可灵活集成微信与APP认证，druid数据源监控，缓存服务，任务调度服务，集成easypoi文档导入与模版导出，支持word转pdf，word转html实现在线预览，简单配置即可集成微信，配置集成单点登录kisso/cas，支持redis分布式session，封装短信接口，目前支持阿里云短信，可扩展其他短信支持，封装文件存储接口，目前支持本地、阿里云OSS、七牛云存储，可扩展其他存储服务，同时集成ueditor实现本地与云存储，实现了一个简单的CMS功能，集成爬虫框架webmagic，支持openapi对外开发接口，先写这么多把还有好多就不一一列举了，期待在使用中发现他们吧。

　　安全方面对XSS攻击、注入攻击、CSRF攻击做了防范处理，支持设置HTTP Only、Referer Check等安全措施，对配置文件数据库连接密码加密，登录用户密码salt加密，openapi采用密钥对称加密保证接口服务安全。

　　jruc的设计初衷是开发一个一站式javaweb快速开发框架(包含后端MVC，前端UI)，但是随着到后来支撑的项目的增多，比如网站型、平台型、后端服务型、微信、APP等，他们有自己不同的技术特点与不同的UI展示，如果一直去扩展的话会导致项目臃肿，增加后续维护性，这样不是一个灵活的选择，所以决定将公共的框架层次的代码抽取出形成目前的jruc项目，编译后是一个jar包，可以在各自不同的项目中进行引用使用它，需要自定义扩展的在各自项目中扩展使用。

　　本人目前主要是使用业余时间来进行项目维护，后续会陆续补充使用文档，尽请期待！

　　具体使用请参见项目使用中的demo项目。

 **感兴趣有疑问的可以加群交流：285764382** 

### 技术选型

 - 核心框架：jfinal
 - 模版引擎：beetl
 - 安全框架：shiro
 - 数据连接池：druid
 - 调度框架：quartz
 - 缓存框架：ehcache/redis
 - 日志框架：slf4j
 - 爬虫框架：webmagic
 - 文档操作：easypoi
 - 富文本编辑器：ueditor
 - 单点登录：cas/kisso
 - 对象存储：阿里云oss/七牛云存储
 - 短信接口：阿里云短信
 - 微信框架：jfinal-weixin
 - jfinal扩展：jfinal-ext2
 - 页面ui：ace-admin/zui/weui

### 项目使用

　　请使用jdk7及以上版本，引入项目，mvn install  

　　参考项目：   
　　[jruc-admin：使用jruc实现的后台管理项目](http://git.oschina.net/rlaxuc/jruc-admin)
    
### 感谢

在项目搭建过程中，吸取了以下项目的很多代码启发，非常感谢！
- [jfinal](http://git.oschina.net/jfinal/jfinal)
- [JFinal_Authority](http://git.oschina.net/jayqqaa12/JFinal_Authority)
- [JFinal-ueditor](http://git.oschina.net/596392912/JFinal-ueditor)
- [jquery-weui](http://git.oschina.net/edik/jquery-weui)
- [JFinal-ext2](http://git.oschina.net/brucezcq/JFinal-ext2)    