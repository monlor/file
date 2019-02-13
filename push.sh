#!/bin/bash
# ./push.command这类形式，用第二种方法获取，想怎么运行都行
GitUrl="https://git.dev.tencent.com/monlor"

ProjectPath="$(pwd)"
ProjectName="$(echo $ProjectPath | sed -e "s|/.*/||")"

echo $ProjectPath,$ProjectName


[ -z "$ProjectName" ] && echo "Null Project Name!" && exit
echo "Push [$ProjectName] To [$GitUrl/$ProjectName.git]."
cd "$ProjectPath"
find . -name '.DS_Store' | xargs rm -rf
git add .
git commit -m "`date +%Y-%m-%d`"
git remote rm origin
git remote add origin "$GitUrl"/"$ProjectName".git
git push -u origin master -f
echo "脚本执行完成，Ctrl+C 退出"
sleep 1000