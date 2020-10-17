require './models/base.rb'

class User < ActiveRecord::Base
  validates :name,presence: true
  validates :email,presence: true
  validates :password,presence: true
  has_many :meigens,dependent: :destroy
  has_many :likes,dependent: :destroy
  def authenticate(user_id)
    return self.id == user_id ? true : false
  end
end
