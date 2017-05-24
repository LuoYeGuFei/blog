module UserHelper

  def create_user(opt = {})
    User.create!({
      :email => "test@163.com",
      :password => "testpw",
      :password_confirmation => "testpw"}.merge(opt))
  end
end
