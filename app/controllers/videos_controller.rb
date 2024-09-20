class VideosController < ApplicationController
    before_action :set_video, only: [ :show, :update, :destroy ]

    # GET /videos
    def index
      @videos = Video.all
      render json: @videos
    end

    # GET /videos/:id
    def show
      if @video.file.attached?
        render json: { video_url: url_for(@video.file) }
      else
        render json: { error: "No video found" }, status: :not_found
      end
    end

    # POST /videos
    def create
      uploaded_file = video_params["file"]

      file_size = uploaded_file.size if uploaded_file.present?

      params = video_params.merge({ "size": file_size })

      @video = Video.new(params)

      if @video.save
        @video.resize_course()

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
      params.require(:video).permit(:file, :course_id)
    end
end
