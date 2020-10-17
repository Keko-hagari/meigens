require './models/base.rb'

class Meigen < ActiveRecord::Base
  validates :main, presence: true
  belongs_to :user
  has_many :likes
  def already_liked?(user_id)
    self.likes.exists?(user_id: user_id)
  end
end
