#require './config/environment'


require_relative './config/environment'

use Rack::MethodOverride
use SessionController
use TeamsController
use UsersController
run ApplicationController