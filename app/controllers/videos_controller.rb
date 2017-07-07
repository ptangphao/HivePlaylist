class VideosController < ApplicationController
	include VideosHelper

  def index
  end 
 	def create
 	end 
 	def destroy
 		@video = Video.find(params[:id])
 		@video.destroy
 		redirect_to root_path
 	end

 	def video_params
 		params.require(:video).permit(:url) 
 	end
end
