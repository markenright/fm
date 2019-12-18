class TeamsController < ApplicationController

    get '/teams' do     
        authorize
        @teams = Team.all
        erb :'teams/index'
    end

    get '/teams/new' do  
        authorize  
        erb :'teams/new'
    end

    post '/teams' do     
        authorize
        user = current_user
        user.teams.build(name: params[:name], county: params[:county])
        raise PostSiteError.new if !user.save
        
        redirect '/teams'
    end

    delete '/teams/:id' do
        team = Team.find_by(id: params[:id])
        authorize_user(team)
        user = current_user
        if team
            team.destroy   
            redirect "/users/#{u.id}"
        end
    end

    get '/teams/:id/edit' do
        @team = Team.find_by(id: params[:id])
        authorize_user(@team)
        erb :'team/edit'
    end

    patch '/teams/:id' do
        user = current_user
        @team = Team.find_by(id: params[:id])
        authorize_user(@team)
        @team.update(name: params[:name], county: params[:county])
        redirect "/teams/#{user.id}"
    end
end