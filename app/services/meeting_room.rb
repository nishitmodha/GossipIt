module MeetingRoom
  class Create
    require 'faraday'
    require 'faraday/net_http'
    Faraday.default_adapter = :net_http

    def initialize
      base_url = "https://api.daily.co/v1/rooms"
      url = "/rooms"
      token = ENV['DAILY_TOKEN']
      
      @conn = Faraday.new(url: base_url) do |faraday|
        faraday.request  :json
        faraday.response :raise_error
        faraday.response :json
        faraday.headers = {'content-type' => 'application/json', 'authorization' => token }
      end
    end
    
    def create_room(name)
      response = @conn.post() do |req|
        req.body = {name: name}.to_json
      end
    end

    def show_rooms
      data = @conn.get()
      data.body["data"]
    end
  end
end
        