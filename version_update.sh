#!/bin/sh

version_tag=`cat build.tag | grep "version" | cut -d'=' -f2`
values=(${version_tag//./ })
echo before : ${values[0]}.${values[1]}.${values[2]}.${values[3]}
let values[3]=${values[3]}+1
echo after : ${values[0]}.${values[1]}.${values[2]}.${values[3]}
cat << EOF > build.tag
version.number=${values[0]}.${values[1]}.${values[2]}.${values[3]}
EOF
