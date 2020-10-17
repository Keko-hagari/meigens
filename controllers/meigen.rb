require './controllers/base.rb'
require './models/meigen.rb'
class MeigenController < Base
 get '/' do
   @meigenlist = Meigen.all
   erb :index
 end
 get '/:id' do
   @meigen = Meigen.find(params[:id]) 
   @likes = Like.where(meigen_id: @meigen.id)
   @like = Like.find_by(meigen_id: @meigen.id,user_id: session[:user_id])
   erb :show
 end
 post '/create' do
  if session[:user_id]
    @meigen = Meigen.new({:main => params[:main],:cartoon_title => params[:title],user_id: session[:user_id]})
    if @meigen.save
    redirect "/meigen/#{ @meigen[:id] }"
    else
      if @meigen.errors.present?
        erb :errors
      end
    end
  else
    @meigenlist = Meigen.all
    @message = "You cannot post without logging in"
     erb :index
  end
 end
 post '/:id/delete' do
  @meigen = Meigen.find(params[:id])
  @meigen.delete
  redirect '/meigen'
 end
end