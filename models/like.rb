require './models/base.rb'

class Like < ActiveRecord::Base
 validates_uniqueness_of :meigen_id, scope: :user_id
 belongs_to :user
 belongs_to :meigen
end
