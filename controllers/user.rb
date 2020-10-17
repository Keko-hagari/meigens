require './controllers/base.rb'
require './models/user.rb'
class UserController < Base
  get '/signup' do
    erb :signup
  end
  get '/login' do
    erb :login
  end
  post '/create' do
    @user = User.new({name: params[:name], email: params[:email], password: params[:password]})
    if @user.save
      session[:user_id] = @user.id.to_i
      redirect "/user/#{@user.id}"
    else
      if @user.errors.present?
        @errors = @user.errors
        erb :errors
      end
    end
  end
  post '/auth' do
    @user = User.find_by(name: params[:name], email: params[:email], password: params[:password])
    if @user.nil?
      redirect '/user/login'
    end
    session[:user_id] = @user.id.to_i
    redirect "/user/#{@user.id}"
  end
  post '/logout' do
    session.clear
    redirect '/'
  end
  get '/:id' do 
    @user = User.find(params[:id])
    if @user && @user.authenticate(session[:user_id])
      erb :user
    else
      redirect '/user/login'
    end
  end
end