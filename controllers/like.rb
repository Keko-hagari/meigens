require './controllers/base.rb'
require './models/like.rb'

class LikeController < Base
  post '/create' do
    @meigen = Meigen.find(params[:meigen_id].to_i)
    puts @meigen
    @likes = Like.where(meigen_id: @meigen.id)
    if session[:user_id] 
      @like = Like.new({user_id: session[:user_id], meigen_id: params[:meigen_id].to_i})
      if @like.save
        redirect "/meigen/#{params[:meigen_id]}"
      else
        erb :show
      end
    else
      @message = "You cannot post without logging in"
      erb :show
    end
  end
  post '/:id/delete' do
    @like = Like.find(params[:id])
    @like.delete
    redirect "/meigen/#{@like[:meigen_id]}"
  end
  get '/' do
    @meigens = Meigen.all.sort_by{|meigen| meigen.likes.count}.reverse
    erb :ranking
  end
end