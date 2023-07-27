#!/bin/bash

# 检查输入参数
if [ $# -ne 1 ]; then
    echo "用法: $0 <new_project_name>"
    exit 1
fi

# 定义要替换的原始字符串
original_string="flutter_template"

# 定义要替换成的新字符串
new_string="$1"

# 定义要搜索的文件类型
file_types=("*.dart" "*.json" "*.yaml")

# 使用循环遍历文件类型
for file_type in "${file_types[@]}"; do
    # 使用find命令查找所有匹配的文件，并对每个文件进行替换操作
    find . -name "$file_type" -exec sed -i '' -e "s/${original_string}/${new_string}/g" {} \;
done

echo "替换完成！"
