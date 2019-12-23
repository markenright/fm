class PlayersController < ApplicationController

    get '/players' do     
        authorize
        @players = Player.all
        erb :'players/index'
    end
    #go to create new player
    get '/players/new' do  
        authorize  
        erb :'players/new'
    end


    get '/players/:id' do
        @player = Player.find_by(id: params[:id])
        
        erb :'players/show'
    end

    post '/players' do     
        authorize
        user = current_user
        
        if params[:name] == "" or params[:uniform_number] == ""
            
            @error_message = "Name and Uniform number must have values"
            erb :'players/new'
        else

            player = Player.create(name: params[:name], uniform_number: params[:uniform_number])
            raise PostSiteError.new if !player.save
        
            redirect '/home'
        end
    end



end