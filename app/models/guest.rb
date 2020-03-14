# frozen_string_literal: true

class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:timeoutable
  # ユーザーのセッションを30分で切れるようにする為の設定
  has_many :members
  has_many :events
  has_many :images
end
