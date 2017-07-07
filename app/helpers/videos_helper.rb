module VideosHelper
	BASE_URL = "https://www.youtube.com/embed/"
	PLAYLIST_OPTION = "?playlist="
	PLAYER_OPTIONS = "&autoplay=1&controls=1&&showinfo=1&loop=1"
	YOUTUBE_REGEX = /youtu(?:.*\/v\/|.*v\=|\.be\/)([A-Za-z0-9_\-]{11})/
	
end