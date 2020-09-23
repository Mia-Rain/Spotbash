---


---

<h1 id="spotbash">Spotbash</h1>
<p>Spotify Client ~ Written in bash, using curl. With a bit of JS</p>
<hr>
<h4 id="todo">TODO</h4>
<ul>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Add play ‘playlist’ support</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Add play ‘artist’ suport</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Add play ‘album’ support</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Add <em>any</em> modify support</li>
</ul>
<hr>
<h2 id="setup">Setup</h2>
<ol>
<li>Go to the <a href="https://developer.spotify.com/dashboard/applications">developer dashboard</a> and create a new app.</li>
<li>Remember the <code>Client ID</code> and the <code>Client Secret</code><br>
2a. Open settings and add <code>http://localhost:5000/</code> to the redircet_uri whitelist</li>
</ol>
<blockquote>
<p>Optionally edit <code>app.patch</code> to change the scopes, currently all scopes non-follow scopes are used.</p>
</blockquote>
<ol start="3">
<li>`bash ./setup.sh</li>
</ol>
<h2 id="usage">Usage</h2>
<ol>
<li><code>bash ./spotbash help</code></li>
</ol>
<hr>
<p>Spotbash is a “Control API” which means it only controls the Spotify placyback of devices.</p>
<hr>
<p>Some usable devices are <code>librespot</code>, <code>Spotify Web Playback SDK</code>, <code>Spotifyd</code>, or any device with a Spotify app.</p>

