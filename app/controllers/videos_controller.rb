class VideosController < ApplicationController
 include VideosHelper

  def index
   if playlist_started?
  	protect_playlist
  	@url = embed_url
   end
   @playlist = Video.all
   @video = Video.new
  end 

 	def create
 	 @video = Video.new(video_params)
 	 if @video.save
 		flash[:success] = "Successfully added #{@video.title} to the playlist."
 	 else
 		flash[:danger] = "Failed to add video to the playlist"
 	 end
 		redirect_to root_path
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
