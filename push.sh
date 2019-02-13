#!/bin/bash
GitUrl1="https://git.dev.tencent.com/monlor"
GitUrl2="https://github.com/monlor"

ProjectPath="$(pwd)"
ProjectName="$(echo $ProjectPath | sed -e "s|/.*/||")"
#打包html列表
echo "Add files to html list..."
./packhtml.sh

function push() {
	GitUrl="$1"
	[ -z "$ProjectName" ] && echo "Null Project Name!" && exit
	echo "Push [$ProjectName] To [$GitUrl/$ProjectName.git]."
	cd "$ProjectPath"
	find . -name '.DS_Store' | xargs rm -rf
	git add .
	git commit -m "`date +%Y-%m-%d`"
	git remote rm origin
	git remote add origin "$GitUrl"/"$ProjectName".git
	git push -u origin master -f
}
push $GitUrl1
push $GitUrl2

echo "Exec finish, Ctrl+C to exit!"
sleep 1000
