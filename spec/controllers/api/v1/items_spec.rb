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

    get :show, id: item1.id, format: :json

    json = JSON.parse(response.body)
    expected_keys = ["name", "description", "image_url"]

    expect(response.status).to eq(200)
    expect(json["name"]).to eq("Item1")
    expect(json["name"]).to_not eq("Item2")
    expect(json.keys).to eq(expected_keys)
  end

  it "delets an item by id" do
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

    expect(Item.all.count).to eq(2)

    delete :destroy, id: item2.id, format: :json

    expect(response.status).to eq(204)
    expect(Item.all.count).to eq(1)
  end

end
