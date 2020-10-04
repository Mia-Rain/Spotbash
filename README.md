
<h1> Spotbash </h1><p><p><img src="https://cdn.discordapp.com/attachments/699685435198144553/758393878947561522/spotbash_ex2.png" width="15%" align="right"> </p>Spotify Control API ~ Written in bash, using curl.</p>

***
### Pull Requests
The development of Spotbash has ended indefinitely, but if anything is missing, or you might want to see, open a PR, I'll review it and merge it!
> ***

#### Things that are missing
Several things are missing from Spotbash, here are a few;
Follow support (Users cannot Follow playlists, albums or artists using Spotbash)
> Heart/Like support (No ability to like tracks or add them to a certain playlist is implemented)

Playlist editing/creation (Playlists can only be played from)
Modify support (The ability to modify playlists, is currently on supported)
etc.
> There are many more things that could/should be implemented, but this is simply a control API and was only meant to be a proof of concept, as well as a response to a joke a friend made.
```
Spotify client written in shell when lmao
```
***
## Setup
1. Go to the [developer dashboard](https://developer.spotify.com/dashboard/applications) and create a new app.
2. Remember the `Client ID` and the `Client Secret`\
2a. Open settings and add `http://localhost:5000/` to the redircet_uri whitelist
> Optionally edit `app.patch` to change the scopes, currently, all non-follow scopes are used.
3. `./setup.sh`
## Usage
1. `./spotbash help`
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
Spotbash is a "Control API" which means it only controls the Spotify playback of devices. The nodejs server can be used as a standalone player;

See below.
***
I recommend using `Spotify Web Playback SDK` as a device, as it only requires a Spotify compatible browser.  

Additionally, a Web Playback SDK implementation is embedded into `app.js`, and can be used after running `setup.sh`

Note that `setup.sh` disowns a `node` process, meaning a `node` process will continue to run in the background until it is killed

Closing the Browser Tab will not kill this process!\
If you have any issues trying to use the Web Playback SDK implementation please open an issue!
> Please do not open any issues regarding authorization failure, this is most likely due to the lifetime of an OAuth key being only 1 hour long.
