require 'spec_helper'

describe UsersController do

  it "#index" do
    get :index
    expect(response.status).to eq(200)
  end

  it "#new" do
    get :new
    expect(response.status).to eq(200)
  end

  context "#create" do
    it "creates a valid user in the database" do
      expect {
        post :create, user: { email: "nat@gmail.com", password: "password" }
      }.to change { User.count }.by(1)
    end

    it "doesn't create an invalid user in the database" do
      expect {
        post :create, user: { name: "Nat" }
      }.to_not change { User.count }
    end
  end

end