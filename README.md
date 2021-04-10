# music_app2

A Flutter application to listen to songs on your playlist.


## Instructions to run

1. Makesure you have at least 1 playlist
    1. Login to your Spotify App
    2. Create a playlist, with at least 3 items

2. Fill in .env file with your credentials
    2. Go to https://developer.spotify.com/console/get-playlists/
    3. Click on Get Token
    4. For permissions, just tick `playlist-read-private`
    5. Copy and paste token to the .env.example file at the root of the project
    6. Also fill in your user id in the .env.example file
    7. Transfer .env.example contents to .env file at project root folder

3. Run code on Android Studio, e.g. on device Pixel 3 API 29

##

Features:

1. Autoplay first song on open
2. Pause/play song
3. Scroll up and down to next song
4. UI with image and title
5. Pagination and loading to load next track from Spotify API every 2 songs
6. Error handling

## Troubleshooting

1. Dio 401 - No bearer token/token has expired
2. No sound coming out at all (first song should autoplay) - Wipe all data from your device