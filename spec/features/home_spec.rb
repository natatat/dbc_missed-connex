require 'spec_helper'

describe 'Home page' do
  it 'displays title' do
    visit '/'

    expect(page).to have_content("DBC Missed Connections")
  end

  it 'does not redirect if validations fail' do
    visit '/'
    click_on 'yes'

    expect(page).to have_content("DBC Missed Connections")
  end
end

feature 'User can create a category' do
  scenario 'user creates a category' do
    visit '/'
    fill_in 'category_name', with: 'g snakes'
    click_on 'yes'

    expect(page).to have_content("g snakes")
  end
end