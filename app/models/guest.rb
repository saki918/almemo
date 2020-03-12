class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :members
  has_many :events
  has_many :images
  # ユーザーのセッションを30分で切れるようにする為の設定
  devise :timeoutable
end
