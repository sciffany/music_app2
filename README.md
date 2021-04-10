# Musnippets
<img src="https://user-images.githubusercontent.com/10327456/114260262-5024c380-9a06-11eb-90df-8efff138fc2a.png" height="400px"/>
A Flutter application to listen to Spotify snippets on your playlist.


## Instructions to run

1. Makesure you have at least 1 playlist
    1. Login to your Spotify App
    1. Create a playlist, with at least 3 items

2. Fill in .env file with your credentials
    1. Go to https://developer.spotify.com/console/get-playlists/
    1. Click on Get Token
    1. For permissions, just tick `playlist-read-private`
    1. Copy and paste token to the .env.example file at the root of the project
    1. Also fill in your user id in the .env.example file
    1. Transfer .env.example contents to .env file at project root folder

3. Run code on Android Studio, e.g. on device Pixel 3 API 29

## Features:

1. Autoplay first song on open
2. Pause/play song
3. Scroll up and down to next song
4. UI with image and title
5. Pagination and loading to load next track from Spotify API every 2 songs

## Troubleshooting

1. Dio 401 - No bearer token/token has expired
2. No sound coming out at all (first song should autoplay) - Wipe all data from your device
<img src="https://user-images.githubusercontent.com/10327456/114260221-0e941880-9a06-11eb-8a2d-3325a1022a9e.png" width="400px" />





