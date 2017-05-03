class HomeController < ApplicationController
  def welcome
    flash[:notice] = "欢迎来到李亚中的个人博客"
  end
end
