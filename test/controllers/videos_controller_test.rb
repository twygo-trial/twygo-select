require "test_helper"

class VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file = fixture_file_upload("sample_video.mp4", "video/mp4")  # Fixture for a video file
    @course = courses(:one)
    @video = videos(:one)
    @video.file = @file
    @video.save
  end

  test "should create video and update course size" do
    assert_difference("Video.count") do
      post course_videos_url(@course), params: {
        video: { course_id: @course.id, file: @file }
      }
    end

    video = Video.last
    @course.reload

    assert_response :created
    assert_equal @file.size, @course.video_size, "Course video_size was not updated correctly"
  end

  test "should show video with file attached" do
    get video_url(@video)

    assert_response :success
    json_response = JSON.parse(response.body)
    assert json_response["video_url"].present?, "Video URL should be present"
  end

  test "should delete video" do
    assert_difference("Video.count", -1) do
      delete video_url(@video)
    end

    assert_response :no_content
  end

  test "should delete video and decrement course size" do
    video = Video.new(file: @file, size: 10, course: @course)
    video.save
    @course.video_size = video.size
    @course.save

    assert_difference("Video.count", -1) do
      delete video_url(video)
    end

    assert_response :no_content
    assert_equal @course.reload.video_size, 0
  end
end
