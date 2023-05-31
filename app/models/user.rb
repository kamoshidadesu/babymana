class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーの新規登録には、パスワードは確認用を含めて2回入力すること
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },
            confirmation: true
# ユーザーの新規登録には、ニックネーム、メールアドレス、
validates :name,
            presence: true
validates :nickname,
          presence: true

  has_many :calendars
  has_many :diaries
  has_many :managements
end
