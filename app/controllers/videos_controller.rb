class VideosController < ApplicationController
  def index
  end 
 	def create
 	end 
 	def destroy
 	end

 	def video_params
 		params.require(:video).permit(:url) 
 	end
end
