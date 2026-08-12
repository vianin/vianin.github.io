#!/usr/bin/env bash
#checking if user entered a title
if [[ -z "$1" ]]; then
	echo 'Usage: ./new_post.sh "Post Title"'
	exit 1
fi
#processing begins
title=$1
today="$(date +%Y-%m-%d)"
result="${title// /-}"
resultlwr="${result,,}"
file="${today}-${resultlwr}.md"
filename="_posts/${today}-${resultlwr}.md"
echo "${title}"
echo "${today}"
echo "${result}"
echo "${resultlwr}"
echo "${filename}"
if [[ -f "${filename}" ]]; then
	echo "post exists already"
	echo "check ${file}"
	exit 1
fi
#creating a file and writing the yaml front matter embedded in markdown
cat << EOF > "${filename}"
---
title: ${title}
date: ${today}
---
EOF

#opening the newly created file
vim "${filename}"
