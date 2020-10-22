require './controllers/base.rb'
require './models/meigen.rb'
class SearchController < Base
  get '/' do
   @meigens = Meigen.where(['main LIKE ?', "%#{params[:search]}%"])
   .or(Meigen.where(['cartoon_title LIKE ?', "%#{params[:search]}%"]))
   erb :search
  end
end