require 'spec_helper'

describe CategoriesController do

  it "#index" do
    get :index
    expect(response.status).to eq(200)
  end

  context "#create" do
    it "should save a valid category to the database" do
      expect {
        post :create, category: { name: "GSnakes" }
      }.to change { Category.count }.by(1)
    end

    it "should not save an invalid category to the database" do
      expect {
        post :create, category: { name: nil }
      }.to_not change { Category.count }
    end
  end

end