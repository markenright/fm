class ManagerController < ApplicationController
#index page - list of managers - pick or create new

    

    get '/' do
        redirect '/managers'
    end

#1 get all managers
    get '/managers' do
        @managers = Manager.all
        erb :'managers/index'
    end

    #2 sends to the new manager page
    get '/managers/new' do
        erb :'managers/new'
    end

    #3 get by id, dynamic
    get '/managers/:id' do
        @manager = Manager.find(params[:id])
        if @manager
             erb :'managers/show'
        else
            redirect '/managers'
        end

       
    end

    

    #4 adds new manager to database
    post '/managers' do
        manager = Manager.create(name: params[:name], age: params[:age])
        
        if manager.save
            redirect "/managers"
        else
            redirect "managers/new"
        end

    end

   

    #5 go to edit manager page
    get '/managers/:id/edit' do
        puts "Get here into edit page?"
        @manager = Manager.find(params[:id])
        puts @manager.name
        erb :'managers/edit'  
    end

    #6 edit by id and save
    patch '/managers/:id' do
        puts "can we get here?????????????????"

        manager= Manager.find(params[:id])
        manager.update(params[:manager])
        redirect "/managers/#{manager.id}"  
    end

    delete "/managers/:id" do
    manager = Manager.find(params[:id])
    manager.destroy
    redirect "/managers"
end


end