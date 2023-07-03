class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  # ユーザーの新規登録には、パスワードは確認用を含めて2回入力すること
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },
            confirmation: true
# ユーザーの新規登録には、ニックネーム、メールアドレス、性別、
validates :name,
            presence: true
validates :nickname,
          presence: true
validates :gender,
          presence: true

  has_many :calendars
  has_many :diaries
  has_many :managements

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :gender_id, numericality: { other_than: 1, message: "を選択してください" }  
end
