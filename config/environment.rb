ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do    
    set :database, 'sqlite3:db/database.db'
end

ENV['SESSION_SECRET'] = "tester"


require_relative '../errors/post_site_error'

require_all 'errors'
require_all 'app'