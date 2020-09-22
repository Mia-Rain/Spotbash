#!/usr/bin/env bash
reuri="https://localhost:5000/callback" # Callback uri
echo "Notice: THIS REQUIRES NODE TO BE INSTALLED!"
if [ -d ./web-api-auth-examples ]; then
  rm ./web-api-auth-examples -rf
fi
git submodule update
if [ -d ./node_modules ]; then
  rm ./node_modules -rf
fi
if [ ! -f ./clients ]; then
  echo -n 'Client ID ='
  read ID
  echo -n 'Client Secret ='
  read sec
else
  source ./clients
fi
sed -i "s/'id';/'${ID}';/g" ./app.js
sed -i "s/'sec';/'${sec}';/g" ./app.js
cd ./web-api-auth-examples/
echo "Installing auth examples"
npm install 2>/dev/null
mv ./node_modules ../
cd ../
rm ./web-api-auth-examples/ -rf
echo "Please open 'localhost:5000' in your browser"
echo $(node ./app.js) > ./authkeys
echo "Authkeys were written to ./authkeys"
sed -i "s/client_id = '.*'/client_id = 'id'/g" ./app.js
sed -i "s/client_secret = '.*'/client_secret = 'sec'/g" ./app.js
printf 'ID=%b\nsed=%b' "${ID}" "${sec}" > ./clients
echo "ID and Secret have been written to ./clients"
# printf '\e[2J\e[H'