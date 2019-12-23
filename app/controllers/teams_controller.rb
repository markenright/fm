class TeamsController < ApplicationController
    #go to teams page
    get '/teams' do     
        authorize
        @teams = Team.all
        erb :'teams/index'
    end
    #go to create new team
    get '/teams/new' do  
        authorize  
        erb :'teams/new'
    end

    #create new team and save
    post '/teams' do     
        authorize
        user = current_user
        if params[:name] == "" or params[:country] == ""
            
            @error_message = "Team and country must have values"
            erb :'teams/new'
        else

            user.teams.build(name: params[:name], country: params[:country])
            raise PostSiteError.new if !user.save
        
            redirect '/home'
        end
    end

    
    #go to edit page by team
    get '/teams/:id/edit' do
        @team = Team.find_by(id: params[:id])
        authorize_user(@team)
        erb :'teams/edit'
    end

    #edit team entry and save
    patch '/teams/:id' do
        
        user = current_user
        @team = Team.find_by(id: params[:id])
        authorize_user(@team)
        @team.update(name: params[:name], country: params[:country])
        redirect "home"
    end

# delete team entry  
    delete '/teams/:id' do
        team = Team.find_by(id: params[:id])
        authorize_user(team)
        user = current_user
        if team
            team.destroy   
            redirect "/home"
        end
    end

end