
# Spotbash
<p>
<p>
		<img src="https://cdn.discordapp.com/attachments/699685435198144553/758393878947561522/spotbash_ex2.png" width="27%" align="right"> 
	</p>
	Spotify Control API ~ Written in bash, using curl.
</p>

***
#### TODO
- [ ] Add play `artist` suport
- [ ] Add `album` search support

:x: Add *any* modify support
> Modify support seems to need to be done server side, support for it is currently on hold.

- [ ] Add functional Web SDK device into `app.js`
***
## Setup
1. Go to the [developer dashboard](https://developer.spotify.com/dashboard/applications) and create a new app.
2. Remember the `Client ID` and the `Client Secret`\
2a. Open settings and add `http://localhost:5000/` to the redircet_uri whitelist
> Optionally edit `app.patch` to change the scopes, currently all non-follow scopes are used.
3. `bash ./setup.sh`
## Usage
1. `bash ./spotbash help`
```
spotbash: Spotify Control API ~ Written in bash
Usage: spotbash:
[auth|device|search_play|search|play_track|get_volume|set_volume|get_info|previous|skip|pause|resume|loop|repeat|state|set|playlists|play]
***
auth: Print AUTHKEY and exit
device: Print first device ID and exit
devices: List ALL devices and exit
search_play: Search for "arg2" and play
search: Search for "arg2" and output URI & NAME
play_track: Play URI
get_volume: Output player volume and exit
set_volume: Set player volume to "arg2" and exit
get_info: Get debugging info about currently playing device
previous: Change playback to previous song
skip: Change playback to next song
pause: Pause playback
resume: Resume playback
loop: Loop track
repeat: Repeat current album/playlist
state: Output playback status and exit
repeat_off: Disable loop/repeat
repeat_state: Output playback repeat status and exit
set: Move playback to "arg2" | "arg2" must be a device ID
playlists: Output list of users playlists and exit
play: Play "arg2" | "arg2" must be Album or Playlist URI
***
```
***
Spotbash is a "Control API" which means it only controls the Spotify placyback of devices. It cannot be used as a standalone player!
***
Some usable devices are `librespot`, `Spotify Web Playback SDK`, `Spotifyd`, or any device with a Spotify app. 
***
I recommend using `Spotify Web Playback SDK` as a device, as it only requires a spotify compatible browser, and can be edited to support track based repeat.\
The linked `index.html` requires one to run `./spotbash auth` and copy the token to `const token = '*';`, found within the `index.html` file.\
NOTE: Playback can only last 1 hour as the oauth token expires in 1 hour of creation.
> [`index.html` (Click Me)](https://cdn.discordapp.com/attachments/699685435198144553/758540007572373514/index.html)
