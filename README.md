# flutter_template_mason

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A new brick created with the Mason CLI.


## Feature

<img src="https://ask.qcloudimg.com/developer-images/article/1203298/eh209frbg8.gif" width="200px"/>

支持了多语言配置

修改配置文件，保存将自动生成多语言，维护多套语音成本非常低。
![](https://ask.qcloudimg.com/developer-images/article/1203298/bw2rrgbh69.png?imageView2/2/w/2560/h/7000)

支持设置主题
![](https://ask.qcloudimg.com/developer-images/article/1203298/mce9kqe2if.png?imageView2/2/w/2560/h/7000)

基于hydrated_bloc实现的动态主题管理，自动实现设置好的主题缓存，底层hive实现，比pref等性能更好。

flutter_bloc全局数据管理
![](https://ask.qcloudimg.com/developer-images/article/1203298/708of3kyyr.png?imageView2/2/w/2560/h/7000)

一个bloc实现的简单计数器的示例，完全按照官方标准来实施。极致的实现页面和逻辑隔离，支持灵活的单元测试，组件化测试。

fontawesome支持，无限免费精美icon随便使用
![](https://ask.qcloudimg.com/developer-images/article/1203298/4rpcdp0o6k.png?imageView2/2/w/2560/h/7000)

告别flutter自带icon不全的困扰。想要的icon这里可以搜索，https://fontawesome.com/icons

能搜到就可以使用。


## Getting Started 🚀

```shell

# 安装mason_cli
dart pub global activate mason_cli

# 创建一个文件夹，并在该文件夹下创建一个文件mason.yaml

make dir ${your_project_name}
cd ${your_project_name}
touch mason.yaml

# 写入一些配置
bricks:
  flutter_template_mason:
    git:
      url: "https://github.com/bravekingzhang/flutter_template_mason"
      path: "."

# add brick
mason get

# 基于模板生成项目
mason make flutter_template_mason --project_name ${your_project_name}


```
其中 ${your_project_name} 替换为你项目的名字



