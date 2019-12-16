class ManagerController < ApplicationController
#index page - list of managers - pick or create new

    #get all managers
    get '/managers' do
        @managers = Manager.all
        erb :'managers/index'
    end

    #get by id, dynamic
    get "/managers/:id" do
        @manager = Manager.find(params[:id])
        erb :"managers/show"
    end

    #sends to the new manager page
    get "/managers/new" do
        erb :"managers/new"
    end

    #adds new manager to database
    post "/managers" do
        manager = Manager.create(params[:manager])
        redirect '/managers/#{manager.id}'  
    end

    #edit manager
    get "/managers/:id/edit" do
        @manager = manager.find(params[:id])
        erb :"managers/edit"  
    end


end