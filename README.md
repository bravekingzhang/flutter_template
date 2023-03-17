# flutter_template_mason

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A new brick created with the Mason CLI.


## Feature




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

