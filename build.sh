#!/bin/bash
hugo -t angels-ladder

cd public
git add -A

msg="update `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"
git push

cd ..
