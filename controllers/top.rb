require './controllers/base.rb'
class TopController < Base
 get '/' do
   @title = "sinatra-app"
   erb :top
 end
end