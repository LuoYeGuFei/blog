class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of :content, :title, message: "不能为空"
end
