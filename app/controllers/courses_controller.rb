class CoursesController < ApplicationController
    before_action :set_course, only: [ :show, :update, :destroy ]

    # GET /courses
    def index
      @courses = Course.active_courses
      render json: @courses
    end

    # GET /courses/:id
    def show
      render json: @course
    end

    # POST /courses
    def create
      @course = Course.new(course_params)
      if @course.save
        render json: @course, status: :created, location: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /courses/:id
    def update
      if @course.update(course_params)
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end

    # DELETE /courses/:id
    def destroy
      @course.destroy
      head :no_content
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :description, :end_date, :video_size)
    end
end
