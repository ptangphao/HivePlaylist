class Video < ApplicationRecord
	include VideosHelper
	before_create :set_title

	protected

	def set_title
		self.title = scrape_title(self.url)
	end
end
