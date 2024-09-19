require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get routes_index_url
    assert_response :success

    assert_equal(
      [
        {
          method: "GET",
          path: "/",
          explanation: "show available routes"
        },
        {
          method: "GET",
          path: "/health",
          explanation: "get api health"
        },
        {
          method: "GET",
          path: "/courses",
          explanation: "list courses"
        },
        {
          method: "GET",
          path: "/courses/:id",
          explanation: "get course by id"
        },
        {
          method: "POST",
          path: "/courses",
          explanation: "create a new course"
        },
        {
          method: "PATCH/PUT",
          path: "/courses/:id",
          explanation: "update a course by id"
        },
        {
          method: "DELETE",
          path: "/courses/:id",
          explanation: "delete a course by id"
        },
        {
          method: "GET",
          path: "/courses/:course_id/videos",
          explanation: "get list of videos by course id"
        },
        {
          method: "POST",
          path: "/courses/:course_id/videos",
          explanation: "create a new video in the course"
        },
        {
          method: "GET",
          path: "/videos/:id",
          explanation: "get video by id"
        },
        {
          method: "PATCH/PUT",
          path: "/videos/:id",
          explanation: "update a video by id"
        },
        {
          method: "DELETE",
          path: "/videos/:id",
          explanation: "delete a video by id"
        }
      ],
      JSON.parse(@response.body).map { |r| r.transform_keys(&:to_sym) }
    )
  end
end
