require 'rails_helper'

describe UsersController do

  context "create a user" do
    it "should be redirect to login page" do
      post :create, user: { email: "lyz@qq.com", password: '123456', password_confirmation: '123456' }
      expect(response).to redirect_to(new_session_path)
    end
  end

end
