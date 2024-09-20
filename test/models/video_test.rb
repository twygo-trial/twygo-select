require "test_helper"

class VideoTest < ActiveSupport::TestCase
  test "should not save video without size and file" do
    video = Video.new(course: course)

    assert_not video.save, "Error: Saved the video without a size or file"
  end

  test "should create a video with size and file" do
    video = Video.new(size: 100, course: course)
    video.file.attach(io: File.open("test/fixtures/files/sample_video.mp4"), filename: "sample_video.mp4", content_type: "video/mp4")

    assert video.save, "Error: Failed to save video with a size and file"
  end

  test "increment_course should update course video_size" do
    video = Video.new(size: 200, course: course)
    video.file.attach(io: File.open("test/fixtures/files/sample_video.mp4"), filename: "sample_video.mp4", content_type: "video/mp4")

    # Call the increment_course method to update the course size
    video.increment_course

    assert_equal 200, video.course.reload.video_size, "Course video_size was not updated correctly"
  end

  test "should decrement course size on destroy" do
    course = course(20)
    video = Video.new(course: course, size: 20)
    video.decrement_course

    assert_equal course.reload.video_size, 0
  end

  def course(video_size = 0)
    # Provide valid values for description and end_date
    course = Course.create!(title: "Test Course", description: "Test description", end_date: Date.today + 1.month, video_size: video_size)
  end
end
