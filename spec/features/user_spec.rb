require 'spec_helper'

describe "Home page" do
  it "displays title" do
    visit '/'
    expect(page).to have_content("DBC Missed Connections")
  end
end

describe "User Logs In" do
  let!(:nat) { User.create(name: "Nat", email: "email@email.com", password: "password") }
  let!(:category) { Category.create(name: "Gopher Snakes") }

  before(:each) do
    visit '/'
    fill_in "user_email", with: nat.email
    fill_in "user_password", with: nat.password
    click_on "log in"
  end

  it "and is redirected to their user page" do
    expect(page).to have_content("Nat")
  end

  it "and can see existing categories" do
    expect(page).to have_content("Gopher Snakes")
  end

  it "and stays logged in through sessions" do
    click_on "home"
    expect(page).to have_content("Nat")
  end

end