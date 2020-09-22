#!/usr/bin/env bash
clID="70d2e79bdbd64448b19092b8739f6554" # Client ID for Spotbash
type="token" # Type of response code, token is used here
reuri="https://localhost:5000/callback" # Callback uri

echo "Notice: THIS REQUIRES NODE TO BE INSTALLED!"
git submodule update 
cd ./web-api-auth-examples/
npm install
mv ./node_modules ../
cd ../
rm ./web-api-auth-examples/
node ./app.js & disown
URI="https://accounts.spotify.com/authorize?client_id=$clID&response_type=$type&redirect_uri=$reuri"
echo "Please open $URI in your browser"
sleep 5
printf "Please input the new URL from you browser\n~>"
read hashURL
hashURL=$(echo $hashURL | sed -e 's,https://localhost:5000/callback#,,g' -e 's/&token_type.*//g' -e 's/access_token=//g')
echo $hashURL
pkill node