#!/usr/bin/env sh
set -e
yarn install
yarn build
cd dist

echo 'status.tribecamp.com' > CNAME

git init
git add -A
git commit -m 'Deploy 🚀'

git push -f git@github.com:tribecamp/status.git master:gh-pages

cd -
