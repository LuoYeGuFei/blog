class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  has_many :posts

  validates_presence_of :email, message: "邮箱不能为空"
  validates_format_of :email, message: "邮箱格式不正确",
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,
    if: proc { |user| !user.email.blank? }
  validates_presence_of :password, message: "密码不能为空",
    if: :need_validate_pw
  validates_presence_of :password_confirmation, message: "密码确认不能为空",
    if: :need_validate_pw
  validates_confirmation_of :password, message: "密码不一致",
    if: :need_validate_pw
  validates_length_of :password, message: "密码最短为6位", minimum: 6,
    if: :need_validate_pw

  private
  def need_validate_pw
    self.new_record? || (!password.nil? || !password_confirmation.nil?)
  end
end
