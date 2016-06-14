require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "returns all the items from database" do
    items = 5.times do |item|
      Item.create(
        name: "Name #{item}",
        description: "Description #{item}",
        image_url: "Image Url #{item}"
      )
    end

    get :index, format: :json

    json = JSON.parse(response.body)
    expected_keys = ["name", "description", "image_url"]

    expect(response.status).to eq(200)
    expect(json.count).to eq(5)
    expect(json.first.keys).to eq(expected_keys)
  end
end
