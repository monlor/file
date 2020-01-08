#!/bin/sh
cat>./index.html<<-\EOF
<title>Monlor Files文件列表</title>
<meta charset="UTF-8">
<style>
a {display: block;margin: 10px;}
a:link{text-decoration: none; color:blue; font-size: 18px; font-family: 微软雅黑;}
a:visited{ color:green;}
a:hover{text-decoration: underline; color:#09f; font-size: 19px;}
a:active{text-decoration: blink; color: yellow;}
</style>
<h2>Monlor Files文件列表</h2>
EOF
reg="$(cat .ignorelist | tr '\n' '|' | sed -e 's/|$//')"
find . -type f | grep -Ev "${reg}" | sort -r |  while read file; do
	echo "<a href=\"$file\">$file</a>" >> index.html	
done
