class RoutesController < ApplicationController
  def index
    # Collect user-defined routes
    routes = [
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
    ]

    render json: routes
  end
end
