#!/usr/bin/env bash
IFS=""
reuri="http://localhost:5000/callback" # Callback uri
echo "Notice: THIS REQUIRES NODE TO BE INSTALLED!"
pkill node &>/dev/null
if [ ! -d ./web-api-auth-examples ]; then
  if [ -f $(which git) ]; then
  	git submodule update
  	git clone git://github.com/zhenyu0519/web-api-auth-examples.git &>/dev/null
  elif [ -f $(which curl) ] && [ -f $(which tar) ]; then 
	curl -#L "http://github.com/zhenyu0519/web-api-auth-examples/archive/master.tar.gz" | tar xfz - && mv ./web-api-auth-examples-master/ ./web-api-auth-examples 
  else 
	echo "Couldn't find a way to clone github/zhenyu0519/web-api-auth-examples/"
	echo "Supported ways are:"
	printf 'Tar & cURL\nGit Clone\n'
	echo "Please download and safe github/zhenyu0519/web-api-auth-examples/ to ./web-api-auth-examples"
	exit 1
  fi
fi
# Ik Ik https is better, but some devices have issues with ssl, (as does mine), thus I am trying to avoid it
##
  cd ./web-api-auth-examples/authorization_code
  cp ../../app.patch ./
  patch -Np0 ./app.js < ./app.patch
  cd ./public
  cp ../../../index.patch ./
  patch -Np0 ./index.html < ./index.patch
  cd ../../../
  cp ./web-api-auth-examples/authorization_code/* -r ./
  cp ./web-api-auth-examples/authorization_code/public -r ./
##
if [ ! -f ./clients ]; then
  echo -n 'Client ID ='
  read CLID
  echo -n 'Client Secret ='
  read CLSEC
else
  source ./clients
fi
sed -i "s/'id';/'${CLID}';/g" ./app.js
sed -i "s/'sec';/'${CLSEC}';/g" ./app.js

if [ ! -f $(which npm) ]; then
  echo "npm is required!"
  exit 1
elif [ ! -d ./node_modules/fs ]; then
  npm install --save fs
elif [ ! -d ./node_modules/http ]; then
  npm install --save http
fi

if [[ -d ./node_modules/ && $(ls ./node_modules/ | wc -l) != 54 ]]; then
# Can't remeber how to do the above in a POSIX test, so I used bash...
  rm ./node_modules -rf
  cd ./web-api-auth-examples/
  echo "Installing auth examples"
  npm install &>/dev/null
  mv ./node_modules ../
  cd ../
elif [ ! -d ./node_modules/ ]; then
  cd ./web-api-auth-examples/
  echo "Installing auth examples"
  npm install &>/dev/null
  mv ./node_modules ../
  cd ../
fi
rm ./web-api-auth-examples/ -rf
cat << EOF > ./public/consts.js
	const client_id = "${CLID}";
	const client_secret = "${CLSEC}";
	console.log("client_id is: " + client_id + "\n client_secret is: " + client_secret);
EOF
echo "Please open 'localhost:5000' in your browser"
node ./app.js > ./authkeys & disown
sleep 20
echo $(cat ./authkeys | sed -z 's/%\n/REKEY=/g') > ./authkeys
echo "Authkeys were written to ./authkeys"
sed -i "s/client_id = '.*'/client_id = 'id'/g" ./app.js
sed -i "s/client_secret = '.*'/client_secret = 'sec'/g" ./app.js
printf 'CLID=%b\nCLSEC=%b' "${CLID}" "${CLSEC}" > ./clients
echo "ID and Secrets have been written to ./clients"
#rm ./public -rf
mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache/}//spotbash
cat ./clients >> ./authkeys
cp ./authkeys ${XDG_CACHE_HOME:-$HOME/.cache/}//spotbash
