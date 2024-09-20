require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one) # Assuming you have a fixture set up for courses
  end

  # Test fetching all active courses
  test "should get index with active courses" do
    get courses_url
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal 1, json_response.length # Adjust based on the number of active courses in your fixture
  end

  # Test fetching a single course
  test "should show course" do
    get course_url(@course)
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @course.title, json_response["title"]
  end

  # Test creating a new course
  test "should create course" do
    assert_difference("Course.count") do
      post courses_url, params: {
        course: {
          title: "New Course",
          description: "Course Description",
          end_date: Date.today + 1.month,
          video_size: 0
        }
      }
    end

    assert_response :created

    json_response = JSON.parse(response.body)
    assert_equal "New Course", json_response["title"]
  end

  # Test updating an existing course
  test "should update course" do
    patch course_url(@course), params: { course: { title: "Updated Course Title" } }
    assert_response :success

    @course.reload
    assert_equal "Updated Course Title", @course.title
  end

  # Test deleting a course
  test "should destroy course" do
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    assert_response :no_content
  end
end
