require "rails_helper"

RSpec.describe "Best buy service", type: :request do
  it "returns a list of stores in an area code" do
    VCR.use_cassette "best_buy_product_search" do
      service = BestBuyService.new
      response = service.stores_search(80202,25)

      expect(response[:total]).to eq(17)
    end
  end
end
