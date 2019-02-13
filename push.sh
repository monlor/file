#!/bin/bash
GitUrls=("https://git.dev.tencent.com/monlor"
	"https://github.com/monlor")
# Get Project Info
ProjectPath="$(pwd)"
ProjectName="$(echo $ProjectPath | sed -e "s|/.*/||")"
# clean useless files
find . -name '.DS_Store' | xargs rm -rf
# git add
git add .
git commit -m "`date +%Y-%m-%d`"
# push func
function push() {
	GitUrl="$1"
	[ -z "$ProjectName" ] && echo "Null Project Name!" && exit
	echo "Push [$ProjectName] To [$GitUrl/$ProjectName.git]."
	git remote rm origin
	git remote add origin "$GitUrl"/"$ProjectName".git
	git push -u origin master -f
}
# push begin
for url in ${GitUrls[*]}; do
	push $url
done
# Exit prompt
echo "Exec finish, Ctrl+C to exit!"
sleep 1000
