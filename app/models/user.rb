class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,
    presence: true,
    length: {
      minimum: 8,
      maximum: 32,
      too_short: "名前は8文字以上です。",
      too_long: "名前は32文字以内です。"
    }
  validates :email,
    presence: true,
    length: {
      minimum: 8,
      maximum: 32,
      too_short: "Eメールアドレスは16文字以上です。",
      too_long: "Eメールアドレスは64文字以内です。"
    }

end
