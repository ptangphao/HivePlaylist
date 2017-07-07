module VideosHelper
	BASE_URL = "https://www.youtube.com/embed/"
	PLAYLIST_OPTION = "?playlist="
	PLAYER_OPTIONS = "&autoplay=1&controls=1&&showinfo=1&loop=1"
	YOUTUBE_REGEX = /youtu(?:.*\/v\/|.*v\=|\.be\/)([A-Za-z0-9_\-]{11})/

	def extract_id(url)
		basic_url = url.match(YOUTUBE_REGEX).to_s
		youtube_id = basic_url[-11..-1]
		return youtube_id
	end

	def embed_url
		youtube_ids = Video.all.map{|video| extract_id(video_url)}
		if youtube_ids.length > 1
			playlist_urls = youtube_ids[1..-1].join(",")
			return BASE_URL+youtube_ids[0]+PLAYLIST_OPTION+playlist_urls_videos+PLAYER_OPTIONS
		else
			return BASE_URL+youtube_ids[0]+PLAYLIST_OPTION+youtube_ids[0]+PLAYER_OPTIONS
		end
	end

	def scrape_title(url)
		page = Nokogiri::HTML(open(url),nil,Encoding::UTF_8.to_s)
		return page.css('title').first.text
	end

	def playlist_started?
		!Video.all.empty?
	end
end