require './controllers/meigen.rb'
require './controllers/user.rb'
require './controllers/top.rb'
require './controllers/like.rb'
require './controllers/search.rb'

run Rack::URLMap.new({
 '/' => TopController.new,
 '/meigen' => MeigenController.new,
 '/user' => UserController.new,
 '/like' => LikeController.new,
 '/search' => SearchController.new
})