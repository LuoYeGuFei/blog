require 'rails_helper'

feature "user sign" do
  scenario "visit user sign page should successfully" do
    visit new_user_path

    expect(page).to have_css 'h1', text: "注册"
    expect(page).to have_content "邮箱"
    expect(page).to have_content "密码"
    expect(page).to have_content "密码确认"
  end

  scenario "should sign failed" do
    visit new_user_path

    within("form#user_form") do
      fill_in "user[email]", with: "text@163.com"
      click_button "创建用户"
    end

    expect(page).to have_css "div.alert"
  end

  scenario "should sign successfully" do
    visit new_user_path

    within("form#user_form") do
      fill_in "user[email]", with: "test@163.com"
      fill_in "user[password]", with: "testpw"
      fill_in "user[password_confirmation]", with: "testpw"
      click_button "创建用户"
    end

    expect(page).to have_current_path(new_session_path)
  end

end

feature "user login" do
  scenario "visit login page should successfully" do
    visit new_session_path

    expect(page).to have_css "h1", text: "登陆"
    expect(page).to have_css "a", text: "注册"
  end

  scenario "should login failed" do
    visit new_session_path

    within("form") do
      fill_in "email", with: "test@163.com"
      fill_in "password", with: "testpw"
      click_button "登陆"
    end

    expect(page).to have_css "div.alert"
  end

  scenario "should login successfully" do
    create_user
    visit new_session_path

    within("form") do
      fill_in "email", with: "test@163.com"
      fill_in "password", with: "testpw"
      click_button "登陆"
    end

    expect(page).to have_current_path(root_path)
  end
end
