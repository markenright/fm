class SessionController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do    
            authenticate(params[:username], params[:password])
            redirect '/home'
        
        end
    end

    get '/signup' do
        erb :'sessions/signup'
    end

end