Rails.application.config.middleware.use OmniAuth::Builder do

  provider :cronofy, ENV["CRONOFY_CLIENT_ID"], ENV["CRONOFY_CLIENT_SECRET"], {
    scope: "read_account list_calendars create_event"
  }

end
