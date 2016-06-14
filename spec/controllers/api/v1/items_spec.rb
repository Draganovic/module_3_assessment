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

  it "returns an item by id" do
    item1 = Item.create(
      name: "Item1",
      description: "Description1",
      image_url: "Image1"
    )

    item2 = Item.create(
      name: "Item2",
      description: "Description2",
      image_url: "Image2"
    )
    get :index, id: item1.id, format: :json

    json = JSON.parse(response.body)
    expected_keys = ["name", "description", "image_url"]

    expect(response.status).to eq(200)
    require "pry"; binding.pry
  
  end


end
