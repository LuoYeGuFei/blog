require 'rails_helper'

feature "visit home page" do
  scenario "should successfully" do
    visit root_path

    expect(page).to have_content "李亚中"
  end
end
