#!/usr/bin/env bash
clID="70d2e79bdbd64448b19092b8739f6554" # Client ID for Spotbash
type="token" # Type of response code, token is used here
reuri="https://localhost:5000/callback" # Callback uri
pkill node
echo "Notice: THIS REQUIRES NODE TO BE INSTALLED!"
git submodule update
if [ -d ./node_modules ]; then
  rm ./node_modules -rf
fi
cd ./web-api-auth-examples/
npm install &>/dev/null
mv ./node_modules ../
cd ../
rm ./web-api-auth-examples/ -rf
node ./app.js > ./authkeys

printf '\e[2J\e[H'
pkill node