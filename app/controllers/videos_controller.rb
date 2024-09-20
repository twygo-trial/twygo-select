class VideosController < ApplicationController
    before_action :set_video, only: [:show, :update, :destroy]
  
    # GET /videos
    def index
      @videos = Video.all
      render json: @videos
    end
  
    # GET /videos/:id
    def show
      render json: @video
    end
  
    # POST /videos
    def create
      @video = Video.new(video_params)
      if @video.save
        render json: @video, status: :created, location: @video
      else
        render json: @video.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /videos/:id
    def update
      if @video.update(video_params)
        render json: @video
      else
        render json: @video.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /videos/:id
    def destroy
      @video.destroy
      head :no_content
    end
  
    private
  
    def set_video
      @video = Video.find(params[:id])
    end
  
    def video_params
      params.require(:video).permit(:url, :size, :course_id)
    end
  end