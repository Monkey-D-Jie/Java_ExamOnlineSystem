调试说明：
用的是MySql的数据库
将项目部署至Tomcat服务器后，如果有Mysql数据库的话，
部署成功会自动项目中需要的各表。
考生登录要先注册，有了账号之后才能登入调试；----》对应的表为students表
后台管理：运行成功后，运行项目中test包下的UserTest可以生成一个有效的用户
【当然，最好的还是用h2数据库，我的JDK出了点问题- -！】
jdbc配置文件中的Mysql数据库配置信息：
jdbc.driver=org.gjt.mm.mysql.Driver
jdbc.url=jdbc:mysql://127.0.0.1:3306/exam
jdbc.username=root
jdbc.password=123456

H2数据库的配置信息（注释的部分）：
jdbc.driver=org.h2.Driver
jdbc.url=jdbc:h2:file:E:/data/exam
jdbc.username=sa
jdbc.password=
------》对应到的管理员生成类为：Listenner包中的Listen类

最后，最好还是用IE浏览器，其他的浏览器因为兼容性问题，可能会出现一些奇怪的问题