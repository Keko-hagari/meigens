require 'sinatra/base'

class Base < Sinatra::Base
 set :root, File.join(File.dirname(__FILE__), '..')
 set :views, Proc.new { File.join(root, "views") } 
 configure do
   use Rack::Session::Cookie, :key => 'rack.session',
    :expire_after => 2592000,
    :secret => Digest::SHA256.hexdigest(rand.to_s)
 end
end