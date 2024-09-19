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
          }
      ],
      JSON.parse(@response.body).map { |r| r.transform_keys(&:to_sym) }
    )
  end
end
