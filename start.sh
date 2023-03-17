# 判断用户是否安装了flutter
if [[ -z "$(which flutter)" ]]; then
    echo "请安装 flutter"
    exit 1
fi
# 安装 flutter
