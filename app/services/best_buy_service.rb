class BestBuyService

  def initialize
    @_api_key = ENV["BEST_BUY_KEY"]
    @_connection = Faraday.new("http://api.bestbuy.com/v1/")
  end

  def stores_search(zip,range)
    response = connection.get do |req|
      req.url "stores(area(#{"zip",range}))?"
      req.params["format"] = "json"
      req.params["apiKey"] = "#{api_key}"
    end
    parse(response)
  end
  private

    def api_key
      @_api_key
    end

    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
