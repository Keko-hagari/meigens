require './controllers/meigen.rb'
require './controllers/user.rb'
require './controllers/top.rb'
require './controllers/like.rb'

run Rack::URLMap.new({
 '/' => TopController.new,
 '/meigen' => MeigenController.new,
 '/user' => UserController.new,
 '/like' => LikeController.new
})