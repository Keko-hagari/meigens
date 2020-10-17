require './controllers/base.rb'
require './models/like.rb'

class LikeController < Base
  post '/create' do
    @meigen = Meigen.find(params[:meigen_id].to_i)
    @likes = Like.where(meigen_id: @meigen.id)
    if session[:user_id] 
      @like = Like.new({score: params[:score].to_i, user_id: session[:user_id], meigen_id: params[:meigen_id].to_i})
      if @like.save
        redirecr "/meigen/#{params[:meigen_id]}"
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
end