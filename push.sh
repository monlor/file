#!/bin/bash
GitUrl="https://git.dev.tencent.com/monlor"

ProjectPath="$(pwd)"
ProjectName="$(echo $ProjectPath | sed -e "s|/.*/||")"
#打包html列表
echo "Add files to html list..."
./packhtml.sh

[ -z "$ProjectName" ] && echo "Null Project Name!" && exit
echo "Push [$ProjectName] To [$GitUrl/$ProjectName.git]."
cd "$ProjectPath"
find . -name '.DS_Store' | xargs rm -rf
git add .
git commit -m "`date +%Y-%m-%d`"
git remote rm origin
git remote add origin "$GitUrl"/"$ProjectName".git
git push -u origin master -f
echo "Exec finish, Ctrl+C to exit!"
sleep 1000