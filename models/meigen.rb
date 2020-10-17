require './models/base.rb'

class Meigen < ActiveRecord::Base
  validates :main, presence: true
  belongs_to :user
  has_many :likes
end
