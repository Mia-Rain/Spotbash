
# Spotbash
<p>
<p>
		<img src="https://cdn.discordapp.com/attachments/699685435198144553/758393878947561522/spotbash_ex2.png" width="20%" align="right"> 
	</p>
	Spotify Control API ~ Written in bash, using curl.
</p>

***
#### TODO
- [ ] Add play `playlist` support
- [ ] Add play `artist` suport
- [ ] Add play `album` support
- [ ] Add *any* modify support
***
## Setup
1. Go to the [developer dashboard](https://developer.spotify.com/dashboard/applications) and create a new app.
2. Remember the `Client ID` and the `Client Secret`\
2a. Open settings and add `http://localhost:5000/` to the redircet_uri whitelist
> Optionally edit `app.patch` to change the scopes, currently all non-follow scopes are used.
3. `bash ./setup.sh`
## Usage
1. `bash ./spotbash help`
***
Spotbash is a "Control API" which means it only controls the Spotify placyback of devices. It cannot be used as a standalone player!
***
Some usable devices are `librespot`, `Spotify Web Playback SDK`, `Spotifyd`, or any device with a Spotify app. 
