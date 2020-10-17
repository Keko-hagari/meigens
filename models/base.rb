require 'bundler'
Bundler.require

enable :session

ActiveRecord::Base.establish_connection(
 adapter: 'sqlite3',
 database: './db/sinatra.db'
)