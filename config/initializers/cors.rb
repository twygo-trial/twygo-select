Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "*"  # For development purposes. Use a specific domain in production for security.

      resource "*",
        headers: :any,
        methods: [ :get, :post, :put, :delete, :options, :head ],
        expose: [ "Content-Disposition" ]  # This allows the client to access the headers necessary for Active Storage.
    end
  end
