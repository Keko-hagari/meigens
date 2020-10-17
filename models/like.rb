require './models/base.rb'

class Like < ActiveRecord::Base
 validates :score, presence: true
 belongs_to :user
 belongs_to :meigen
end
