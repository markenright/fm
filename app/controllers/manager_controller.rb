class ManagerController < ApplicationController
#index page - list of managers - pick or create new

    get '/managers' do
        @managers = Manager.all
        erb :'managers/index'
    end






end