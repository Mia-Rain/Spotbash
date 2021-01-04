
<h1> Spotbash </h1><p><p><img src="https://cdn.discordapp.com/attachments/699685435198144553/758393878947561522/spotbash_ex2.png" width="15%" align="right"> </p>Spotify Control API ~ Written in bash, using curl.</p>

***
## Setup
1. Go to the [developer dashboard](https://developer.spotify.com/dashboard/applications) and create a new app.
2. Remember the `Client ID` and the `Client Secret`\
2a. Open settings and add `http://localhost:5000/` to the redircet_uri whitelist
> You can optionally edit `app.patch` to change the scopes, note that doing this can break somethings.
> > You shouldn't mess with the patches unless you understand JS (`app.patch`) and HTML (`index.patch`) 
3. `./setup.sh`
---

# Musl
Those on musl won't be able to run `./setup` as it requires nodejs to be installed, which isn't yet compatible with musl libc...\
But Spotbash can still be used from musl, the user just has to create `$HOME/.cache/spotbash/authkeys`\
```
$ cat authkeys
REKEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
CLID=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
CLSEC=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```
The client ID and secret can be found in set 1 of [Setup](#Setup)\
While REKEY is a bit harder to get... And requires a browser and server to make a request to Spotifys API\
Spotify then returns the Auth key, and a Refresh key, the Refresh key is used to request new Auth keys since the expire 1 hour after being created\
[REKEY](https://www.thatgeekyweeb.is-dummy-thi.cc/REKEY/), can be used to get the `REKEY`
## Usage
1. `./spotbash help`
```text
Spotbash: Spotify Control API ~ Written in bash ~ By ThatGeekyWeeb (Mia)
Usage: spotbash:
[auth|device|search_*|play_track|*_volume|get_info|pre|trans|skip|pause|resume|loop|repeat|state|set|play*|*left|shuffle*]
***
auth: Print $AUTHKEY and exit
device: Print first device ID and exit
devices: List ALL devices and exit
search_play: Search for "arg2" and play
search_track: Search for "arg2" and output URI & Artist & name | "arg2" is interpreted as a track
search_album: Seach for "arg2" and output URI, Artist, & name | "arg2" is interpreted as a album
play_track: Play URI
get_volume: Output player volume and exit
set_volume: Set player volume to "arg2" and exit
get_info: Get debugging info about currently playing device
pre: Change playback to previous song
trans: Transfer playback to "arg2" | arg2 must be DeviceID | Uses device func if "arg2" is empty
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
playing: Print Song name followed by artist and exit
left: Print time left in MS (exact) and exit
minleft: Print time left in Mins (approximate) and exit
shuffle: Enable/Disable Shuffle | Set to "arg2" if specified
shuffle_state: Print state of shuffle and exit
***
"arg2" Usage:
<command> <"arg2">
IE: search_play "Man of The Year"
NOTE: Use qoutes!
***
```
***
potbash is a "Control API" which means it only controls the Spotify playback of devices.
