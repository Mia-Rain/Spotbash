# Spotbash
Spotify Client ~ Written in bash, using curl. With a bit of JS
***
###### TODO
- [x] Add pause support
- [x] Add resume support 
- [x] Add skip support
- [x] Add previous support
- [x] Add 'device' support
- [x] Add 'get_info' support
- [x] Add 'get_volume' support
- [x] Add 'set_volume' support
- [ ] Add play 'track' support
- [ ] Add play 'playlist' support
- [ ] Add play 'artist' suport
- [ ] Add play 'album' support
- [ ] Add *any* modify support
***
## Setup
1. Go to the [developer dashboard](https://developer.spotify.com/dashboard/applications) and create a new app.
2. Remember the `Client ID` and the `Client Secret`\
2a. Open settings and add `http://localhost:5000/` to the redircet_uri whitelist.
3. `bash ./setup.sh`
## Usage
1. `bash ./spotbash help`

Note: Spotbash requires a play device, such as `spotifyd` or `librespot`
> Spotbash can currently only play from the first device on the list
