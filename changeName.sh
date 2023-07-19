#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_project_name>"
    exit 1
fi

# 输入你的新项目名
NEW_PROJECT_NAME=$1

# 将 "flutter_template" 替换为新的项目名
find . -type f \( -name "*.dart" -o -name "*.yaml" -o -name "*.json" -o -name "README.md" \) -exec sed -i "s/flutter_template/$NEW_PROJECT_NAME/g" {} +

# 打印替换完成的信息
echo "Project renamed to $NEW_PROJECT_NAME"
