#!/bin/sh

set -x
set -e

name=$(gh release view -R BitPonyLLC/huekeys --json name -q .name)
gh release download -R BitPonyLLC/huekeys "$name" -p huekeys

sum=$(sha256sum huekeys | awk '{print $1}')
rm -f huekeys

# desc=$(chmod 555 huekeys && ./huekeys dump desc)
# -e 's/^\(\s*desc\) .*$/\1 "'"${desc}"'"/' \

sed -i \
    -e 's|^\(\s*url .*download\)/[^/]*|\1/'${name}'|' \
    -e 's/^\(\s*version\) .*$/\1 "'${name}'"/' \
    -e 's/^\(\s*sha256\) .*$/\1 "'${sum}'"/' \
    Formula/huekeys.rb
